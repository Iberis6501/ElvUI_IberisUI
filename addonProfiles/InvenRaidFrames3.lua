local IUI, E, L = unpack((select(2, ...)))
local Engine = select(2, ...)

-- InvenRaidFrames3: [서약선] 캐릭이 실사용한 "기본값" 프로필을 통째로 박음.
-- _InvenRaidSeoyaksun.lua (먼저 로드)에서 Engine.IberisInvenRaidProfile 정의.
-- 프로필 이름은 "이베리스"로 등록 — 캐릭터명과 겹치지 않게 (서약선 캐릭 진입 시 default 리셋 회피).
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

	-- 프로필 통째로 복사 + 좌표 주입
	local profile = deepCopy(Engine.IberisInvenRaidProfile or {})
	profile.px     = ir.px
	profile.py     = ir.py
	profile.petpx  = ir.petpx
	profile.petpy  = ir.petpy
	profile.tankpx = ir.tankpx
	profile.tankpy = ir.tankpy

	if not InvenRaidFrames3DB then InvenRaidFrames3DB = {} end
	InvenRaidFrames3DB.profiles = InvenRaidFrames3DB.profiles or {}
	InvenRaidFrames3DB.profiles["이베리스"] = profile

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
	InvenRaidFrames3CharDB.profile      = "이베리스"
	InvenRaidFrames3CharDB.profile_1m    = "이베리스"
	InvenRaidFrames3CharDB.profile_5m    = "이베리스"
	InvenRaidFrames3CharDB.profile_10m   = "이베리스"
	InvenRaidFrames3CharDB.profile_25m   = "이베리스"
	InvenRaidFrames3CharDB.profile_40m   = "이베리스"
	InvenRaidFrames3CharDB.profile_spec1 = "이베리스"
	InvenRaidFrames3CharDB.profile_spec2 = "이베리스"

	-- DB.profileKeys["<player> - <realm>"] 매핑 (새 빌드 우선, Retail/Anniversary 모두)
	local player = UnitName("player")
	local realm  = GetRealmName()
	if player and realm then
		InvenRaidFrames3DB.profileKeys = InvenRaidFrames3DB.profileKeys or {}
		InvenRaidFrames3DB.profileKeys[player .. " - " .. realm] = "이베리스"
	end
end
