local IUI, E, L = unpack((select(2, ...)))

-- TacoTip은 마우스 앵커 사용 → 별도 위치 배치 없음.
-- 옵션값 + IberisUI patch (TacoTip 원본 안 건드림)
-- 출처: WTF/Account/CGS7315/SavedVariables/TacoTip.lua

-- ============================================================
-- IberisUI patch (TacoTip 원본 코드 안 건드림)
-- IUI 메서드로 노출 — IUI:Initialize에서도 호출 가능
-- ============================================================
function IUI:ApplyTacoTipPatches()
	-- patch 1: InterfaceOptionsFrame_OpenToCategory deprecated → Settings.OpenToCategory wrapper
	if not _G.InterfaceOptionsFrame_OpenToCategory and _G.Settings and _G.Settings.OpenToCategory then
		_G.InterfaceOptionsFrame_OpenToCategory = function(...)
			return _G.Settings.OpenToCategory(_G.Settings, ...)
		end
	end

	-- patch 2 제거됨: 마우스오버 NotifyInspect 자동 호출
	-- 이유: 사거리 밖 대상에서 "너무 멀리 있습니다" 에러 음성 발생.
	-- UIErrorsFrame 후킹/CheckInteractDistance로도 음성 차단 실패 (클라이언트 Error Speech가 별도 경로).
	-- 트레이드오프: TacoTip 첫 마우스오버에서 이전 캐시 정보가 잠깐 표시될 수 있으나
	-- TacoTip 자체가 UPDATE_MOUSEOVER_UNIT에서 캐시 갱신하므로 다음 마우스오버부터 정상.
end

function IUI:LoadTacoTipProfile()
	if not TacoTipConfig then TacoTipConfig = {} end
	local c = TacoTipConfig

	c["show_gs_character"]        = true
	c["character_gs_offset_x"]    = 0
	c["show_guild_name"]          = true
	c["show_guild_rank"]          = false
	c["anchor_mouse"]             = false
	c["show_team"]                = false
	c["show_target"]              = true
	c["show_achievement_points"]  = false
	c["show_gs_items_hs"]         = false
	c["show_talents"]             = true
	c["show_titles"]              = true
	c["instant_fade"]             = false
	c["inspect_ilvl_offset_y"]    = 0
	c["show_gs_player"]           = true
	c["anchor_mouse_world"]       = true
	c["show_gs_items"]            = false
	c["character_gs_offset_y"]    = 0
	c["show_pvp_icon"]            = false
	c["inspect_gs_offset_y"]      = 0
	c["show_avg_ilvl"]            = true
	c["conf_version"]             = "0.4.9"
	c["character_ilvl_offset_y"]  = 0
	c["character_ilvl_offset_x"]  = 0
	c["unlock_info_position"]     = false
	c["tip_style"]                = 1  -- FULL 고정 (0.4.9부터 FULL이 2중 특성 + 활성 특성 표시 — 구 커스텀 패치 대체)
	c["hide_in_combat"]           = false
	c["inspect_ilvl_offset_x"]    = 0
	c["inspect_gs_offset_x"]      = 0
	c["anchor_mouse_spells"]      = false
	c["show_power_bar"]           = false
	c["show_item_level"]          = true
	c["color_class"]              = true
	c["guild_rank_alt_style"]     = false
	c["show_pawn_player"]         = false
	c["show_hp_bar"]              = true

	IUI:ApplyTacoTipPatches()
end
