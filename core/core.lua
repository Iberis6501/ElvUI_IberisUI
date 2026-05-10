local IUI, E, L = unpack((select(2, ...)))

function IUI:SetupIberisUI()
	local pi = E:GetModule("PluginInstaller", true)
	if pi then
		pi:Queue(IUI.installTable)
	else
		DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r PluginInstaller 모듈 없음")
	end
end

function IUI:Initialize()
	self:RegisterChatCommand("iberisui", "SetupIberisUI")

	-- IberisUIDB는 SavedVariablesPerCharacter — 캐릭별 분리. charKey 매핑 불필요.
	IberisUIDB = IberisUIDB or {}

	-- 매 로그인마다 sticky 채널 재적용 (ChatTypeInfo는 세션마다 reset됨)
	if self.ApplyStickyChannels then self:ApplyStickyChannels() end

	-- DataTexts.lua:551 (panel nil 인덱스) 에러 방지
	-- ElvUI DT:UpdatePanelInfo가 등록되지 않은 panelName으로 호출되면 panel.db nil 인덱스 에러.
	-- panel을 우리가 dtPanels에 박을 때마다 발생 가능 (BUI custom panel 등록 시점 차이).
	-- 함수를 wrapping해서 panel이 결국 nil이면 silently return — ElvUI 동작 자체엔 무해.
	local DT = E:GetModule("DataTexts", true)
	if DT and DT.UpdatePanelInfo and not IUI._dtUpdateWrapped then
		local origUpdatePanelInfo = DT.UpdatePanelInfo
		DT.UpdatePanelInfo = function(self, panelName, panel, ...)
			if not panel then panel = DT.RegisteredPanels and DT.RegisteredPanels[panelName] end
			if not panel then return end  -- 등록 안 된 패널 → silently 무시
			return origUpdatePanelInfo(self, panelName, panel, ...)
		end
		IUI._dtUpdateWrapped = true
	end

	-- ElvUI / BenikUI 설치 마법사 자동 스킵.
	-- 우리 IUI:Init은 ElvUI E:Initialize() 후에 호출되므로 ElvUI 마법사가 이미 떠있을 수 있음.
	-- (1) install_complete 플래그 설정, (2) ElvUI InstallFrame 직접 닫기, (3) PluginInstaller 큐에서
	-- BenikUI 마법사 제거 — 세 단계로 강제 스킵.
	if E.private then
		E.private.install_complete = E.version
	end
	if E.db.benikui then
		E.db.benikui.installed = true
	end

	-- (2) ElvUI 자체 InstallFrame (E:Install로 띄운 별도 frame) 강제 닫기
	if E.InstallFrame then
		pcall(function() E.InstallFrame:Hide() end)
	end

	-- (3) PluginInstaller 큐에서 BenikUI/ElvUI 마법사 제거
	local PI = E:GetModule("PluginInstaller", true)
	if PI and PI.Installs then
		for i = #PI.Installs, 1, -1 do
			local install = PI.Installs[i]
			local name = install and install.Name or ""
			-- IberisUI 큐는 보존, 그 외 마법사 제거
			if not name:find("IberisUI") then
				table.remove(PI.Installs, i)
			end
		end
	end
	if _G.PluginInstallFrame and _G.PluginInstallFrame:IsShown() then
		pcall(function() _G.PluginInstallFrame:Hide() end)
	end

	-- ElvUI Chat 모듈의 PositionChats를 hook
	-- ElvUI Chat:Initialize → SetupChat → PositionChats(1번째)는 우리 hook 등록 전.
	-- 등록 후 강제로 한 번 더 호출 → 우리 hook trigger → 채팅 강제 도킹.
	local CH = E:GetModule("Chat", true)

	-- 한 채팅 frame이 패널과 정상 도킹된 상태인지 검증
	local function IsCorrectlyDocked(chat, panel, expectedW, expectedH)
		if not chat or not panel then return true end  -- 패널 없으면 검증 스킵
		local point, parent, _, x, y = chat:GetPoint(1)
		if point ~= "BOTTOMLEFT" or parent ~= panel then return false end
		if math.abs((x or 0) - 5) > 0.5 or math.abs((y or 0) - 5) > 0.5 then return false end
		local w, h = chat:GetWidth(), chat:GetHeight()
		if math.abs(w - expectedW) > 1 or math.abs(h - expectedH) > 1 then return false end
		return true
	end

	local function ForceDockChats(forceAll)
		if not (IberisUIDB and IberisUIDB.install_complete) then return end
		local pw = (CH.db and CH.db.panelWidth)  or 348
		local ph = (CH.db and CH.db.panelHeight) or 166
		local expW, expH = pw - 10, ph - 32

		pcall(function()
			-- 위치/크기가 정상이면 SetPoint 안 함 → 깜빡임 방지
			if ChatFrame1 and _G.LeftChatPanel then
				if forceAll or not IsCorrectlyDocked(ChatFrame1, _G.LeftChatPanel, expW, expH) then
					ChatFrame1:ClearAllPoints()
					ChatFrame1:SetPoint("BOTTOMLEFT", _G.LeftChatPanel, "BOTTOMLEFT", 5, 5)
					ChatFrame1:SetSize(expW, expH)
					ChatFrame1:SetUserPlaced(true)
					if FCF_SetLocked then FCF_SetLocked(ChatFrame1, true) end
				end
			end
			if ChatFrame4 and _G.RightChatPanel then
				if forceAll or not IsCorrectlyDocked(ChatFrame4, _G.RightChatPanel, expW, expH) then
					ChatFrame4:ClearAllPoints()
					ChatFrame4:SetPoint("BOTTOMLEFT", _G.RightChatPanel, "BOTTOMLEFT", 5, 5)
					ChatFrame4:SetSize(expW, expH)
					ChatFrame4:SetUserPlaced(true)
					if FCF_SetLocked then FCF_SetLocked(ChatFrame4, true) end
				end
			end
		end)
		-- panelSnap 항상 보존
		if E.db and E.db.chat then
			E.db.chat.panelSnapping    = true
			E.db.chat.panelSnapLeftID  = 1
			E.db.chat.panelSnapRightID = 4
		end
	end
	IUI._ForceDockChats = ForceDockChats

	-- 즉시 정상화 + lock flag로 무한 루프 방지.
	-- 외부 코드(ElvUI/BenikUI/Blizzard)가 ChatFrame1.SetPoint 또는 ClearAllPoints 호출하면
	-- 우리 hook이 즉시 "BOTTOMLEFT, LeftChatPanel, BOTTOMLEFT, 5, 5"로 강제. 시각적 깜빡임 없음.
	-- 우리 SetPoint도 hook trigger되지만 lock flag로 무한 루프 차단.
	local function HardLockChat(frame, panel)
		if not frame or not panel or frame.__iuiHardLocked then return end
		frame.__iuiHardLocked = true

		hooksecurefunc(frame, "SetPoint", function(self, point, parent)
			if self.__iuiInternalCall then return end
			-- 우리 의도 위치가 아니면 즉시 정상화
			if point ~= "BOTTOMLEFT" or parent ~= panel then
				self.__iuiInternalCall = true
				self:ClearAllPoints()
				self:SetPoint("BOTTOMLEFT", panel, "BOTTOMLEFT", 5, 5)
				self.__iuiInternalCall = false
			end
		end)

		hooksecurefunc(frame, "ClearAllPoints", function(self)
			if self.__iuiInternalCall then return end
			-- ClearAllPoints 직후 위치가 풀려있음 → 즉시 우리 위치로
			self.__iuiInternalCall = true
			self:SetPoint("BOTTOMLEFT", panel, "BOTTOMLEFT", 5, 5)
			self.__iuiInternalCall = false
		end)
	end

	if CH and not IUI._chatHookInstalled then
		-- PositionChats(복수) — 전체 갱신 시 우리 위치 + size 강제
		if CH.PositionChats then
			hooksecurefunc(CH, "PositionChats", ForceDockChats)
		end
		-- Unsnapped — panelSnapLeftID/RightID 즉시 복원
		if CH.Unsnapped then
			hooksecurefunc(CH, "Unsnapped", function()
				if E.db and E.db.chat then
					E.db.chat.panelSnapLeftID  = 1
					E.db.chat.panelSnapRightID = 4
				end
			end)
		end
		-- ChatFrame1/4 hard-lock — SetPoint/ClearAllPoints 호출되면 즉시 정상화
		if IberisUIDB and IberisUIDB.install_complete then
			HardLockChat(ChatFrame1, _G.LeftChatPanel)
			HardLockChat(ChatFrame4, _G.RightChatPanel)
		end

		IUI._chatHookInstalled = true

		-- 초기 강제 적용만 — repeating timer는 위치 변경 race를 일으켜 화면이 왔다갔다 함
		if IberisUIDB and IberisUIDB.install_complete then
			E:Delay(1, function() ForceDockChats(true) end)
		end
	end

	-- TacoTip patch (마법사 미실행 캐릭이라도 ReloadUI마다 자동 적용)
	-- - InterfaceOptionsFrame_OpenToCategory wrapper (Anniversary deprecated 대응)
	-- - 마우스오버 NotifyInspect (특성 캐시 갱신)
	-- - 길드명 UTF-8 truncate
	if IUI.ApplyTacoTipPatches then
		pcall(function() IUI:ApplyTacoTipPatches() end)
	end

	-- 설치 미완료 시 마법사 자동 실행
	if not IberisUIDB.install_complete then
		IUI:SetupIberisUI()
	end
end
