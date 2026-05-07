local IUI, E, L = unpack((select(2, ...)))

function IUI:SetupChatWindows()
	-- 1. ElvUI 기본 채팅 설정 실행
	if E.SetupChat then
		local ok, err = pcall(function() E:SetupChat() end)
		if not ok then
			DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r SetupChat 오류: " .. tostring(err))
		end
	end

	-- 2. panelSnap 설정 복원 (SetupChat이 변경했을 수 있으므로 재적용)
	E.db.chat.panelSnapLeftID  = 1
	E.db.chat.panelSnapRightID = 4

	-- 3. Chat 모듈로 패널 위치 즉시 고정
	local CH = E:GetModule("Chat")
	if CH then
		if CH.PositionChats    then CH:PositionChats()    end
		if CH.BuildChatFrame   then CH:BuildChatFrame()   end
	end

	DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 채팅 설정 완료 — 좌우 패널 적용됨.")
	PluginInstallStepComplete.message = "|cffff9900IberisUI|r 채팅 설정 완료"
	PluginInstallStepComplete:Show()
end
