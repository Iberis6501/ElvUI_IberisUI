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

-- ElvUI 15.18이 TBC 네임플레이트 SetScale 로직에 E.TBC를 추가하면서(Nameplates.lua의
-- StylePlate/StyleTargetPlate/ScalePlate: `(E.Retail or E.Mists or E.TBC) and 1 or E.uiscale`)
-- UIScale<1 환경에서 이름표가 1/uiscale 배 커졌다. 15.17까지는 TBC도 E.uiscale로 스케일했다.
-- TBC에서 이 세 함수 뒤에 hook을 걸어 스케일을 E.uiscale로 되돌려 15.17 크기를 복원한다.
-- (별도 파일이 아니라 nameplate_blizzfix에 통합 — 신규 파일+xml 등록 의존을 피해
--  CF App 부분 업데이트로 load_core.xml이 옛 버전이어도 로드가 보장된다.)
-- ★ 클라 2.5.6.68575(2026-07-09)부터 클라이언트가 이름표에 UIParent 스케일을 자체 적용
--   (ElvUI가 scale 1을 둔 이유가 이것). 이 빌드 이상에서 훅까지 돌면 uiscale이 이중으로
--   곱해져(0.7²≈0.49) 이름표가 너무 작아지므로, 구빌드에서만 훅을 건다.
local clientBuild = tonumber((select(2, GetBuildInfo()))) or 0

if E and E.TBC and clientBuild < 68575 then
	local NP = E:GetModule('NamePlates', true)
	if NP then
		local function restoreScale(_, nameplate)
			if nameplate and nameplate.SetScale then
				nameplate:SetScale(E.uiscale)
			end
		end
		if NP.StylePlate       then hooksecurefunc(NP, 'StylePlate', restoreScale) end
		if NP.StyleTargetPlate then hooksecurefunc(NP, 'StyleTargetPlate', restoreScale) end
		if NP.ScalePlate then
			hooksecurefunc(NP, 'ScalePlate', function(_, nameplate, scale)
				if nameplate and nameplate.SetScale then
					nameplate:SetScale((scale or 1) * E.uiscale)
				end
			end)
		end
	end
elseif E and E.Classic and clientBuild >= 68808 then
	-- ★ Classic Era 1.15.9(68808)부터 위와 반대 문제: 클라가 이름표에 UIParent
	--   스케일을 자체 적용하는데, ElvUI 15.18은 Classic을 구엔진으로 보고
	--   uiscale을 또 곱한다 → 이중 축소(0.7²≈0.49)로 이름표가 작아짐.
	--   스케일을 1로 되돌려 클라 자체 스케일만 남긴다 (1.15.9 이전 크기 복원).
	local NP = E:GetModule('NamePlates', true)
	if NP then
		local function restoreScale(_, nameplate)
			if nameplate and nameplate.SetScale then
				nameplate:SetScale(1)
			end
		end
		if NP.StylePlate       then hooksecurefunc(NP, 'StylePlate', restoreScale) end
		if NP.StyleTargetPlate then hooksecurefunc(NP, 'StyleTargetPlate', restoreScale) end
		if NP.ScalePlate then
			hooksecurefunc(NP, 'ScalePlate', function(_, nameplate, scale)
				if nameplate and nameplate.SetScale then
					nameplate:SetScale(scale or 1)
				end
			end)
		end
	end
end
