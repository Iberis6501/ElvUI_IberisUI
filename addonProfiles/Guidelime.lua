local IUI, E, L = unpack((select(2, ...)))

function IUI:LoadGuidelimeProfile()
	-- GuidelimeDataChar: 케릭터별 UI 설정만 적용
	-- guideSkip(진행 상황)은 케릭터마다 다르므로 복사하지 않음
	if not GuidelimeDataChar then GuidelimeDataChar = {} end
	GuidelimeDataChar["mainFrameHeight"] = 400
	GuidelimeDataChar["showUnavailableSteps"] = true
end
