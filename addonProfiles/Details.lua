local IUI, E, L = unpack((select(2, ...)))

function IUI:LoadDetailsProfile()
	if not C_AddOns.IsAddOnLoaded("Details") then return end
	if not _detalhes_global then _detalhes_global = {} end

	local db = _detalhes_global

	-- 스킨
	-- Details 창은 자체 profile 시스템을 통해 관리되므로
	-- 여기서는 공통 전역 설정만 적용합니다.

	db["frame_background_color"] = { 0.1215, 0.1176, 0.1294, 0.8 }
	db["damage_scroll_auto_open"] = true
	db["damage_scroll_position"] = {
		["scale"] = 1,
		["x"] = 4,
		["point"] = "left",
		["y"] = 120,
	}

	db["run_code"] = db["run_code"] or {}
	db["run_code"]["on_init"] = [[

-- code to run when Details! initializes, put here code which only will run once
-- this also will run then the profile is changed

--size of the death log tooltip in the Deaths display (default 350)
Details.death_tooltip_width = 350;

--when in arena or battleground, details! silently switch to activity time (goes back to the old setting on leaving, default true)
Details.force_activity_time_pvp = true;

--speed of the bar animations (default 33)
Details.animation_speed = 33;

--threshold to trigger slow or fast speed (default 0.45)
Details.animation_speed_mintravel = 0.45;

--call to update animations
Details:RefreshAnimationFunctions();

--max window size, does require a /reload to work (default 480 x 450)
Details.max_window_size.width = 480;
Details.max_window_size.height = 450;

--use the arena team color as the class color (default true)
Details.color_by_arena_team = true;

--how much time the update warning is shown (default 10)
Details.update_warning_timeout = 10;]]

	db["update_warning_timeout"] = 10
	db["merge_player_abilities"] = false
	db["show_aug_predicted_spell_damage"] = false
	db["check_stuttering"] = false
	db["titletext_showtimer_always"] = false
	db["MIN_COMBAT_TIME"] = true
	db["OVERALLDATA_WARNING1"] = 60
	db["WINDOW_LOCK_UNLOCK1"] = true
	db["version_announce"] = 0

	-- 창 1: ElvUI Frame Style 스킨
	if db[1] then
		db[1]["skin"] = "ElvUI Frame Style"
		db[1]["__snapH"] = true
		db[1]["__snapV"] = false
		db[1]["bg_alpha"] = 0
		db[1]["bars_grow_direction"] = 1
		db[1]["ignore_mass_showhide"] = false
		db[1]["auto_hide_menu"] = { ["left"] = true, ["right"] = false }
		db[1]["StatusBarSaved"] = {
			["left"]   = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
			["right"]  = "DETAILS_STATUSBAR_PLUGIN_PDPS",
			["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
			["options"] = {
				["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
					["segmentType"] = 2, ["textFace"] = "FORCED SQUARE",
					["textAlign"] = 3,   ["timeType"] = 1,
					["textSize"] = 10,
					["textColor"] = { 1, 1, 1, 0.7 },
				},
				["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
					["segmentType"] = 2, ["textFace"] = "FORCED SQUARE",
					["textAlign"] = 1,   ["timeType"] = 1,
					["textSize"] = 10,
					["textColor"] = { 1, 1, 1, 0.7 },
				},
				["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
					["segmentType"] = 2, ["textFace"] = "FORCED SQUARE",
					["textAlign"] = 2,   ["timeType"] = 1,
					["textSize"] = 10,
					["textColor"] = { 1, 1, 1, 0.7 },
				},
			},
		}
	end
end
