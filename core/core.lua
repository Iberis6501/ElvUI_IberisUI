local IUI, E, L = unpack((select(2, ...)))

function IUI:SetupIberisUI()
	E:GetModule("PluginInstaller"):Queue(IUI.installTable)
end

function IUI:Initialize()
	self:RegisterChatCommand("iberisui", "SetupIberisUI")

	-- 처음 설치 시 설치 마법사 자동 실행
	if not E.private.iberisui.install_complete then
		IUI:SetupIberisUI()
	end
end
