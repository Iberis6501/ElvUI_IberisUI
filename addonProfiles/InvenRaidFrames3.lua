local IUI, E, L = unpack((select(2, ...)))
local Engine = select(2, ...)

-- InvenRaidFrames3: [서약선] 캐릭이 실사용한 "기본값" 프로필을 통째로 박음.
-- _InvenRaidSeoyaksun.lua (먼저 로드)에서 Engine.SeoyaksunInvenRaidProfile 정의.
-- 충돌 방지 위해 신규 프로필 이름은 "서약선"으로 등록 (사이즈/스펙별 매핑도 모두 "서약선").
-- 위치 좌표(px/py/petpx/petpy/tankpx/tankpy)만 해상도별로 덮어씀.

local function deepCopy(t)
	if type(t) ~= "table" then return t end
	local r = {}
	for k, v in pairs(t) do r[k] = deepCopy(v) end
	return r
end

function IUI:LoadInvenRaidFrames3Profile()
	local res = IUI:GetProfileData()
	local ir  = res.invenRaid

	-- [서약선] 프로필 통째로 복사 + 좌표 주입
	local profile = deepCopy(Engine.SeoyaksunInvenRaidProfile or {})
	profile.px     = ir.px
	profile.py     = ir.py
	profile.petpx  = ir.petpx
	profile.petpy  = ir.petpy
	profile.tankpx = ir.tankpx
	profile.tankpy = ir.tankpy

	if not InvenRaidFrames3DB then InvenRaidFrames3DB = {} end
	InvenRaidFrames3DB.profiles = InvenRaidFrames3DB.profiles or {}
	InvenRaidFrames3DB.profiles["서약선"] = profile

	-- 미니맵 버튼 (글로벌)
	InvenRaidFrames3DB.minimapButton = InvenRaidFrames3DB.minimapButton or {}
	InvenRaidFrames3DB.minimapButton.show     = true
	InvenRaidFrames3DB.minimapButton.radius   = 80
	InvenRaidFrames3DB.minimapButton.angle    = 19
	InvenRaidFrames3DB.minimapButton.dragable = true
	InvenRaidFrames3DB.minimapButton.rounding = 10

	-- Anniversary 빌드의 InvenRaidFrames3는 CharDB.profile_Xm을 읽음 (Core.lua:167)
	-- 글로벌 DB가 아닌 캐릭별 CharDB에 박아야 적용됨.
	if not InvenRaidFrames3CharDB then InvenRaidFrames3CharDB = {} end
	InvenRaidFrames3CharDB.profile      = "서약선"
	InvenRaidFrames3CharDB.profile_1m    = "서약선"
	InvenRaidFrames3CharDB.profile_5m    = "서약선"
	InvenRaidFrames3CharDB.profile_10m   = "서약선"
	InvenRaidFrames3CharDB.profile_25m   = "서약선"
	InvenRaidFrames3CharDB.profile_40m   = "서약선"
	InvenRaidFrames3CharDB.profile_spec1 = "서약선"
	InvenRaidFrames3CharDB.profile_spec2 = "서약선"

	-- Retail(Midnight) 빌드는 DB.profileKeys["<player> - <realm>"] 만 읽음 (Profile.lua:225-226)
	if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
		local player = UnitName("player")
		local realm  = GetRealmName()
		if player and realm then
			InvenRaidFrames3DB.profileKeys = InvenRaidFrames3DB.profileKeys or {}
			InvenRaidFrames3DB.profileKeys[player .. " - " .. realm] = "서약선"
		end
	end
end
