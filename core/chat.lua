local IUI, E, L = unpack((select(2, ...)))

-- chat-cache.txt 서약선 실측값
-- Window 1 (일반)  : 좌측 패널, BOTTOMLEFT
-- Window 4 (전리품) : 우측 BOTTOMRIGHT (DOCKED 0)
-- Window 5 (길드&파티): 좌측 패널 탭3
-- 채팅창 크기는 IUI:GetProfileData().chatFrames에서 조회

-- Window 1 (일반) 메시지 그룹
local WIN1_GROUPS = {
	"SYSTEM","SAY","EMOTE","YELL","WHISPER","PARTY","PARTY_LEADER",
	"RAID","RAID_LEADER","RAID_WARNING","GUILD","OFFICER",
	"MONSTER_SAY","MONSTER_YELL","MONSTER_EMOTE","MONSTER_WHISPER",
	"MONSTER_BOSS_EMOTE","MONSTER_BOSS_WHISPER",
	"ERRORS","AFK","DND","IGNORED",
	"BG_HORDE","BG_ALLIANCE","BG_NEUTRAL",
	"CHANNEL","ACHIEVEMENT","GUILD_ACHIEVEMENT",
	"BN_WHISPER","BN_WHISPER_INFORM","BN_CONVERSATION",
	"BN_INLINE_TOAST_ALERT","CURRENCY","BN_WHISPER_PLAYER_OFFLINE",
	"PET_BATTLE_INFO","INSTANCE_CHAT","INSTANCE_CHAT_LEADER",
	"GUILD_ITEM_LOOTED","PING",
}
-- Window 4 (전리품) 메시지 그룹
local WIN4_GROUPS = {
	"COMBAT_FACTION_CHANGE","SKILL","LOOT","MONEY",
	"COMBAT_XP_GAIN","COMBAT_HONOR_GAIN",
}
-- Window 5 (길드&파티) 메시지 그룹
local WIN5_GROUPS = {
	"SYSTEM","SAY","EMOTE","YELL","WHISPER","PARTY","PARTY_LEADER",
	"RAID","RAID_LEADER","RAID_WARNING","GUILD","OFFICER",
	"CHANNEL","BN_WHISPER","INSTANCE_CHAT","INSTANCE_CHAT_LEADER",
}

-- 보조 패널(chatPanelCount==3)에는 ChatFrame5(커뮤니티)를 단독 도킹.
-- 별도 ChatFrame을 새로 만들지 않음 — 기존 "길드&파티" 탭(=ChatFrame5)을 좌측 탭에서 빼서 보조 패널로 이동.
--
-- 구버전(초기 구현)에서 만든 "메모" ChatFrame은 chat-cache에 잔존할 수 있어 cleanup 대상.
local LEGACY_EXTRA_CHAT_NAME = "메모"

-- WoW 기본은 RAID_WARNING(공격대 경보)이 sticky 아님 → /경보 한 번 보내면 다음 엔터 시 SAY로 복귀.
-- 매 게임 세션마다 ChatTypeInfo가 reset되므로 PLAYER_LOGIN 이후 매번 다시 sticky=1 박아야 함.
function IUI:ApplyStickyChannels()
	if not ChatTypeInfo then return end
	if ChatTypeInfo.RAID_WARNING then
		ChatTypeInfo.RAID_WARNING.sticky = 1
	end
end

-- ChatFrame region 텍스처 이름 (FCF_FadeOutChatFrame이 순회하는 9개)
local CHAT_REGIONS = {
	"Background", "TopLeftTexture", "BottomLeftTexture",
	"TopRightTexture", "BottomRightTexture",
	"LeftTexture", "RightTexture", "BottomTexture", "TopTexture",
}

