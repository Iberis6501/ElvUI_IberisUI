local IUI, E, L = unpack((select(2, ...)))

-- 알려진 모든 메시지 그룹 (초기화용)
local ALL_GROUPS = {
	"SYSTEM", "SAY", "EMOTE", "YELL", "WHISPER", "PARTY", "PARTY_LEADER",
	"RAID", "RAID_LEADER", "RAID_WARNING", "GUILD", "OFFICER", "CHANNEL",
	"ACHIEVEMENT", "GUILD_ACHIEVEMENT", "INSTANCE_CHAT", "INSTANCE_CHAT_LEADER",
	"BN_WHISPER", "BN_WHISPER_INFORM", "BN_CONVERSATION", "BN_INLINE_TOAST_ALERT",
	"BN_WHISPER_PLAYER_OFFLINE", "CURRENCY", "PING", "GUILD_ITEM_LOOTED",
	"PET_BATTLE_INFO", "OPENING", "TRADESKILLS", "PET_INFO",
	"COMBAT_XP_GAIN", "COMBAT_HONOR_GAIN", "COMBAT_MISC_INFO",
	"COMBAT_FACTION_CHANGE", "SKILL", "LOOT", "MONEY", "ERRORS",
	"AFK", "DND", "IGNORED", "BG_HORDE", "BG_ALLIANCE", "BG_NEUTRAL",
	"MONSTER_SAY", "MONSTER_YELL", "MONSTER_EMOTE", "MONSTER_WHISPER",
	"MONSTER_BOSS_EMOTE", "MONSTER_BOSS_WHISPER",
	"FILTERED", "RESTRICTED", "VOICE_TEXT",
}

-- 창별 메시지 그룹 정의 (chat-cache.txt 기준)
local WINDOW_GROUPS = {
	[1] = { -- 일반
		"SYSTEM", "SAY", "EMOTE", "YELL", "WHISPER", "PARTY", "PARTY_LEADER",
		"RAID", "RAID_LEADER", "RAID_WARNING", "GUILD", "OFFICER",
		"MONSTER_SAY", "MONSTER_YELL", "MONSTER_EMOTE", "MONSTER_WHISPER",
		"MONSTER_BOSS_EMOTE", "MONSTER_BOSS_WHISPER",
		"ERRORS", "AFK", "DND", "IGNORED",
		"BG_HORDE", "BG_ALLIANCE", "BG_NEUTRAL", "CHANNEL",
		"ACHIEVEMENT", "GUILD_ACHIEVEMENT",
		"BN_WHISPER", "BN_WHISPER_INFORM", "BN_CONVERSATION",
		"BN_INLINE_TOAST_ALERT", "CURRENCY", "BN_WHISPER_PLAYER_OFFLINE",
		"PET_BATTLE_INFO", "INSTANCE_CHAT", "INSTANCE_CHAT_LEADER",
		"GUILD_ITEM_LOOTED", "PING",
	},
	[2] = { -- 기록
		"OPENING", "TRADESKILLS", "PET_INFO",
		"COMBAT_XP_GAIN", "COMBAT_HONOR_GAIN", "COMBAT_MISC_INFO",
	},
	[3] = { -- 음성 대화 설정
		"VOICE_TEXT",
	},
	[4] = { -- 전리품 / 거래 요청
		"COMBAT_FACTION_CHANGE", "SKILL", "LOOT", "MONEY",
		"COMBAT_XP_GAIN", "COMBAT_HONOR_GAIN",
	},
	[5] = { -- 길드&파티
		"SYSTEM", "SAY", "EMOTE", "YELL", "WHISPER",
		"PARTY", "PARTY_LEADER", "RAID", "RAID_LEADER", "RAID_WARNING",
		"GUILD", "OFFICER", "CHANNEL",
		"BN_WHISPER", "INSTANCE_CHAT", "INSTANCE_CHAT_LEADER",
	},
	[6] = { -- 거래 (숨김)
		"SAY", "WHISPER", "PARTY", "RAID", "RAID_WARNING", "GUILD",
	},
	-- 7~10: 비어있음
}

-- 창별 이름 (없으면 기본 이름 유지)
local WINDOW_NAMES = {
	[1] = "일반",
	[2] = "기록",
	[3] = "음성 대화 설정",
	[4] = "전리품 / 거래 요청",
	[5] = "길드&파티",
	[6] = "거래",
}

-- 창 1에 표시할 채널 (파티찾기만 유지)
local WINDOW1_CHANNELS = { "파티찾기" }

-- 창 5(길드&파티)는 개인 채널만 있었으므로 채널 없음

local function clearAllGroups(frame)
	if not ChatFrame_RemoveMessageGroup then return end
	for _, group in ipairs(ALL_GROUPS) do
		ChatFrame_RemoveMessageGroup(frame, group)
	end
end

local function addGroups(frame, groups)
	if not ChatFrame_AddMessageGroup then return end
	for _, group in ipairs(groups) do
		ChatFrame_AddMessageGroup(frame, group)
	end
end

function IUI:SetupChatWindows()
	local NUM_WINDOWS = NUM_CHAT_WINDOWS or 10

	for i = 1, NUM_WINDOWS do
		local frame = _G["ChatFrame" .. i]
		if not frame then break end

		-- 폰트 크기 통일
		local fontSize = (i <= 3 or i >= 7) and 12 or 12
		if i == 3 then fontSize = 0 end
		if FCF_SetChatWindowFontSize and fontSize > 0 then
			FCF_SetChatWindowFontSize(nil, frame, fontSize)
		end

		-- 메시지 그룹 초기화 후 재설정
		clearAllGroups(frame)
		if WINDOW_GROUPS[i] then
			addGroups(frame, WINDOW_GROUPS[i])
		end

		-- 창 이름 설정
		if WINDOW_NAMES[i] then
			if FCF_SetWindowName then FCF_SetWindowName(frame, WINDOW_NAMES[i]) end
		end

		-- 잠금
		if FCF_SetLocked then FCF_SetLocked(frame, 1) end

		-- 위치 저장
		if frame:GetLeft() then
			if FCF_SavePositionAndDimensions then FCF_SavePositionAndDimensions(frame) end
			if FCF_StopDragging then FCF_StopDragging(frame) end
		end
	end

	-- 창 1 채널 설정 (파티찾기, LookingForGroup — TBC Anniversary에서 채널은 수동 추가 필요)
	-- ChatFrame_AddChannel이 없는 버전이므로 채널 목록만 E.db에 기록
	if E.db["datatexts"] and E.db["datatexts"]["panels"] then
		-- 채널 설정은 ReloadUI 후 chat-cache.txt를 통해 적용됩니다
	end

	-- 창 4 (전리품): 우측 채팅 패널에 독립 배치
	local frame4 = ChatFrame4
	if frame4 then
		if FCF_UnDockFrame then FCF_UnDockFrame(frame4) end
		if FCF_DockFrame then FCF_DockFrame(frame4) end
		if FCF_SetLocked then FCF_SetLocked(frame4, 1) end
	end

	E:StaticPopup_Show("IBERISUI_CHAT_DONE")
end

E.PopupDialogs["IBERISUI_CHAT_DONE"] = {
	text = "|cffff9900IberisUI|r\n채팅 창 설정이 완료되었습니다.\n완전히 적용하려면 UI를 재로드하세요.",
	button1 = "UI 재로드",
	button2 = "나중에",
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
	OnAccept = function() ReloadUI() end,
}
