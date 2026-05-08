local IUI, E, L = unpack((select(2, ...)))

-- Details 창 위치 및 공통 설정 적용
-- 창 위치는 LibWindow 형식: point(앵커), x(오프셋), y(오프셋)
-- WTF 실측 기준 4개 창 배치 (중앙 액션바 좌우 2개씩)
local function applyWindow(inst, point, x, y)
	inst["skin"]             = "ElvUI Frame Style"
	inst["__snapH"]          = false
	inst["__snapV"]          = false
	inst["bg_alpha"]         = 0
	inst["bars_grow_direction"] = 1
	inst["ignore_mass_showhide"] = false
	inst["auto_hide_menu"]   = { ["left"] = true, ["right"] = false }
	inst["libwindow"] = {
		["y"] = y,
		["x"] = x,
		["point"] = point,
		["scale"] = 1,
	}
	inst["StatusBarSaved"] = {
		["left"]   = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
		["right"]  = "DETAILS_STATUSBAR_PLUGIN_PDPS",
		["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
		["options"] = {
			["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
				["segmentType"] = 2, ["textFace"] = "FORCED SQUARE",
				["textAlign"] = 3,   ["timeType"] = 1,
				["textSize"] = 10,   ["textColor"] = { 1, 1, 1, 0.7 },
			},
			["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
				["segmentType"] = 2, ["textFace"] = "FORCED SQUARE",
				["textAlign"] = 1,   ["timeType"] = 1,
				["textSize"] = 10,   ["textColor"] = { 1, 1, 1, 0.7 },
			},
			["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
				["segmentType"] = 2, ["textFace"] = "FORCED SQUARE",
				["textAlign"] = 2,   ["timeType"] = 1,
				["textSize"] = 10,   ["textColor"] = { 1, 1, 1, 0.7 },
			},
		},
	}
end

function IUI:LoadDetailsProfile()
	if not _detalhes_global then _detalhes_global = {} end
	local db = _detalhes_global

	-- 전역 설정
	db["damage_scroll_auto_open"] = true
	db["damage_scroll_position"]  = { ["scale"] = 1, ["x"] = 4, ["point"] = "left", ["y"] = 120 }
	db["update_warning_timeout"]  = 10
	db["merge_player_abilities"]  = false
	db["show_aug_predicted_spell_damage"] = false
	db["check_stuttering"]        = false
	db["titletext_showtimer_always"] = false
	db["MIN_COMBAT_TIME"]         = true
	db["OVERALLDATA_WARNING1"]    = 60
	db["WINDOW_LOCK_UNLOCK1"]     = true
	db["version_announce"]        = 0
	db["instances_amount"]        = 4

	-- 케릭터 프로필 지정 ("서약선" 프로필 사용)
	-- 키 형식: "Name-Realm" (WTF __char_profiles 실측 확인)
	db["__char_profiles"] = db["__char_profiles"] or {}
	db["__char_profiles"][E.myname .. "-" .. E.myrealm] = "서약선"

	-- 4개 창 배치 (WTF 실측값 기준)
	-- 창 경로: _detalhes_global["instances"][n]
	db["instances"] = db["instances"] or {}
	for i = 1, 4 do
		db["instances"][i] = db["instances"][i] or {}
	end

	-- 창1: 중앙에서 우측 (BOTTOM 기준 x=+327)
	applyWindow(db["instances"][1], "BOTTOM",      327.74, 20.31)
	-- 창2: 우측 끝 (BOTTOMRIGHT 기준 x=-364)
	applyWindow(db["instances"][2], "BOTTOMRIGHT", -364.64, 20.31)
	-- 창3: 좌측 끝 (BOTTOMLEFT 기준 x=+364)
	applyWindow(db["instances"][3], "BOTTOMLEFT",  364.47, 17.28)
	-- 창4: 중앙에서 좌측 (BOTTOM 기준 x=-328)
	applyWindow(db["instances"][4], "BOTTOM",      -328.29, 17.28)
end
