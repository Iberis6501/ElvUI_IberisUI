local IUI, E, L = unpack((select(2, ...)))

function IUI:LoadHidingBarProfile()
	-- HidingBarDBChar: 케릭터별 프로필 지정
	-- HidingBarDB.profiles[2].name = "서약선" (계정 레벨에 존재)
	if not HidingBarDBChar then HidingBarDBChar = {} end
	HidingBarDBChar["currentProfileName"] = "서약선"
end
