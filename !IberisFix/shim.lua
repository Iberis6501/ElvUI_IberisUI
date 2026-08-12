-- ============================================================
-- !IberisFix — IberisUI 동봉 선행 shim (ElvUI보다 먼저 로드)
--
-- [대상] ElvUI 15.19 × Classic 계열(Vanilla/TBC/Wrath/Mists)
--
-- ElvUI 15.19의 oUF는 파일 로드 시점에 전역 UnitSelectionType을
-- local로 캡처한 뒤(ElvUI_Libraries/.../oUF/private.lua),
-- Private.unitSelectionType에서 클라 구분 없이 호출한다.
-- 이 함수는 oUF health.lua의 UpdateColor가 체력 갱신마다 부르므로,
-- 해당 전역이 없는 Classic 계열에서는 유닛프레임마다 에러가 난다.
-- (ElvUI 자체 E:UnitSelectionType은 E.Retail 가드가 있어 무관)
--
-- ElvUI 15.20이 oUF에 isRetail 가드를 넣어 이미 수정했다. 15.20이
-- 배포되면 호출 자체가 사라지므로 이 shim은 저절로 무의미해진다.
--
-- [조치] 캡처가 일어나는 동안에만 전역에 무해한 스텁을 얹고,
-- ElvUI 로드가 끝나면 전역을 즉시 회수한다. 스텁은 nil을 반환해
-- 15.20의 동작(Classic에서 selection 색상 미사용)과 결과가 같다.
-- 전역을 회수하는 이유는, 이 전역의 존재 여부로 리테일 분기를
-- 판정하는 다른 애드온이 오판하지 않게 하기 위함이다.
-- ============================================================

-- 리테일에는 관여하지 않는다 (TOC에도 Mainline 항목 없음)
if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then return end

-- 클라가 이 API를 제공하기 시작하면 손대지 않는다
if UnitSelectionType ~= nil then return end

UnitSelectionType = function() end -- nil 반환 → oUF의 테이블 조회가 nil로 떨어짐(무해)

local watcher = CreateFrame('Frame')
watcher:RegisterEvent('ADDON_LOADED')
watcher:RegisterEvent('PLAYER_LOGIN')
watcher:SetScript('OnEvent', function(self, event, addon)
	if event == 'ADDON_LOADED' and addon ~= 'ElvUI' then return end

	UnitSelectionType = nil -- 캡처 완료 → 전역 회수
	self:UnregisterAllEvents()
end)
