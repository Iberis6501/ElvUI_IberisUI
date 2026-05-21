local IUI, E, L = unpack((select(2, ...)))

function IUI:SetupIberisUI(input)
	-- 서브커맨드 분기 (인자 없으면 인스톨 마법사)
	local arg, rest
	if type(input) == "string" then
		arg, rest = input:match("^%s*(%S+)%s*(.*)$")
	end
	if arg == "testbars" then
		IUI:TestAuraBars(tonumber(rest))
		return
	end

	local pi = E:GetModule("PluginInstaller", true)
	if pi then
		pi:Queue(IUI.installTable)
	else
		DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r PluginInstaller 모듈 없음")
	end
end

-- 정렬 테스트용 가짜 aurabar 표시 (player + target).
-- /iui testbars N → N개 가짜 바 표시. /iui testbars 0 → 제거.
-- 실제 aurabar 위에 그냥 같은 부모 frame에 얹어서 시각만 흉내. 실 버프 안 걸어도 정렬 확인 가능.
function IUI:TestAuraBars(count)
	count = tonumber(count) or 5

	-- 기존 테스트 바 정리
	if IUI._testBars then
		for _, list in pairs(IUI._testBars) do
			for _, bar in ipairs(list) do
				bar:Hide(); bar:ClearAllPoints(); bar:SetParent(nil)
			end
		end
		IUI._testBars = nil
	end

	if count <= 0 then
		DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00IberisUI|r 테스트 바 제거")
		return
	end

	local UF = E:GetModule("UnitFrames", true)
	if not UF then
		DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r UnitFrames 모듈 없음")
		return
	end

	IUI._testBars = {}
	for _, unitName in ipairs({ "player", "target" }) do
		local frame = UF.units and UF.units[unitName]
		local bars  = frame and frame.AuraBars
		local db    = E.db.unitframe.units[unitName] and E.db.unitframe.units[unitName].aurabar
		if bars and db then
			local below     = db.anchorPoint == "BELOW"
			local barWidth  = bars.width or (frame.UNIT_WIDTH and (frame.UNIT_WIDTH - 30)) or 200
			local cdFontSize = (E.db.cooldown and E.db.cooldown.aurabars and E.db.cooldown.aurabars.fontSize) or 12
			local list = {}
			for i = 1, count do
				local bar = CreateFrame("Frame", nil, bars, "BackdropTemplate")
				bar:SetSize(barWidth, db.height)
				bar:SetBackdrop({ bgFile = E.media.blankTex })
				local r = 0.20 + ((i-1) % 4) * 0.12
				local g = 0.55 + ((i-1) % 3) * 0.10
				local b = 0.20
				bar:SetBackdropColor(r, g, b, 0.85)

				local name = bar:CreateFontString(nil, "OVERLAY")
				name:FontTemplate(E.media.normFont, E.db.unitframe.fontSize or 11, E.db.unitframe.fontOutline or "OUTLINE")
				name:SetPoint("LEFT", bar, "LEFT", 4, 0)
				name:SetJustifyH("LEFT")
				name:SetText(unitName .. " test " .. i)

				local timeText = bar:CreateFontString(nil, "OVERLAY")
				timeText:FontTemplate(E.media.normFont, cdFontSize, "OUTLINE")
				timeText:SetPoint("RIGHT", bar, "RIGHT", -4, 0)
				timeText:SetJustifyH("RIGHT")
				timeText:SetText(string.format("%d:%02d", math.random(0, 9), math.random(0, 59)))

				local prev = list[i-1]
				local spacing = db.spacing or 0
				if prev then
					if below then
						bar:SetPoint("TOP", prev, "BOTTOM", 0, -spacing)
					else
						bar:SetPoint("BOTTOM", prev, "TOP", 0, spacing)
					end
				else
					if below then
						bar:SetPoint("TOP", bars, "TOP", 0, 0)
					else
						bar:SetPoint("BOTTOM", bars, "BOTTOM", 0, 0)
					end
				end
				bar:Show()
				table.insert(list, bar)
			end
			IUI._testBars[unitName] = list
		end
	end

	DEFAULT_CHAT_FRAME:AddMessage(string.format("|cff00ff00IberisUI|r 테스트 바 %d개 표시 (player+target). 제거: /iui testbars 0", count))
end

