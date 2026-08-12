local _, E = unpack((select(2, ...)))

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

-- DebuffTypeColor / DebuffTypeSymbol 전역이 KR Classic 2.5.6.68575(2026-07-09) 빌드에서 제거됨.
-- InvenRaidFrames3(Profile.lua 디버프 색상표)와 LibRealDispel-1.0(DebuffTypeSymbol 순회)이
-- 전역을 직접 읽다 nil 에러로 로드 실패. FrameXML 원본 값 그대로 조건부 복원 —
-- 전역이 살아있는 클라이언트에서는 덮어쓰지 않으며, 애드온 측이 공식 대응하면 자연 무해화.
if _G.DebuffTypeColor == nil then
	local colors = {
		none = { r = 0.80, g = 0, b = 0 },
		Magic = { r = 0.20, g = 0.60, b = 1.00 },
		Curse = { r = 0.60, g = 0.00, b = 1.00 },
		Disease = { r = 0.60, g = 0.40, b = 0 },
		Poison = { r = 0.00, g = 0.60, b = 0 },
	}
	colors[""] = colors.none
	_G.DebuffTypeColor = colors
end
if _G.DebuffTypeSymbol == nil then
	_G.DebuffTypeSymbol = {
		Magic = _G.DEBUFF_SYMBOL_MAGIC or "M",
		Curse = _G.DEBUFF_SYMBOL_CURSE or "C",
		Disease = _G.DEBUFF_SYMBOL_DISEASE or "D",
		Poison = _G.DEBUFF_SYMBOL_POISON or "P",
	}
end

-- Stub legacy Interface Options globals removed when Settings API replaced them.
-- Guidelime's options-panel toggle still calls InterfaceAddOnsList_Update() guarded
-- only by the presence of InterfaceOptionsFrame_OpenToCategory; that guard misses
-- TBC Anniversary which kept the latter but dropped the former. A no-op stub is
-- safe because the old addon-list panel is gone on these clients anyway.
if _G.InterfaceAddOnsList_Update == nil then
	_G.InterfaceAddOnsList_Update = function() end
end

-- Pre-init VMRT.ExCD2.gnGUIDs on Retail (Midnight).
-- MRT의 ExCD2 ADDON_LOADED는 `if ExRT.isMN then return end` 로 early-return하면서
-- gnGUIDs 초기화 코드(ExCD2.lua:4541)를 건너뜀. 그런데 Inspect 모듈의 INSPECT_READY
-- 핸들러(Inspect.lua:891)에는 같은 가드가 없어서 `VMRT.ExCD2.gnGUIDs[name] = data.spec`
-- 에서 nil 에러가 남. 인스펙트가 일어날 때마다 터지므로 우리 쪽에서 미리 빈 테이블 박음.
if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
	local function ensureGnGUIDs()
		VMRT = _G.VMRT or {}
		VMRT.ExCD2 = VMRT.ExCD2 or {}
		VMRT.ExCD2.gnGUIDs = VMRT.ExCD2.gnGUIDs or {}
	end
	local isLoaded = (C_AddOns and C_AddOns.IsAddOnLoaded or IsAddOnLoaded)("MRT")
	if isLoaded then
		ensureGnGUIDs()
	else
		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, _, name)
			if name == "MRT" then
				ensureGnGUIDs()
				self:UnregisterEvent("ADDON_LOADED")
			end
		end)
	end
end
