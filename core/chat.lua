local IUI, E, L = unpack((select(2, ...)))

-- 채팅 창 설정
-- '이베리스' 프로필에는 panelSnapLeftID=1, panelSnapRightID=4 가 이미 포함되어 있으므로
-- 최종 재로드 후 ElvUI가 자동으로 좌우 패널을 구성합니다.
-- 이 단계에서는 별도 FCF 조작 없이 안내만 표시합니다.
function IUI:SetupChatWindows()
	DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 채팅 설정: 이베리스 프로필에 좌우 채팅 패널 설정 포함됨.")
	DEFAULT_CHAT_FRAME:AddMessage("'완료' 버튼으로 재로드하면 좌측/우측 채팅 패널이 자동 적용됩니다.")
	PluginInstallStepComplete.message = "|cffff9900IberisUI|r 채팅 설정 확인됨"
	PluginInstallStepComplete:Show()
end