-- FCF_FadeOutChatFrame nil 에러 + ChatFrame5 흰 배경 동시 차단.
-- (1) ChatFrame 본체 + 9개 region 객체의 oldAlpha를 1로 초기화 — max(GetAlpha, oldAlpha) nil 에러 방지.
-- (2) ChatFrame5는 ElvUI Chat 모듈이 styling 안 해서 Blizzard 기본 region 텍스처가 그대로 노출됨
--     → 텍스처를 비우고 SetAlpha(0) — fade 사이클에서 흰색 노출 차단.
-- 매 로그인마다 호출되어야 함 (region 객체는 SV 저장 안 됨 → 매 세션 nil 상태로 시작).
function IUI:ApplyChatFadeFix()
	for i = 1, NUM_CHAT_WINDOWS do
		local cf = _G["ChatFrame"..i]
		if cf then
			if cf.oldAlpha == nil then cf.oldAlpha = 1 end
			for _, r in ipairs(CHAT_REGIONS) do
				local obj = _G["ChatFrame"..i..r]
				if obj and obj.oldAlpha == nil then obj.oldAlpha = 1 end
			end
		end
	end

	-- ChatFrame5(커뮤니티) region 텍스처 강제 제거 — 흰 배경 차단
	if _G.ChatFrame5 then
		for _, r in ipairs(CHAT_REGIONS) do
			local obj = _G["ChatFrame5"..r]
			if obj then
				if obj.SetTexture then pcall(obj.SetTexture, obj, nil) end
				pcall(obj.SetAlpha, obj, 0)
			end
		end
	end
end

local function applyMsgGroups(frame, groups)
	if not frame then return end
	-- 기존 그룹 전부 제거 후 재설정
	for _, event in ipairs({"SYSTEM","SAY","PARTY","RAID","GUILD","OFFICER",
		"WHISPER","CHANNEL","ERRORS","COMBAT_MISC_INFO","COMBAT_XP_GAIN",
		"COMBAT_HONOR_GAIN","COMBAT_FACTION_CHANGE","SKILL","LOOT","MONEY",
		"OPENING","TRADESKILLS","PET_INFO","AFK","DND","IGNORED",
		"MONSTER_SAY","MONSTER_PARTY","MONSTER_YELL","MONSTER_EMOTE","MONSTER_WHISPER",
		"BG_HORDE","BG_ALLIANCE","BG_NEUTRAL","ACHIEVEMENT","GUILD_ACHIEVEMENT",
		"BN_WHISPER","BN_WHISPER_INFORM","INSTANCE_CHAT","INSTANCE_CHAT_LEADER",
		"GUILD_ITEM_LOOTED","PING","CURRENCY","PET_BATTLE_INFO",
		"EMOTE","YELL","PARTY_LEADER","RAID_LEADER","RAID_WARNING",
		"BN_CONVERSATION","BN_INLINE_TOAST_ALERT","BN_WHISPER_PLAYER_OFFLINE",
		"MONSTER_BOSS_EMOTE","MONSTER_BOSS_WHISPER",
	}) do
		pcall(ChatFrame_RemoveMessageGroup, frame, event)
	end
	for _, event in ipairs(groups) do
		pcall(ChatFrame_AddMessageGroup, frame, event)
	end
end

-- 채팅 프레임을 패널에 강제로 점착(SetPoint)
local function DockChatFrameToPanel(frame, panel, padding)
	if not frame or not panel then return end
	padding = padding or 1
	pcall(function()
		FCF_SetLocked(frame, false)
		frame:SetUserPlaced(false)
		frame:ClearAllPoints()
		frame:SetPoint("BOTTOMLEFT", panel, "BOTTOMLEFT",  padding,  padding)
		frame:SetPoint("TOPRIGHT",   panel, "TOPRIGHT",   -padding, -padding)
	end)
end

