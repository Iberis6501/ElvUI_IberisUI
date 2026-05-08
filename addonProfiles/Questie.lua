local IUI, E, L = unpack((select(2, ...)))

-- Questie [서약선] 트래커 위치/크기 verbatim
-- 출처: WTF/Account/CGS7315/SavedVariables/Questie.lua "서약선" 프로필 (220488 라인 부근)
local SeoyaksunProfile = {
	["questAnnounceAccepted"]              = true,
	["questAnnounceCompleted"]             = true,
	["questAnnounceAbandoned"]             = true,
	["tutorialRejectInBattlegroundsDone"]  = false,
	["tutorialShowRunesDone"]              = false,
	["minimizeTrackerInDungeons"]          = false,
	["migrationVersion"]                   = 25,
	["currentBackdropEnabled"]             = true,
	["trackerBackdropEnabled"]             = true,
	["TrackerWidth"]                       = 354.8571166992188,
	["TrackerHeight"]                      = 706.2855224609375,
	["TrackerLocation"] = {
		"TOPLEFT", "UIParent", "TOPLEFT",
		1509.786010742188, -319.99951171875,
	},
}

local function deepCopy(t)
	if type(t) ~= "table" then return t end
	local r = {}
	for k, v in pairs(t) do r[k] = deepCopy(v) end
	return r
end

function IUI:LoadQuestieProfile()
	local res = IUI:GetResolutionData()
	local q   = res.questie

	-- 해상도별 좌표를 SeoyaksunProfile 사본에 주입
	local profile = deepCopy(SeoyaksunProfile)
	profile.TrackerLocation = {
		q.trackerLocation[1], q.trackerLocation[2], q.trackerLocation[3],
		q.trackerLocation[4], q.trackerLocation[5],
	}
	profile.TrackerWidth  = q.trackerWidth
	profile.TrackerHeight = q.trackerHeight

	if not QuestieConfig then QuestieConfig = {} end
	QuestieConfig.profiles = QuestieConfig.profiles or {}
	QuestieConfig.profiles["서약선"] = profile

	-- 캐릭터별 프로필 매핑
	QuestieConfig.profileKeys = QuestieConfig.profileKeys or {}
	QuestieConfig.profileKeys[E.myname .. " - " .. E.myrealm] = "서약선"
end