-- 클릭하면 URL 입력박스 다이얼로그를 띄움 (Ctrl+C로 복사 후 ESC/Enter로 닫기)
function IUI:InstallURLHandler()
	if IUI._urlHookInstalled then return end
	IUI._urlHookInstalled = true

	StaticPopupDialogs["IBERISUI_URL"] = {
		text = "URL 복사: Ctrl+C 후 닫기",
		button1 = CLOSE,
		hasEditBox = 1,
		editBoxWidth = 350,
		OnShow = function(self)
			-- 신형 StaticPopup_Game(Anniversary)는 self.EditBox, 레거시는 self.editBox
			local eb = self.EditBox or self.editBox
			if eb then
				eb:SetText(self.data or "")
				eb:HighlightText()
				eb:SetFocus()
			end
		end,
		EditBoxOnEnterPressed  = function(self) self:GetParent():Hide() end,
		EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
		EditBoxOnTextChanged   = function(self) self:SetText(self:GetParent().data or "") end,
		timeout = 0, whileDead = 1, hideOnEscape = 1, preferredIndex = 3,
	}

	-- SetItemRef를 hook해서 "url:..." hyperlink 클릭 시 우리 다이얼로그 표시
	local origSetItemRef = _G.SetItemRef
	_G.SetItemRef = function(link, text, button, chatFrame)
		if link and link:sub(1, 4) == "url:" then
			StaticPopup_Show("IBERISUI_URL", nil, nil, link:sub(5))
			return
		end
		return origSetItemRef(link, text, button, chatFrame)
	end
end

function IUI:PrintLoadMessage()
	if not DEFAULT_CHAT_FRAME then return end
	IUI:InstallURLHandler()

	local v = IUI.Version or "?"
	local prev = IberisUIDB.lastSeenVersion
	local title = IUI.Title or "IberisUI "
	local cfUrl = "https://www.curseforge.com/wow/addons/iberisui"
	local cfLink = format("|cffffd200|Hurl:%s|h[%s]|h|r", cfUrl, cfUrl)

	if prev == nil then
		DEFAULT_CHAT_FRAME:AddMessage(format("%s버전 %s이 로드되었습니다.", title, v))
		DEFAULT_CHAT_FRAME:AddMessage(format("명령어 |cff7fff7f/iberisui|r — CurseForge: %s", cfLink))
	elseif prev ~= v then
		DEFAULT_CHAT_FRAME:AddMessage(format("%s버전 %s이 로드되었습니다. (이전: v%s)", title, v, prev))
		DEFAULT_CHAT_FRAME:AddMessage(format("변경 사항 확인: %s", cfLink))
	else
		DEFAULT_CHAT_FRAME:AddMessage(format("%s버전 %s이 로드되었습니다.", title, v))
	end

	IberisUIDB.lastSeenVersion = v
end