-- ============================================================
-- IberisExtraChatPanel — 좌측 채팅 패널 바로 위 1px 간격 보조 패널
-- ElvUI는 Left/RightChatPanel 두 개만 만들므로 3번째 패널은 IberisUI가 자체 생성.
-- LeftChatPanel과 동일 크기 (E.db.chat.panelWidth × panelHeight).
-- backdrop은 ElvUI media 색상 차용 — LeftChatPanel과 비슷한 톤.
-- ============================================================
function IUI:EnsureExtraChatPanel()
	if _G.IberisExtraChatPanel then return _G.IberisExtraChatPanel end
	if not _G.LeftChatPanel then return nil end

	local panel = CreateFrame("Frame", "IberisExtraChatPanel", E.UIParent)
	panel:SetFrameStrata("BACKGROUND")
	panel:SetFrameLevel(_G.LeftChatPanel:GetFrameLevel() or 1)

	local pw = E.db.chat.panelWidth  or 348
	local ph = E.db.chat.panelHeight or 166
	panel:SetSize(pw, ph)

	-- LeftChatPanel 바로 위 6px 간격 (LeftChatPanel의 TOPLEFT 위에 BOTTOMLEFT 정렬)
	panel:ClearAllPoints()
	panel:SetPoint("BOTTOMLEFT", _G.LeftChatPanel, "TOPLEFT", 0, 6)

	-- ElvUI 패널 스타일 backdrop (LeftChatPanel과 동일 톤)
	local bdTemplate = BackdropTemplateMixin and "BackdropTemplate" or nil
	local bd = CreateFrame("Frame", "IberisExtraChatPanelBackdrop", panel, bdTemplate)
	bd:SetAllPoints(panel)
	bd:SetFrameLevel(math.max(0, panel:GetFrameLevel() - 1))
	pcall(function()
		bd:SetBackdrop({
			bgFile   = E.media and E.media.blankTex or [[Interface\Buttons\WHITE8x8]],
			edgeFile = E.media and E.media.blankTex or [[Interface\Buttons\WHITE8x8]],
			tile = false, tileSize = 0, edgeSize = 1,
			insets = { left = 0, right = 0, top = 0, bottom = 0 },
		})
		local bgC = (E.media and E.media.backdropfadecolor) or {0, 0, 0, 0.7}
		local bC  = (E.media and E.media.bordercolor)       or {0, 0, 0, 1}
		bd:SetBackdropColor(unpack(bgC))
		bd:SetBackdropBorderColor(unpack(bC))
	end)
	panel.backdrop = bd

	-- BenikUI 'Outside' 스타일 — 패널 상단에 직업색 가로 막대 (LeftChatPanel.backdrop과 동일 패턴).
	-- BenikUI가 모든 frame metatable에 :BuiStyle 추가. benikuiStyle 비활성 시 자체 return.
	if bd.BuiStyle then
		pcall(function() bd:BuiStyle('Outside') end)
	end

	-- mover 생성하지 않음 — LeftChatPanel을 옮기면 보조 패널도 anchor 따라 자동 이동.
	panel:Show()
	return panel
end

-- chatPanelCount 조회 (IberisUIDB → 기본 2)
local function GetChatPanelCount()
	if IberisUIDB and IberisUIDB.chatPanelCount then
		return IberisUIDB.chatPanelCount
	end
	return 2
end

-- 구버전 "메모" ChatFrame cleanup (chat-cache에 잔존 가능)
local function CloseLegacyExtraChat()
	for i = 1, NUM_CHAT_WINDOWS do
		local name = FCF_GetChatWindowInfo(i)
		if name == LEGACY_EXTRA_CHAT_NAME then
			local cf = _G["ChatFrame"..i]
			if cf and FCF_Close then pcall(function() FCF_Close(cf) end) end
			break
		end
	end
end

-- ChatFrame5(커뮤니티)를 보조 패널에 단독 도킹.
-- 신규 유저 환경에 ChatFrame5가 없으면 먼저 생성 (SetupChatWindows 4-A 블록과 동일).
function IUI:SetupExtraChat()
	local panel = IUI:EnsureExtraChatPanel()
	if not panel then return nil end

	-- 구버전 "메모" cleanup
	CloseLegacyExtraChat()

	-- ChatFrame5 없으면 생성
	if not _G.ChatFrame5 and FCF_OpenNewWindow then
		pcall(function() FCF_OpenNewWindow("커뮤니티") end)
	end
	local cf = _G.ChatFrame5
	if not cf then return nil end

	local pw = E.db.chat.panelWidth  or 348
	local ph = E.db.chat.panelHeight or 166

	pcall(function()
		FCF_SetWindowName(cf, "커뮤니티")
		FCF_UnDockFrame(cf)   -- 좌측 docker에서 빼서 단독 도킹
		FCF_SetLocked(cf, true)
		cf:SetMovable(false)
		cf:Show()
		cf:ClearAllPoints()
		cf:SetPoint("BOTTOMLEFT", panel, "BOTTOMLEFT", 5, 5)
		cf:SetSize(pw - 10, ph - 32)
		cf:SetUserPlaced(true)
		if FCF_SavePositionAndDimensions then FCF_SavePositionAndDimensions(cf) end
	end)

	-- ChatFrame5의 메시지 그룹(WIN5)은 SetupChatWindows 4-B에서 이미 적용됨 — 여기선 건드리지 않음
	IUI._extraChatFrame = cf
	return cf
end

