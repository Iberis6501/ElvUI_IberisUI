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
	-- MarksBar (공격대 마크 바)
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
	-- Show[3] = 징표 기둥 표시. Retail에서만 끔 (Anniversary는 그대로 켜둠).
	if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
		VMRT["MarksBar"]["Show"][3] = false
	end

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

	-- ============================================================
	-- ExCD2 (공격대 생존기 표시)
	-- [서약선] 실측: 수동 추가 스킬 3개(PRIEST 33206 / PALADIN 1044 / MAGE 12043) + 활성/즐겨찾기/색상 매핑.
	-- gnGUIDs / Save / Profiles 는 사용자별 데이터라 박지 않음.
	-- ============================================================
	VMRT["ExCD2"] = VMRT["ExCD2"] or {}
	VMRT["ExCD2"]["enabled"]   = true
	VMRT["ExCD2"]["lock"]      = true
	VMRT["ExCD2"]["NoRaid"]    = true
	VMRT["ExCD2"]["upd4380"]   = true
	VMRT["ExCD2"]["upd4525"]   = true
	VMRT["ExCD2"]["Left"]      = 156.4917449951172
	VMRT["ExCD2"]["Top"]       = 1093.206298828125
	VMRT["ExCD2"]["Priority"]  = {}
	-- 수동 추가 스킬 (사용자가 in-game에서 직접 등록한 항목)
	VMRT["ExCD2"]["userDB"] = {
		{ 33206, "PRIEST,USER",  1, { 33206, 120,  8 } },
		{  1044, "PALADIN,USER", 1, {  1044,  25, 10 } },
		{ 12043, "MAGE,USER",    1, { 12043, 180, 10 } },
	}
	-- 활성 스킬 (CDs 창에 표시 ON) — [서약선] 실측 13종
	VMRT["ExCD2"]["CDE"] = {
		[12975] = true, [1044]  = true, [871]   = true, [10060] = true,
		[20765] = true, [20608] = true, [33206] = true, [29166] = true,
		[1020]  = true, [16190] = true, [20748] = true, [12043] = true,
		[32182] = true,
	}
	-- 즐겨찾기
	VMRT["ExCD2"]["OptFav"] = {
		[12975] = true, [34477] = true, [19752] = true, [10060] = true,
		[1161]  = true, [31884] = true, [20608] = true, [10310] = true,
		[1020]  = true, [2825]  = false,[16190] = true, [32182] = true,
		[871]   = true,
	}
	-- 색상 슬롯 매핑 ("spellID;1" = 슬롯 번호) — [서약선] 실측 16종
	VMRT["ExCD2"]["CDECol"] = {
		["31884;1"] = 2, ["1044;1"]  = 2, ["32182;1"] = 1, ["10310;1"] = 2,
		["1020;1"]  = 2, ["16190;1"] = 2, ["5209;1"]  = 3, ["10060;1"] = 1,
		["34477;1"] = 3, ["19752;1"] = 2, ["20608;1"] = 2, ["12472;1"] = 1,
		["20748;1"] = 3, ["12043;1"] = 3, ["29166;1"] = 3, ["20765;1"] = 3,
	}
	-- 컬럼 설정 (11개 슬롯 — colSet[1..10]은 동일, [11]은 textureFile 포함 상세 설정)
	local excd2DefaultCol = {
		enabled              = true,
		frameGeneral         = true,
		iconGray             = true,
		textGeneral          = true,
		methodsGeneral       = true,
		blacklistGeneral     = true,
		fontShadow           = false,
		iconGeneral          = true,
		fontOutline          = true,
		visibilityGeneral    = true,
		fontGeneral          = true,
		textureAnimation     = true,
		textureGeneral       = true,
	}
	local function copyTbl(t) local r = {} for k,v in pairs(t) do r[k]=v end return r end
	VMRT["ExCD2"]["colSet"] = {
		copyTbl(excd2DefaultCol), copyTbl(excd2DefaultCol), copyTbl(excd2DefaultCol),
		-- [4..10]: enabled 키 없음 (활성 컬럼은 1~3만)
		(function() local t = copyTbl(excd2DefaultCol); t.enabled = nil; return t end)(),
		(function() local t = copyTbl(excd2DefaultCol); t.enabled = nil; return t end)(),
		(function() local t = copyTbl(excd2DefaultCol); t.enabled = nil; return t end)(),
		(function() local t = copyTbl(excd2DefaultCol); t.enabled = nil; return t end)(),
		(function() local t = copyTbl(excd2DefaultCol); t.enabled = nil; return t end)(),
		(function() local t = copyTbl(excd2DefaultCol); t.enabled = nil; return t end)(),
		(function() local t = copyTbl(excd2DefaultCol); t.enabled = nil; return t end)(),
		-- [11]: textureFile 포함 상세 설정 ([서약선] 실측 — bar16 견본 외형, frameLines 50)
		{
			textureFile              = "Interface\\AddOns\\MRT\\media\\bar16.tga",
			frameWidth               = 130,
			frameLines               = 50,
			frameBetweenLines        = 1,
			fontName                 = "Fonts\\2002.ttf",
			fontSize                 = 12,
			fontOutline              = false,
			fontShadow               = true,
			iconSize                 = 16,
			iconPosition             = 1,
			iconGray                 = false,
			iconGlowType             = 4,
			textTemplateLeft         = "%name%",
			textTemplateCenter       = "",
			textTemplateRight        = "%time%",
			blacklistGeneral         = true,
			visibilityGeneral        = true,
			textureAnimation         = true,
			textureSmoothAnimation   = true,
			textureClassText         = false,
			textureClassBackground   = true,
			textureClassTimeLine     = true,
			textureAlphaBackground   = 0.15,
			textureAlphaCooldown     = 0.85,
			textureAlphaTimeLine     = 1,
			methodsStyleAnimation    = 2,
			methodsTimeLineAnimation = 2,
			-- 텍스처 색상 (대부분 흰색 1.0, 활성 텍스트만 R/B 0.5)
			textureColorTextActiveR         = 0.5,
			textureColorTextActiveG         = 1,
			textureColorTextActiveB         = 0.5,
			textureColorTextDefaultR        = 1,
			textureColorTextDefaultG        = 1,
			textureColorTextDefaultB        = 1,
			textureColorTextCooldownR       = 1,
			textureColorTextCooldownG       = 1,
			textureColorTextCooldownB       = 1,
			textureColorBackgroundActiveR   = 1,
			textureColorBackgroundActiveG   = 1,
			textureColorBackgroundActiveB   = 1,
			textureColorBackgroundDefaultR  = 1,
			textureColorBackgroundDefaultG  = 1,
			textureColorBackgroundDefaultB  = 1,
			textureColorBackgroundCooldownR = 1,
			textureColorBackgroundCooldownG = 1,
			textureColorBackgroundCooldownB = 1,
			textureColorTimeLineActiveR     = 1,
			textureColorTimeLineActiveG     = 1,
			textureColorTimeLineActiveB     = 1,
			textureColorTimeLineDefaultR    = 1,
			textureColorTimeLineDefaultG    = 1,
			textureColorTimeLineDefaultB    = 1,
			textureColorTimeLineCooldownR   = 1,
			textureColorTimeLineCooldownG   = 1,
			textureColorTimeLineCooldownB   = 1,
		},
	}
end
