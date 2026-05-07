local IUI, E, L = unpack((select(2, ...)))

function IUI:LoadPawnProfile()
	if not C_AddOns.IsAddOnLoaded("Pawn") then return end

	if not PawnOptions then PawnOptions = {} end
	PawnOptions["AutoSelectScales"] = false
	-- ItemLevels, LastPlayerFullName은 케릭터마다 다르므로 복사하지 않음

	if not PawnClassicScaleProviderOptions then PawnClassicScaleProviderOptions = {} end
	PawnClassicScaleProviderOptions["LastAdded"] = 3
	-- LastClass는 케릭터 클래스에 따라 달라지므로 복사하지 않음
end