-- chatPanelCount==2로 전환 시: ChatFrame5를 좌측 docker로 복귀 + 보조 패널 hide
function IUI:TeardownExtraChat()
	-- 구버전 "메모" 잔존도 정리
	CloseLegacyExtraChat()

	-- ChatFrame5 hard-lock 해제 후 좌측 docker로 복귀
	if _G.ChatFrame5 then
		if IUI._HardLockChat then
			pcall(function() IUI._HardLockChat(_G.ChatFrame5, nil) end)
		end
		pcall(function()
			_G.ChatFrame5:SetUserPlaced(false)
			FCF_DockFrame(_G.ChatFrame5)  -- ChatFrame1 docker(primary)에 탭으로 복귀
			if FCF_SavePositionAndDimensions then FCF_SavePositionAndDimensions(_G.ChatFrame5) end
		end)
	end
	IUI._extraChatFrame = nil
	if _G.IberisExtraChatPanel then
		_G.IberisExtraChatPanel:Hide()
	end
end

-- numPanels: 2 (좌+우) 또는 3 (좌+보조+우). nil이면 IberisUIDB.chatPanelCount 또는 기본 2.
function IUI:SetupChatWindows(numPanels)
	if numPanels == 2 or numPanels == 3 then
		IberisUIDB = IberisUIDB or {}
		IberisUIDB.chatPanelCount = numPanels
	else
		numPanels = GetChatPanelCount()
	end

	-- 1. ElvUI 기본 채팅 설치
	if E.SetupChat then
		pcall(function() E:SetupChat() end)
	end

	-- 2. panelSnapping 활성 + 좌/우 ID 매핑
	-- 핵심: panelSnapping=true가 false면 CH:FindChatWindows()가 즉시 return
	-- → CH.LeftChatWindow가 nil이 되어 PositionChat이 좌측 도킹 분기를 안 탐
	E.db.chat.panelSnapping    = true
	E.db.chat.panelSnapLeftID  = 1
	E.db.chat.panelSnapRightID = 4

	-- 3. 캐시된 LeftChatWindow / RightChatWindow 무효화 → 재탐색 강제
	local CH = E:GetModule("Chat", true)
	if CH then
		CH.LeftChatWindow  = nil
		CH.RightChatWindow = nil
	end

	-- 4-A. ChatFrame5 = "커뮤니티" 탭 생성
	-- 신규 유저 환경에는 ChatFrame5가 없으니 FCF_OpenNewWindow로 강제 생성.
	-- [서약선] WIN5는 "길드&파티"였으나 신규 유저용 이름은 "커뮤니티" (메시지 그룹은 동일).
	-- numPanels==2: 좌측 패널 탭으로 도킹 (Blizzard docker)
	-- numPanels==3: 보조 패널 단독 도킹은 SetupExtraChat에서 처리 (여기선 도킹하지 않음)
	if not _G.ChatFrame5 and FCF_OpenNewWindow then
		pcall(function() FCF_OpenNewWindow("커뮤니티") end)
	end
	if _G.ChatFrame5 then
		pcall(function()
			FCF_SetWindowName(_G.ChatFrame5, "커뮤니티")
			_G.ChatFrame5:Show()
			if numPanels == 2 then
				FCF_DockFrame(_G.ChatFrame5)  -- ChatFrame1 (docker primary)에 탭으로 도킹
			end
		end)
	end

	-- 4-B. 메시지 그룹 강제 설정
	applyMsgGroups(ChatFrame1, WIN1_GROUPS)  -- 일반 → 좌측 패널 탭1
	applyMsgGroups(ChatFrame4, WIN4_GROUPS)  -- 전리품 → 우측 패널
	applyMsgGroups(ChatFrame5, WIN5_GROUPS)  -- 커뮤니티 (서약선의 길드&파티 그룹) → 좌측 패널 탭

	-- 5. ChatFrame1 / ChatFrame4 강제 도킹 + chat-cache.txt에 위치 저장
	-- 핵심: SetUserPlaced(true) + FCF_SavePositionAndDimensions로 명시 저장 → ReloadUI 후에도 유지
	local pw = E.db.chat.panelWidth  or 348
	local ph = E.db.chat.panelHeight or 166

	if ChatFrame1 and _G.LeftChatPanel then
		pcall(function()
			FCF_SetLocked(ChatFrame1, true)
			ChatFrame1:SetMovable(false)
			-- Blizzard docker에 도킹 (primary index=1)
			if FCF_DockFrame then FCF_DockFrame(ChatFrame1, 1) end
			ChatFrame1:ClearAllPoints()
			ChatFrame1:SetPoint("BOTTOMLEFT", _G.LeftChatPanel, "BOTTOMLEFT", 5, 5)
			ChatFrame1:SetSize(pw - 10, ph - 32)
			ChatFrame1:SetUserPlaced(true)
			-- chat-cache.txt에 위치 명시 저장 (ReloadUI 후 ElvUI 적용 전 Blizzard가 위치 복원)
			if FCF_SavePositionAndDimensions then FCF_SavePositionAndDimensions(ChatFrame1) end
		end)
	end

	if ChatFrame4 and _G.RightChatPanel then
		pcall(function()
			FCF_SetLocked(ChatFrame4, true)
			ChatFrame4:SetMovable(false)
			-- ChatFrame4는 DOCKED 0 = 우측 자유 (docker에 도킹 안 함)
			if FCF_UnDockFrame then FCF_UnDockFrame(ChatFrame4) end
			ChatFrame4:Show()
			ChatFrame4:ClearAllPoints()
			ChatFrame4:SetPoint("BOTTOMLEFT", _G.RightChatPanel, "BOTTOMLEFT", 5, 5)
			ChatFrame4:SetSize(pw - 10, ph - 32)
			ChatFrame4:SetUserPlaced(true)
			if FCF_SavePositionAndDimensions then FCF_SavePositionAndDimensions(ChatFrame4) end
		end)
	end

	-- 6. PositionChats 호출 → CH.LeftChatWindow / RightChatWindow 재탐색 + 도킹 갱신
	if CH then
		if CH.PositionChats  then pcall(function() CH:PositionChats()  end) end
		if CH.BuildChatFrame then pcall(function() CH:BuildChatFrame() end) end
	end

	-- 7. PositionChats 후 한 번 더 강제 도킹 + 저장
	DockChatFrameToPanel(ChatFrame1, _G.LeftChatPanel,  5)
	DockChatFrameToPanel(ChatFrame4, _G.RightChatPanel, 5)
	if ChatFrame1 then
		pcall(function()
			ChatFrame1:SetUserPlaced(true)
			if FCF_SavePositionAndDimensions then FCF_SavePositionAndDimensions(ChatFrame1) end
		end)
	end
	if ChatFrame4 then
		pcall(function()
			ChatFrame4:SetUserPlaced(true)
			if FCF_SavePositionAndDimensions then FCF_SavePositionAndDimensions(ChatFrame4) end
		end)
	end

	-- 8. panelSnap 재적용
	E.db.chat.panelSnapping    = true
	E.db.chat.panelSnapLeftID  = 1
	E.db.chat.panelSnapRightID = 4

	-- 9. sticky 채널 즉시 적용 (RAID_WARNING)
	IUI:ApplyStickyChannels()

	-- 10. ChatFrame oldAlpha nil 에러 + ChatFrame5 흰 배경 차단
	IUI:ApplyChatFadeFix()

	-- 11. 보조 패널/ChatFrame 처리 (numPanels 분기)
	if numPanels == 3 then
		IUI:SetupExtraChat()
		-- core.lua의 HardLockChat 즉시 적용 (다음 ReloadUI 전이라도 패널 이동 차단)
		if IUI._HardLockChat and IUI._extraChatFrame and _G.IberisExtraChatPanel then
			pcall(function()
				IUI._HardLockChat(IUI._extraChatFrame, _G.IberisExtraChatPanel)
			end)
		end
	else
		IUI:TeardownExtraChat()
	end
	-- 위치/크기 재정렬 강제 (core.lua의 ForceDockChats는 보조 패널까지 처리)
	if IUI._ForceDockChats then
		pcall(function() IUI._ForceDockChats(true) end)
	end

	local msg = (numPanels == 3)
		and "|cffff9900IberisUI|r 채팅 설정 완료 — 좌(일반) + 보조(커뮤니티) + 우(전리품) 3패널."
		or  "|cffff9900IberisUI|r 채팅 설정 완료 — 좌우 패널 도킹 + chat-cache 저장."
	DEFAULT_CHAT_FRAME:AddMessage(msg)
	-- PluginInstallStepComplete는 마법사 frame일 때만 존재. 자동 재적용 시점에는 nil 가능.
	if PluginInstallStepComplete then
		PluginInstallStepComplete.message = (numPanels == 3)
			and "|cffff9900IberisUI|r 채팅 설정 완료 (3패널)"
			or  "|cffff9900IberisUI|r 채팅 설정 완료"
		PluginInstallStepComplete:Show()
	end
end
