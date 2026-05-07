local IUI, E, L = unpack((select(2, ...)))

function IUI:LoadHidingBarProfile()
	if not HidingBarDBChar then HidingBarDBChar = {} end
	-- 프로필 이름을 케릭터명으로 설정 (현재 케릭터 기준)
	HidingBarDBChar["currentProfileName"] = UnitName("player") or "서약선"
end
