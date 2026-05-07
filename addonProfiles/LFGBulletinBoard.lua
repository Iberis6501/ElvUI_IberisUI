local IUI, E, L = unpack((select(2, ...)))

function IUI:LoadLFGBulletinBoardProfile()
	if not C_AddOns.IsAddOnLoaded("LFGBulletinBoard") then return end

	if not GroupBulletinBoardDBChar then GroupBulletinBoardDBChar = {} end

	local db = GroupBulletinBoardDBChar
	db["NormalOnly"] = false
	db["HeroicOnly"] = false
	db["FilterLevel"] = false
	db["DontFilterOwn"] = false

	-- 던전/레이드 필터 설정 (true = 필터링하여 표시)
	db["FilterDungeonBF"]    = true
	db["FilterDungeonMT"]    = true
	db["FilterDungeonBOT"]   = true
	db["FilterDungeonSL"]    = true
	db["FilterDungeonSP"]    = true
	db["FilterDungeonRAMPS"] = true
	db["FilterDungeonHYJAL"] = true
	db["FilterDungeonZA"]    = true
	db["FilterDungeonKARA"]  = true
	db["FilterDungeonMECH"]  = true
	db["FilterDungeonBAD"]   = true
	db["FilterDungeonSV"]    = true
	db["FilterDungeonSSC"]   = true
	db["FilterDungeonUB"]    = true
	db["FilterDungeonSETH"]  = true
	db["FilterDungeonBM"]    = true
	db["FilterDungeonBT"]    = true
	db["FilterDungeonGL"]    = true
	db["FilterDungeonMAG"]   = true
	db["FilterDungeonCRYPTS"]= true
	db["FilterDungeonARC"]   = true
	db["FilterDungeonSH"]    = true
	db["FilterDungeonEYE"]   = true
	db["FilterDungeonOHB"]   = true
	db["FilterDungeonDEBUG"] = true
	db["FilterDungeonMGT"]   = true
	db["FilterDungeonSWP"]   = true

	-- 표시 안 함 (false)
	db["FilterDungeonTRADE"] = false
	db["FilterDungeonSMA"]   = false
	db["FilterDungeonDME"]   = false
	db["FilterDungeonMAR"]   = false
	db["FilterDungeonRFK"]   = false
	db["FilterDungeonSMC"]   = false
	db["FilterDungeonONY"]   = false
	db["FilterDungeonSTK"]   = false
	db["FilterDungeonARENA"] = false
	db["FilterDungeonWC"]    = false
	db["FilterDungeonRFC"]   = false
	db["FilterDungeonAV"]    = false
	db["FilterDungeonULD"]   = false
	db["FilterDungeonTRAVEL"]= false
	db["FilterDungeonRFD"]   = false
	db["FilterDungeonST"]    = false
	db["FilterDungeonZF"]    = false
	db["FilterDungeonSFK"]   = false
	db["FilterDungeonBFD"]   = false
	db["FilterDungeonBOOSTS"]= false
	db["FilterDungeonSMG"]   = false
	db["FilterDungeonSML"]   = false
	db["FilterDungeonBWL"]   = false
	db["FilterDungeonMISC"]  = false
	db["FilterDungeonSM2"]   = false
	db["FilterDungeonSCH"]   = false
	db["FilterDungeonDM2"]   = false
	db["FilterDungeonMC"]    = false
	db["FilterDungeonZG"]    = false
	db["FilterDungeonAQ20"]  = false
	db["FilterDungeonAQ40"]  = false
	db["FilterDungeonEOTS"]  = false
	db["FilterDungeonNAXX"]  = false
	db["FilterDungeonSTR"]   = false
	db["FilterDungeonDMW"]   = false
	db["FilterDungeonDMN"]   = false
	db["FilterDungeonAB"]    = false
	db["FilterDungeonLBRS"]  = false
	db["FilterDungeonUBRS"]  = false
	db["FilterDungeonDM"]    = false
	db["FilterDungeonBRD"]   = false

	-- 채널 (21개 채널 전체 활성화)
	db["channel"] = {}
	for i = 1, 21 do
		db["channel"][i] = true
	end
end
