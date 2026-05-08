local IUI, E, L = unpack((select(2, ...)))

-- [서약선] ShamanPower 프로필 verbatim
-- 출처: WTF/Account/CGS7315/SavedVariables/ShamanPower.lua (84~147 라인)
local SeoyaksunProfile = {
	["freeassign"] = false,
	["poppedOutSettings"] = {
		["single_3_1"] = { ["scale"] = 1, ["opacity"] = 1 },
		["dropall"]    = { ["scale"] = 1, ["opacity"] = 1 },
	},
	["enable"] = true,
	["border"] = "None",
	["cdbarLayout"] = "Horizontal",
	["macroIconMigrationV1"] = true,
	["macroResetMigrationV156"] = true,
	["loadoutBarPosition"] = {
		["y"]        = -154.2854614257813,
		["relPoint"] = "LEFT",
		["point"]    = "LEFT",
		["x"]        = 395.1753540039063,
	},
	["activeLoadout"] = 1,
	["dropOrder"] = { 2, 4, nil, 1 },
	["cooldownBarPadding"] = 10,
	["enableTotemTwisting"] = false,
	["poppedOutPositions"] = {
		["single_3_1"] = {
			["y"] = 491.6827697753906, ["relPoint"] = "BOTTOMLEFT",
			["point"] = "CENTER", ["x"] = 617.1428833007812,
		},
		["dropall"] = {
			["y"] = 505.3970336914063, ["relPoint"] = "BOTTOMLEFT",
			["point"] = "CENTER", ["x"] = 619.1744995117188,
		},
	},
	["layout"] = "Horizontal",
	["preferredImbue"] = 1,
	["flyoutRequiresClick"] = true,
	["esTracker"] = {
		["position"] = {
			["y"] = -26.66669845581055,
			["x"] = 389.71435546875,
		},
	},
	["display"] = {
		["frameLocked"] = true,
		["offsetX"] = 998.597900390625,
		["offsetY"] = 297.5,
	},
	["seal"] = 0,
	["skin"] = "None",
	["twistSoundEnabled"] = true,
}

local TotemLoadouts = {
	{ 2, 1, 1, 3, ["icon"] = 136012, ["name"] = "정술" },
	{ 1, 0, 1, 2, ["icon"] = 136042, ["name"] = "복술" },
}

local RangeTrackerPosition = {
	["y"]     = 206.8249359130859,
	["x"]     = -357.0796813964844,
	["point"] = "BOTTOM",
}

local function deepCopy(t)
	if type(t) ~= "table" then return t end
	local r = {}
	for k, v in pairs(t) do r[k] = deepCopy(v) end
	return r
end

function IUI:LoadShamanPowerProfile()
	local res = IUI:GetResolutionData()
	local sp = res.shamanPower

	-- 해상도별 좌표를 SeoyaksunProfile 사본에 주입
	local profile = deepCopy(SeoyaksunProfile)
	profile.loadoutBarPosition = {
		x = sp.loadoutBar.x, y = sp.loadoutBar.y,
		point = sp.loadoutBar.point, relPoint = sp.loadoutBar.relPoint,
	}
	profile.esTracker = profile.esTracker or {}
	profile.esTracker.position = { x = sp.esTrackerPos.x, y = sp.esTrackerPos.y }
	profile.display = profile.display or {}
	profile.display.frameLocked = true
	profile.display.offsetX     = sp.displayOffset.x
	profile.display.offsetY     = sp.displayOffset.y
	profile.poppedOutPositions = {
		single_3_1 = {
			x = sp.poppedSingle.x, y = sp.poppedSingle.y,
			point = sp.poppedSingle.point, relPoint = sp.poppedSingle.relPoint,
		},
		dropall = {
			x = sp.poppedDropall.x, y = sp.poppedDropall.y,
			point = sp.poppedDropall.point, relPoint = sp.poppedDropall.relPoint,
		},
	}

	-- AceDB profiles에 [서약선] 프로필 등록
	if not ShamanPowerDB then ShamanPowerDB = {} end
	ShamanPowerDB.profiles = ShamanPowerDB.profiles or {}
	ShamanPowerDB.profiles["서약선"] = profile

	-- 캐릭터별 프로필 매핑
	ShamanPowerDB.profileKeys = ShamanPowerDB.profileKeys or {}
	ShamanPowerDB.profileKeys[E.myname .. " - " .. E.myrealm] = "서약선"

	-- 토템 로드아웃 (정술/복술 프리셋)
	if not ShamanPower_TotemLoadouts then ShamanPower_TotemLoadouts = {} end
	for i, loadout in ipairs(TotemLoadouts) do
		ShamanPower_TotemLoadouts[i] = deepCopy(loadout)
	end

	-- RangeTracker 위치 (해상도별)
	if not ShamanPower_RangeTracker then ShamanPower_RangeTracker = {} end
	ShamanPower_RangeTracker.position = {
		x = sp.rangeTracker.x, y = sp.rangeTracker.y, point = sp.rangeTracker.point,
	}
end
