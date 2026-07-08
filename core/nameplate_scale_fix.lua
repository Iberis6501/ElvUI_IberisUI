local _, E = unpack((select(2, ...)))

-- ElvUI 15.18이 TBC 네임플레이트 SetScale 로직에 E.TBC를 추가하면서(Nameplates.lua의
-- StylePlate/StyleTargetPlate/ScalePlate: `(E.Retail or E.Mists or E.TBC) and 1 or E.uiscale`)
-- UIScale<1 환경에서 이름표가 1/uiscale 배 커졌다. 15.17까지는 TBC도 E.uiscale로 스케일했다.
-- TBC 클라에서 이 세 함수 뒤에 hook을 걸어 스케일을 E.uiscale로 되돌려 15.17 크기를 복원한다.
-- Retail/Mists는 원래 1(개입 불필요), Vanilla/Wrath는 대상 아님 → E.TBC 가드로 한정.
-- 폰트/SLUG 문제와는 무관한 별개 우회. ElvUI가 TBC 스케일을 옵션화/수정하면 제거.
if E and E.TBC then
	local NP = E:GetModule('NamePlates', true)
	if NP then
		-- StylePlate/StyleTargetPlate: 프레임 스케일을 uiscale로 되돌림
		local function restore(_, nameplate)
			if nameplate and nameplate.SetScale then
				nameplate:SetScale(E.uiscale)
			end
		end
		if NP.StylePlate       then hooksecurefunc(NP, 'StylePlate', restore) end
		if NP.StyleTargetPlate then hooksecurefunc(NP, 'StyleTargetPlate', restore) end

		-- ScalePlate(스태킹 겹침 시): 15.17은 mult=E.uiscale였으므로 scale*uiscale로 복원
		if NP.ScalePlate then
			hooksecurefunc(NP, 'ScalePlate', function(_, nameplate, scale)
				if nameplate and nameplate.SetScale then
					nameplate:SetScale((scale or 1) * E.uiscale)
				end
			end)
		end
	end
end
