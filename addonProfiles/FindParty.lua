local IUI, E, L = unpack((select(2, ...)))

function IUI:LoadFindPartyProfile()
	if not C_AddOns.IsAddOnLoaded("FindParty") then return end

	FP_UserDefinedWhMsg = "냥 될까요~ (기코1617)"
	FP_UserDefinedAdMsg = nil
	FP_UserDefineIgnoreMsg = ""
end
