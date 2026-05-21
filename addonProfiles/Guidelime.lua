local IUI, E, L = unpack((select(2, ...)))

-- Guidelime: [서약선] 외형(옵션 + 메인프레임 위치/크기) 적용
-- 출처: WTF - 복사본의 [서약선] GuidelimeData/GuidelimeDataChar
-- 진행 데이터(guideSkip, currentGuide 등)는 제외 — 외형만.
function IUI:LoadGuidelimeProfile()
	-- 글로벌 옵션 (마커 크기/투명도, 표시 토글 등)
	if not GuidelimeData then GuidelimeData = {} end
	GuidelimeData["mapMarkerSizeGOTO"]      = 16
	GuidelimeData["mapMarkerSizeLOC"]       = 16
	GuidelimeData["mapMarkerAlphaLOC"]      = 0.5
	GuidelimeData["showQuestLevels"]        = false
	GuidelimeData["showMinimumQuestLevels"] = false
	GuidelimeData["autoAddCoordinates"]     = true
	GuidelimeData["autoSelectFlight"]       = true
	GuidelimeData["arrowDistance"]          = false

	-- 메인 프레임 위치/크기 ([나약선] 실측 — TOPLEFT 기준)
	-- 화살표(커서) 위치/크기/투명도도 외형이라 같이 가져옴.
	-- 개인 진행 데이터(guideSkip/currentGuide)는 제외.
	if not GuidelimeDataChar then GuidelimeDataChar = {} end
	GuidelimeDataChar["mainFrameRelative"] = "TOPLEFT"
	GuidelimeDataChar["mainFrameX"]        = 193
	GuidelimeDataChar["mainFrameY"]        = -3
	GuidelimeDataChar["mainFrameWidth"]    = 350
	GuidelimeDataChar["mainFrameHeight"]   = 400

	-- 화살표(커서) — TOP 기준 화면 상단 중앙
	GuidelimeDataChar["showArrow"]         = true
	GuidelimeDataChar["arrowRelative"]     = "TOP"
	GuidelimeDataChar["arrowX"]            = 2.238645553588867
	GuidelimeDataChar["arrowY"]            = -81.19075012207031
	GuidelimeDataChar["arrowSize"]         = 64
	GuidelimeDataChar["arrowAlpha"]        = 0.8
	GuidelimeDataChar["arrowFontSize"]     = 14
	GuidelimeDataChar["arrowLocked"]       = true
end
