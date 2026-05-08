local IUI, E, L = unpack((select(2, ...)))

-- TacoTip은 마우스 앵커 사용 → 별도 위치 배치 없음.
-- [서약선] 글로벌 옵션 verbatim 적용.
-- 출처: WTF/Account/CGS7315/SavedVariables/TacoTip.lua
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
	c["conf_version"]             = "0.4.7"
	c["character_ilvl_offset_y"]  = 0
	c["character_ilvl_offset_x"]  = 0
	c["unlock_info_position"]     = false
	c["tip_style"]                = 2
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
	-- 길드명 길이 제한 (TacoTip 자체 옵션 아닌 IberisUI 패치로 추가된 옵션)
	-- 한글 14자 = 한국어 환경에서 적절한 기본값. 길면 "..." 추가.
	c["guild_name_max_length"]    = 14
end
