local IUI, E, L = unpack((select(2, ...)))

function IUI:SetupIberisUI()
	E:GetModule("PluginInstaller"):Queue(IUI.installTable)
end

function IUI:Initialize()
	self:RegisterChatCommand("iberisui", "SetupIberisUI")

	-- nil 안전 처리: E.private.iberisui가 없을 경우 대비
	if not E.private.iberisui then
		E.private.iberisui = { install_complete = false }
	end

	if not E.private.iberisui.install_complete then
		IUI:SetupIberisUI()
	end
end
