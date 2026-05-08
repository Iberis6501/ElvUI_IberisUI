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

	-- patch 2: 마우스오버 시 NotifyInspect → LCI 캐시 갱신
	-- TacoTip은 UPDATE_MOUSEOVER_UNIT만 받고 NotifyInspect 호출 안 해서 이전 캐시 표시 버그 발생.
	-- (1) InspectFrame 열려있으면 skip
	-- (2) GUID별 6초 throttle
	-- (3) 같은 unit 재호출 무시
	if not IUI._tacotipInspectFrame then
		local f = CreateFrame("Frame")
		f:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
		local lastInspect = {}
		local lastGuid = nil
		f:SetScript("OnEvent", function()
			if _G.InspectFrame and _G.InspectFrame:IsShown() then return end
			if not (UnitExists("mouseover") and UnitIsPlayer("mouseover")) then return end
			if not (_G.CanInspect and _G.CanInspect("mouseover")) then return end
			local guid = UnitGUID("mouseover")
			if not guid then return end
			if guid == lastGuid then return end
			local now = GetTime()
			if lastInspect[guid] and (now - lastInspect[guid]) < 6 then return end
			lastInspect[guid] = now
			lastGuid = guid
			pcall(NotifyInspect, "mouseover")
		end)
		IUI._tacotipInspectFrame = f
	end
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

	IUI:ApplyTacoTipPatches()
end
