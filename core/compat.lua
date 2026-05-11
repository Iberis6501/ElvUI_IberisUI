-- Restore container API globals removed in BfA (now C_Container.*).
-- Some legacy addons (Postal 등) still call the removed globals directly;
-- aliasing only when the global is missing keeps this safe on every client.
if C_Container then
	local names = {
		"GetContainerItemInfo",
		"GetContainerItemLink",
		"GetContainerItemID",
		"GetContainerItemDurability",
		"GetContainerItemCooldown",
		"GetContainerItemEquipmentSetInfo",
		"GetContainerItemPurchaseInfo",
		"GetContainerItemPurchaseItem",
		"GetContainerItemQuestInfo",
		"GetContainerNumFreeSlots",
		"GetContainerNumSlots",
		"GetContainerFreeSlots",
		"PickupContainerItem",
		"UseContainerItem",
		"SplitContainerItem",
		"SocketContainerItem",
		"ContainerIDToInventoryID",
	}
	for i = 1, #names do
		local n = names[i]
		if _G[n] == nil and C_Container[n] then
			_G[n] = C_Container[n]
		end
	end
end

-- Stub legacy Interface Options globals removed when Settings API replaced them.
-- Guidelime's options-panel toggle still calls InterfaceAddOnsList_Update() guarded
-- only by the presence of InterfaceOptionsFrame_OpenToCategory; that guard misses
-- TBC Anniversary which kept the latter but dropped the former. A no-op stub is
-- safe because the old addon-list panel is gone on these clients anyway.
if _G.InterfaceAddOnsList_Update == nil then
	_G.InterfaceAddOnsList_Update = function() end
end
