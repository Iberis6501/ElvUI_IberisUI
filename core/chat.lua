local IUI, E, L = unpack((select(2, ...)))

-- chat-cache.txt 서약선 실측값 기반 하드코딩
-- Window 1 (일반)  : 좌측 패널, BOTTOMLEFT, 338x133
-- Window 4 (전리품) : 우측 BOTTOMRIGHT, 338x133 (DOCKED 0)
-- Window 5 (길드&파티): 좌측 패널 탭3

local CHAT_LEFT_W  = 338
local CHAT_LEFT_H  = 133
local CHAT_RIGHT_W = 338
local CHAT_RIGHT_H = 133

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

function IUI:SetupChatWindows()
	-- 1. ElvUI 기본 채팅 설치 (패널 생성)
	if E.SetupChat then
		pcall(function() E:SetupChat() end)
	end

	-- 2. panelSnap 복원
	E.db.chat.panelSnapLeftID  = 1
	E.db.chat.panelSnapRightID = 4

	-- 3. chat-cache.txt 기반 메시지 그룹 강제 설정
	applyMsgGroups(ChatFrame1, WIN1_GROUPS)  -- 일반 → 좌측
	applyMsgGroups(ChatFrame4, WIN4_GROUPS)  -- 전리품 → 우측
	applyMsgGroups(ChatFrame5, WIN5_GROUPS)  -- 길드&파티 → 좌측탭3

	-- Window 4 (전리품) 크기·위치 강제 설정 (DOCKED 0 = 우측 자유 배치)
	if ChatFrame4 then
		pcall(function()
			ChatFrame4:SetWidth(CHAT_RIGHT_W)
			ChatFrame4:SetHeight(CHAT_RIGHT_H)
		end)
	end

	-- 4. ElvUI Chat 모듈 갱신
	local CH = E:GetModule("Chat", true)
	if CH then
		if CH.PositionChats  then CH:PositionChats()  end
		if CH.BuildChatFrame then CH:BuildChatFrame()  end
	end

	-- 5. panelSnap 재적용 (PositionChats 후 덮어씌워질 수 있으므로)
	E.db.chat.panelSnapLeftID  = 1
	E.db.chat.panelSnapRightID = 4

	DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 채팅 설정 완료 — 좌우 패널 적용됨.")
	PluginInstallStepComplete.message = "|cffff9900IberisUI|r 채팅 설정 완료"
	PluginInstallStepComplete:Show()
end