function IUI:Initialize()
	self:RegisterChatCommand("iberisui", "SetupIberisUI")
	self:RegisterChatCommand("iui",      "SetupIberisUI")  -- 짧은 별칭

	-- IberisUIDB는 SavedVariablesPerCharacter — 캐릭별 분리. charKey 매핑 불필요.
	IberisUIDB = IberisUIDB or {}

	-- 매 로그인마다 sticky 채널 재적용 (ChatTypeInfo는 세션마다 reset됨)
	if self.ApplyStickyChannels then self:ApplyStickyChannels() end

	-- ChatFrame oldAlpha nil 에러 + ChatFrame5 흰 배경 차단.
	-- region 객체는 SV 저장 안 됨 → 매 세션 nil 상태. ChatFrame5는 SV에서 복원되므로
	-- E:Delay로 살짝 늦춰 ChatFrame5 복원 후 region 텍스처 제거가 확실히 적용되도록 함.
	if self.ApplyChatFadeFix then
		pcall(function() self:ApplyChatFadeFix() end)
		E:Delay(1, function() pcall(function() IUI:ApplyChatFadeFix() end) end)
	end

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

	-- AdditionalPower(드루이드 변신 마나바) 가시성 fix.
	-- ClassBars.lua:Construct_AdditionalPowerBar가 element.displayPairs를 세팅하지 않아
	-- oUF additionalpower.lua:191의 Visibility 검사에서 항상 nil → ElementDisable → :Hide().
	-- ClassPower bars에는 UF.ALT_POWER_INFO가 박히지만(line 431) AdditionalPower엔 누락됨.
	-- Configure_ClassBar 호출 시마다 backfill + 이미 만들어진 player frame에도 즉시 주입.
	local UF = E:GetModule("UnitFrames", true)
	if UF and UF.Configure_ClassBar and UF.ALT_POWER_INFO and not IUI._additionalPowerHooked then
		IUI._additionalPowerHooked = true
		hooksecurefunc(UF, "Configure_ClassBar", function(_, frame)
			if frame and frame.AdditionalPower and not frame.AdditionalPower.displayPairs then
				frame.AdditionalPower.displayPairs = UF.ALT_POWER_INFO
			end
		end)
		if _G.ElvUF_Player and _G.ElvUF_Player.AdditionalPower and not _G.ElvUF_Player.AdditionalPower.displayPairs then
			_G.ElvUF_Player.AdditionalPower.displayPairs = UF.ALT_POWER_INFO
			if _G.ElvUF_Player.AdditionalPower.ForceUpdate then
				pcall(function() _G.ElvUF_Player.AdditionalPower:ForceUpdate() end)
			end
		end
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

			-- 보조 패널/ChatFrame (chatPanelCount==3일 때만)
			if IberisUIDB.chatPanelCount == 3 then
				local panel = _G.IberisExtraChatPanel
				local extra = IUI._extraChatFrame

				-- 패널 위치 강제 — LeftChatPanel 바로 위 6px 간격
				if panel and _G.LeftChatPanel then
					local p, parent, _, x, y = panel:GetPoint(1)
					if forceAll or p ~= "BOTTOMLEFT" or parent ~= _G.LeftChatPanel
						or math.abs((x or 0) - 0) > 0.5 or math.abs((y or 0) - 6) > 0.5 then
						panel:ClearAllPoints()
						panel:SetPoint("BOTTOMLEFT", _G.LeftChatPanel, "TOPLEFT", 0, 6)
						panel:SetSize(pw, ph)
					end
				end

				-- 보조 ChatFrame 도킹 강제
				if extra and panel then
					if forceAll or not IsCorrectlyDocked(extra, panel, expW, expH) then
						extra:ClearAllPoints()
						extra:SetPoint("BOTTOMLEFT", panel, "BOTTOMLEFT", 5, 5)
						extra:SetSize(expW, expH)
						extra:SetUserPlaced(true)
						if FCF_SetLocked then FCF_SetLocked(extra, true) end
					end
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
	-- 외부 코드(ElvUI/BenikUI/Blizzard)가 ChatFrame.SetPoint 또는 ClearAllPoints 호출하면
	-- 우리 hook이 즉시 정상 위치로 복원. 시각적 깜빡임 없음.
	--
	-- panel은 frame.__iuiHardLockPanel에 박아 동적 참조 — chatPanelCount 토글 시
	-- ChatFrame5의 lock 대상을 LeftChatPanel ↔ IberisExtraChatPanel 전환 가능.
	-- panel == nil 이면 hook 무동작 (lock 해제 효과).
	local function HardLockChat(frame, panel)
		if not frame then return end
		frame.__iuiHardLockPanel = panel  -- nil 허용 (lock 해제)
		if frame.__iuiHardLocked then return end
		frame.__iuiHardLocked = true

		hooksecurefunc(frame, "SetPoint", function(self, point, parent)
			if self.__iuiInternalCall then return end
			local p = self.__iuiHardLockPanel
			if not p then return end
			-- 우리 의도 위치가 아니면 즉시 정상화
			if point ~= "BOTTOMLEFT" or parent ~= p then
				self.__iuiInternalCall = true
				self:ClearAllPoints()
				self:SetPoint("BOTTOMLEFT", p, "BOTTOMLEFT", 5, 5)
				self.__iuiInternalCall = false
			end
		end)

		hooksecurefunc(frame, "ClearAllPoints", function(self)
			if self.__iuiInternalCall then return end
			local p = self.__iuiHardLockPanel
			if not p then return end
			-- ClearAllPoints 직후 위치가 풀려있음 → 즉시 우리 위치로
			self.__iuiInternalCall = true
			self:SetPoint("BOTTOMLEFT", p, "BOTTOMLEFT", 5, 5)
			self.__iuiInternalCall = false
		end)
	end
	-- chat.lua에서도 호출 가능하게 노출 (HardLockChat 호출 / panel = nil로 lock 해제)
	IUI._HardLockChat = HardLockChat

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
			E:Delay(1, function()
				-- chatPanelCount==3이면 보조 패널/ChatFrame 복구 후 hard-lock
				if IberisUIDB.chatPanelCount == 3 and IUI.SetupExtraChat then
					pcall(function() IUI:SetupExtraChat() end)
					if IUI._extraChatFrame and _G.IberisExtraChatPanel then
						HardLockChat(IUI._extraChatFrame, _G.IberisExtraChatPanel)
					end
				end
				ForceDockChats(true)
			end)
		end
	end

	-- TacoTip patch (마법사 미실행 캐릭이라도 ReloadUI마다 자동 적용)
	-- - InterfaceOptionsFrame_OpenToCategory wrapper (Anniversary deprecated 대응)
	-- - 마우스오버 NotifyInspect (특성 캐시 갱신)
	-- - 길드명 UTF-8 truncate
	if IUI.ApplyTacoTipPatches then
		pcall(function() IUI:ApplyTacoTipPatches() end)
	end

	-- 로딩/업데이트 안내 메시지
	IUI:PrintLoadMessage()

	-- 설치 미완료 시 마법사 자동 실행
	if not IberisUIDB.install_complete then
		IUI:SetupIberisUI()
	end
end
