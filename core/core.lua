local IUI, E, L = unpack((select(2, ...)))

function IUI:SetupIberisUI()
	local pi = E:GetModule("PluginInstaller")
	if pi then
		pi:Queue(IUI.installTable)
	else
		DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r PluginInstaller 모듈 없음 — /iberisui 로 재시도")
	end
end

function IUI:Initialize()
	self:RegisterChatCommand("iberisui", "SetupIberisUI")

	-- E.private.iberisui nil 안전 처리
	if not E.private.iberisui then
		E.private.iberisui = { install_complete = false }
	end

	-- 설치 순서:  1.ElvUI  →  2.BenikUI  →  3.IberisUI
	--
	-- 조건 A: iberisui 설치 미완료 (최초 설치 또는 install_complete가 falsy)
	-- 조건 B: 이 케릭터에 ElvUI 프로필이 없음 (새 케릭터) — BenikUI와 동일한 패턴
	--
	-- BenikUI가 자신의 설치를 마쳤을 때(installed == true) 또는
	-- ElvUI 설치가 완료됐을 때(install_complete == version)만 IberisUI를 큐에 넣어서
	-- 세 마법사가 순서대로 나타나도록 합니다.
	local iberisOk    = E.private.iberisui.install_complete
	local benikuiOk   = E.db.benikui and E.db.benikui.installed
	local elvuiOk     = E.private.install_complete == E.version
	local profileKey  = ElvDB and ElvDB.profileKeys and ElvDB.profileKeys[E.mynameRealm]

	local shouldRun = (not iberisOk) or (profileKey == nil)

	-- BenikUI나 ElvUI가 아직 설치 전이면 큐만 잡아두고
	-- PluginInstaller 순서에 맡긴다 (먼저 큐된 것이 먼저 실행됨)
	if shouldRun then
		IUI:SetupIberisUI()
	end
end
