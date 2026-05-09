local IUI, E, L = unpack((select(2, ...)))

function IUI:LoadMRTProfile()
	local res = IUI:GetProfileData()
	if not VMRT then VMRT = {} end

	-- ============================================================
	-- Note 창 설정
	-- ============================================================
	VMRT["Note"] = VMRT["Note"] or {}
	VMRT["Note"]["FontSize"] = 12
	VMRT["Note"]["Width"] = 300
	VMRT["Note"]["Height"] = 200
	VMRT["Note"]["PersonalWidth"] = 300
	VMRT["Note"]["PersonalHeight"] = 200
	VMRT["Note"]["Strata"] = "HIGH"
	VMRT["Note"]["OnlyPromoted"] = true
	VMRT["Note"]["OptionsFormatting"] = true

	-- ============================================================
	-- MarksBar (공격대 마크 바 위치/스케일)
	-- ============================================================
	VMRT["MarksBar"] = VMRT["MarksBar"] or {}
	VMRT["MarksBar"]["enabled"] = true
	VMRT["MarksBar"]["Strata"] = "HIGH"
	VMRT["MarksBar"]["Scale"] = 101
	VMRT["MarksBar"]["Left"] = res.mrt.marksBarLeft
	VMRT["MarksBar"]["Top"]  = res.mrt.marksBarTop
	VMRT["MarksBar"]["pulltimer_right"] = 10
	VMRT["MarksBar"]["Fix"] = true
	VMRT["MarksBar"]["pulltimer"] = 10
	VMRT["MarksBar"]["Show"] = { true, true, true, true, true }

	-- ============================================================
	-- InviteTool
	-- ============================================================
	VMRT["InviteTool"] = VMRT["InviteTool"] or {}
	VMRT["InviteTool"]["Words"] = "инв inv byd штм 123"
	VMRT["InviteTool"]["InvByChat"] = true
	VMRT["InviteTool"]["RaidDiff"] = 16
	VMRT["InviteTool"]["PromoteRank"] = 2
	VMRT["InviteTool"]["Ranks"] = { true }
	VMRT["InviteTool"]["LootThreshold"] = 2
	VMRT["InviteTool"]["MasterLooters"] = ""
	VMRT["InviteTool"]["LootMethod"] = "group"
	VMRT["InviteTool"]["PromoteNames"] = ""
	VMRT["InviteTool"]["OnlyGuild"] = true
	VMRT["InviteTool"]["Rank"] = 1

	-- ============================================================
	-- CDs: 서약선 프로필 (전문화별 쿨타임 설정)
	-- ============================================================
	if not VMRT["CDs"] then VMRT["CDs"] = {} end
	if not VMRT["CDs"]["Profiles"] then VMRT["CDs"]["Profiles"] = {} end

	-- 기본 CDs 설정
	VMRT["CDs"]["Timers"] = VMRT["CDs"]["Timers"] or {}
	VMRT["CDs"]["Timers"]["Type"] = 2
	VMRT["CDs"]["Timers"]["Strata"] = "HIGH"
	VMRT["CDs"]["Timers"]["timeToKillAnalyze"] = 15
	VMRT["CDs"]["Timers"]["specTimes"] = {
		[62]=10,  [63]=10,  [64]=10,  [65]=10,  [66]=10,
		[70]=10,  [71]=10,  [72]=10,  [73]=10,
		[102]=10, [103]=10, [104]=10, [105]=10,
		[250]=10, [251]=10, [252]=10, [253]=10, [254]=10,
		[255]=10, [256]=10, [257]=10, [258]=10, [259]=10,
		[260]=10, [261]=25, [262]=16, [263]=10, [264]=10,
		[265]=22, [266]=10, [267]=10, [268]=10, [269]=10, [270]=10,
		[577]=10, [581]=10,
		[1467]=10, [1468]=10, [1473]=10,
	}

	-- 서약선 프로필 적용
	VMRT["CDs"]["Profiles"]["서약선"] = {
		["Timers"] = {
			["Type"] = 2,
			["timeToKillAnalyze"] = 15,
			["Strata"] = "HIGH",
			["specTimes"] = {
				[62]=10,  [63]=10,  [64]=10,  [65]=10,  [66]=10,
				[70]=10,  [71]=10,  [72]=10,  [73]=10,
				[102]=10, [103]=10, [104]=10, [105]=10,
				[250]=10, [251]=10, [252]=10, [253]=10, [254]=10,
				[255]=10, [256]=10, [257]=10, [258]=10, [259]=10,
				[260]=10, [261]=25, [262]=16, [263]=10, [264]=10,
				[265]=22, [266]=10, [267]=10, [268]=10, [269]=10, [270]=10,
				[577]=10, [581]=10,
				[1467]=10, [1468]=10, [1473]=10,
			},
		},
	}

	-- 현재 케릭터를 서약선 프로필에 연결
	local charKey = (UnitName("player") or "") .. "-" .. (GetRealmName() or "")
	charKey = charKey:gsub("%s", "")
	VMRT["ProfileKeys"] = VMRT["ProfileKeys"] or {}
	VMRT["ProfileKeys"][charKey] = "서약선"

	-- ============================================================
	-- RaidGroups
	-- ============================================================
	VMRT["RaidGroups"] = VMRT["RaidGroups"] or {}
	VMRT["RaidGroups"]["SplitParts"] = 2
	VMRT["RaidGroups"]["upd4550"] = true
	VMRT["RaidGroups"]["SplitGroups"] = { true, true, true, true }
	VMRT["RaidGroups"]["KeepPosInGroup"] = true
end
