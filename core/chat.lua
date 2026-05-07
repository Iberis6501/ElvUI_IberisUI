local IUI, E, L = unpack((select(2, ...)))

-- ElvUI 기본 SetupChat을 그대로 호출합니다.
-- E:SetupChat()은 ElvUI/Game/Shared/General/Install.lua에 정의되어 있으며
-- 채팅 창 초기화, 전리품 창 오른쪽 패널 배치, 메시지 그룹 설정을 모두 처리합니다.
function IUI:SetupChatWindows()
	if not E.SetupChat then
		DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r E:SetupChat()을 찾을 수 없습니다.")
		return
	end

	local ok, err = pcall(function() E:SetupChat() end)
	if ok then
		DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 채팅 창 설정 완료 — 전리품 창을 오른쪽 패널로 이동했습니다.")
	else
		DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 채팅 오류: " .. tostring(err))
	end

	PluginInstallStepComplete.message = "|cffff9900IberisUI|r 채팅 설정 완료"
	PluginInstallStepComplete:Show()
end
