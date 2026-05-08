local IUI, E, L = unpack((select(2, ...)))

function IUI:SetupIberisUI()
	-- BenikUI와 동일한 방식: silent=true로 안전하게 모듈 획득
	local pi = E:GetModule("PluginInstaller", true)
	if pi then
		pi:Queue(IUI.installTable)
	else
		DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r PluginInstaller 모듈 없음")
	end
end

function IUI:Initialize()
	self:RegisterChatCommand("iberisui", "SetupIberisUI")

	-- 설치 순서:  1.ElvUI  →  2.BenikUI  →  3.IberisUI
	--
	-- 케릭터별 설치 완료 추적 (계정 공유 방지)
	IberisUIDB = IberisUIDB or {}
	local charKey     = E.myname .. "-" .. E.myrealm
	local iberisOk    = IberisUIDB[charKey] and IberisUIDB[charKey].install_complete
	local benikuiOk   = E.db.benikui and E.db.benikui.installed
	local elvuiOk     = E.private.install_complete == E.version
	local profileKey  = ElvDB and ElvDB.profileKeys and ElvDB.profileKeys[E.mynameRealm]

	-- iberisOk 기준만 사용: profileKey==nil 조건은 불필요하게 마법사를 재실행시킬 수 있음
	local shouldRun = not iberisOk

	if shouldRun then
		IUI:SetupIberisUI()
	end
end
