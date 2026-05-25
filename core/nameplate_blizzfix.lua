local _, E = unpack((select(2, ...)))

-- 앤니버서리/신형 엔진 클라에서 ElvUI가 블리자드 기본 네임플레이트(UnitFrame)를
-- 완전히 숨기지 못해, 블리자드 체력바 배경이 ElvUI 이름표 위로 새어
-- 흰색 반투명 박스로 보이는 문제 보강.
-- 네임플레이트가 새로 뜰 때마다 블리자드 UnitFrame을 숨기고, OnShow 재표시를 차단한다.
-- ElvUI 이름표를 안 쓰는 환경/구형 클라에서는 가드로 무해하게 통과.

local function HideBlizzPlate(np)
	if not (np and np.UnitFrame) then return end
	np.UnitFrame:Hide()
	if not np.UnitFrame.__iberisBlizzHooked then
		np.UnitFrame.__iberisBlizzHooked = true
		np.UnitFrame:HookScript('OnShow', function(frame)
			if E.private and E.private.nameplates and E.private.nameplates.enable then
				frame:Hide()
			end
		end)
	end
end

local fixer = CreateFrame('Frame')
fixer:RegisterEvent('NAME_PLATE_UNIT_ADDED')
fixer:SetScript('OnEvent', function(_, _, unit)
	if not (E.private and E.private.nameplates and E.private.nameplates.enable) then return end
	if not C_NamePlate then return end
	HideBlizzPlate(C_NamePlate.GetNamePlateForUnit(unit))
end)
