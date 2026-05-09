-- IberisUI 프로필 데이터 — [서약선] 캐릭 실측값
-- 32인치 모니터 / UIScale 0.7 기준 (4K UHD 3840×2160 환경에서 실측됨)
-- UIScale이 모든 픽셀 좌표에 곱해지므로 다른 해상도에서도 동일하게 동작.

local IUI, E, L = unpack((select(2, ...)))

-- ============================================================
-- IberisUI 단일 프로필 — [서약선] 캐릭 실측값
-- ============================================================
local PROFILE = {
	-- ElvUI movers (모두 절대 좌표)
	movers = {
		["AdditionalPowerMover"]            = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,491,288",
		["AlertFrameMover"]                 = "TOP,UIParent,TOP,0,-208",
		["ArenaHeaderMover"]                = "TOPRIGHT,UIParent,TOPRIGHT,-243,-381",
		["BNETMover"]                       = "TOPLEFT,UIParent,TOPLEFT,368,-284",
		["BelowMinimapContainerMover"]      = "TOP,UIParent,TOP,0,-75",
		["BenikUI_액션바_Mover"]             = "BOTTOM,ElvUIParent,BOTTOM,0,22",
		["BossHeaderMover"]                 = "TOPRIGHT,UIParent,TOPRIGHT,-243,-381",
		["BuffsMover"]                      = "TOPRIGHT,ElvUIParent,TOPRIGHT,-158,-3",
		["BuiDashboardMover"]               = "TOPLEFT,ElvUIParent,TOPLEFT,4,-8",
		["ClassBarMover"]                   = "BOTTOM,ElvUIParent,BOTTOM,0,360",
		["DTPanelBuiMiddleDTPanelMover"]    = "BOTTOM,ElvUIParent,BOTTOM,0,2",
		["DebuffsMover"]                    = "TOPRIGHT,ElvUIParent,TOPRIGHT,-158,-128",
		["DurabilityFrameMover"]            = "TOPRIGHT,UIParent,TOPRIGHT,-530,-176",
		["ElvAB_1"]                         = "BOTTOM,ElvUIParent,BOTTOM,0,145",
		["ElvAB_10"]                        = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,400",
		["ElvAB_2"]                         = "BOTTOM,ElvUIParent,BOTTOM,0,105",
		["ElvAB_3"]                         = "BOTTOM,ElvUIParent,BOTTOM,0,66",
		["ElvAB_4"]                         = "TOPRIGHT,UIParent,TOPRIGHT,-4,-327",
		["ElvAB_5"]                         = "BOTTOM,ElvUIParent,BOTTOM,0,27",
		["ElvAB_6"]                         = "TOPRIGHT,UIParent,TOPRIGHT,-45,-327",
		["ElvAB_7"]                         = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,298",
		["ElvAB_8"]                         = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,332",
		["ElvAB_9"]                         = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,366",
		["ElvNP_PlayerMover"]               = "TOP,UIParent,CENTER,0,-150",
		["ElvUF_AssistMover"]               = "TOPRIGHT,UIParent,TOPRIGHT,-240,-349",
		["ElvUF_BodyGuardMover"]            = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,444",
		["ElvUF_FocusCastbarMover"]         = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-518,223",
		["ElvUF_FocusMover"]                = "BOTTOM,ElvUIParent,BOTTOM,-292,301",
		["ElvUF_FocusTargetMover"]          = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-491,301",
		["ElvUF_PartyMover"]                = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,227",
		["ElvUF_PetCastbarMover"]           = "BOTTOM,ElvUIParent,BOTTOM,0,232",
		["ElvUF_PetMover"]                  = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,491,301",
		["ElvUF_PlayerCastbarMover"]        = "BOTTOM,ElvUIParent,BOTTOM,-231,147",
		["ElvUF_PlayerMover"]               = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,491,333",
		["ElvUF_Raid1Mover"]                = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,226",
		["ElvUF_Raid2Mover"]                = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,227",
		["ElvUF_Raid3Mover"]                = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,227",
		["ElvUF_RaidpetMover"]              = "TOPLEFT,ElvUIParent,TOPLEFT,3,-470",
		["ElvUF_TankMover"]                 = "TOPLEFT,ElvUIParent,TOPLEFT,3,-301",
		["ElvUF_TargetCastbarMover"]        = "BOTTOM,ElvUIParent,BOTTOM,231,147",
		["ElvUF_TargetMover"]               = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-491,333",
		["ElvUF_TargetTargetMover"]         = "BOTTOM,ElvUIParent,BOTTOM,292,301",
		["ElvUIBagMover"]                   = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,22",
		["ElvUIBankMover"]                  = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,2,23",
		["ExperienceBarMover"]              = "BOTTOMLEFT,UIParent,BOTTOMLEFT,351,22",
		["GMMover"]                         = "TOPLEFT,UIParent,TOPLEFT,158,-138",
		["HonorBarMover"]                   = "TOPRIGHT,ElvUIParent,TOPRIGHT,-2,-251",
		["LeftChatMover"]                   = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,2,22",
		["LocationMover"]                   = "TOP,ElvUIParent,TOP,0,-7",
		["LootFrameMover"]                  = "TOPLEFT,ElvUIParent,TOPLEFT,368,-188",
		["LossControlMover"]                = "BOTTOM,ElvUIParent,BOTTOM,-1,507",
		["MicrobarMover"]                   = "TOPLEFT,ElvUIParent,TOPLEFT,158,-5",
		["MinimapMover"]                    = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-6",
		["MirrorTimer1Mover"]               = "TOP,ElvUIParent,TOP,-1,-96",
		["MirrorTimer2Mover"]               = "TOP,MirrorTimer1,BOTTOM,0,0",
		["MirrorTimer3Mover"]               = "TOP,MirrorTimer2,BOTTOM,0,0",
		["ObjectiveFrameMover"]             = "TOPRIGHT,UIParent,TOPRIGHT,-295,-231",
		["PetAB"]                           = "BOTTOM,UIParent,BOTTOM,110,193",
		["PetExperienceBarMover"]           = "TOP,UIParent,TOP,0,-544",
		["PlayerNameplate"]                 = "BOTTOM,ElvUIParent,BOTTOM,0,359",
		["PlayerPowerBarMover"]             = "BOTTOM,ElvUIParent,BOTTOM,0,350",
		["ProfessionsMover"]                = "TOPLEFT,UIParent,TOPLEFT,4,-120",
		["QuestTimerFrameMover"]            = "TOPRIGHT,UIParent,TOPRIGHT,-421,-253",
		["QuestWatchFrameMover"]            = "TOPRIGHT,UIParent,TOPRIGHT,-290,-228",
		["ReputationBarMover"]              = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-351,22",
		["RightChatMover"]                  = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,22",
		["ShiftAB"]                         = "BOTTOM,ElvUIParent,BOTTOM,-120,193",
		["SocialMenuMover"]                 = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
		["SquareMinimapButtonBarMover"]     = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-298",
		["TargetPowerBarMover"]             = "BOTTOM,ElvUIParent,BOTTOM,231,215",
		["ThreatBarMover"]                  = "TOP,UIParent,TOP,0,-222",
		["TimeAlertFrameMover"]             = "TOPLEFT,ElvUIParent,TOPLEFT,368,-232",
		["TopCenterContainerMover"]         = "TOP,UIParent,TOP,0,-34",
		["TotemBarMover"]                   = "TOPLEFT,UIParent,TOPLEFT,368,-430",
		["TotemTrackerMover"]               = "TOPLEFT,UIParent,TOPLEFT,368,-465",
		["VOICECHAT"]                       = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
		["VehicleLeaveButton"]              = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,457,378",
		["VehicleSeatMover"]                = "TOPLEFT,UIParent,TOPLEFT,368,-336",
		["WatchFrameMover"]                 = "TOPRIGHT,ElvUIParent,TOPRIGHT,-122,-292",
		["reputationHolderMover"]           = "TOPLEFT,ElvUIParent,TOPLEFT,4,-320",
		["tokenHolderMover"]                = "TOPLEFT,ElvUIParent,TOPLEFT,4,-123",
	},

	-- ElvUI UIScale ([서약선] 실측값)
	-- mover 좌표/채팅창 위치 등 모든 픽셀 좌표에 곱해지므로 누락되면 위치가 모두 어긋남.
	uiScale = 0.7,

	-- ElvUI 패널 사이즈
	panels = {
		chatPanelWidth   = 348,  chatPanelHeight   = 166,
		bagWidth         = 348,  bankWidth         = 348,
		expBarHeight     = 166,  repBarHeight      = 166,
		threatBarWidth   = 472,  threatBarHeight   = 24,
		abPanelWidth     = 1228, abPanelHeight     = 166,
		middleDTWidth    = 1228, middleDTHeight    = 19,
	},

	-- 채팅창 (chat.lua 사용) — ChatFrame1/4 고정 크기
	chatFrames = {
		left  = { width = 338, height = 133 },
		right = { width = 338, height = 133 },
	},

	-- BigWigs InfoBox (BOTTOMRIGHT 기준 x/y)
	bigwigs = {
		infoBoxPosition = { nil, nil, -402, 142 },
	},

	-- Details — 4개 창 위치 + 모드
	-- libwindow*: _detalhes_global.instances[i].libwindow (LibWindow 형식)
	-- pos*:       _detalhes_database.local_instances_config[i].pos.normal (UIParent CENTER 기준 절대 좌표)
	-- 좌→우 순서: tiny threat / 치유 / 피해 / 피해 총합
	details = {
		instances = {
			-- inst 1: 피해량 (중앙 우측)
			{ point = "BOTTOM",       x =  327.74,  y = 20.31,
			  modo = 2, attribute = 1, sub = 1, segment = 0,
			  posX =  327.74, posY = -454.46, posW = 188, posH = 147 },
			-- inst 2: 피해량 총합 (우측 끝, segment=overall)
			{ point = "BOTTOMRIGHT",  x = -364.64,  y = 20.31,
			  modo = 2, attribute = 1, sub = 1, segment = -1,
			  posX =  516.31, posY = -454.46, posW = 188, posH = 147 },
			-- inst 3: tiny threat (좌측 끝, raid plugin 모드)
			{ point = "BOTTOMLEFT",   x =  364.47,  y = 17.28,
			  modo = 4, attribute = 1, sub = 1, segment = 0,
			  raidPlugin = "DETAILS_PLUGIN_TINY_THREAT",
			  posX = -516.48, posY = -457.10, posW = 188, posH = 148 },
			-- inst 4: 치유량 (중앙 좌측)
			{ point = "BOTTOM",       x = -328.29,  y = 17.28,
			  modo = 2, attribute = 2, sub = 1, segment = 0,
			  posX = -328.29, posY = -457.10, posW = 187, posH = 148 },
		},
	},

	-- HidingBar bar 위치 (anchor=right 기준)
	hidingBar = {
		barPosition    = 656.5999888181686,
		secondPosition = -109.119943071775,
	},

	-- MRT MarksBar
	mrt = {
		marksBarLeft = 0.714597225189209,
		marksBarTop  = 224.5321044921875,
	},

	-- ShamanPower (주술사 전용 위치)
	shamanPower = {
		loadoutBar      = { point = "LEFT", relPoint = "LEFT",
		                    x =  395.1753540039063, y = -154.2854614257813 },
		esTrackerPos    = { x =  389.71435546875,   y =  -26.66669845581055 },
		displayOffset   = { x =  998.597900390625,  y =  297.5 },
		poppedSingle    = { point = "CENTER", relPoint = "BOTTOMLEFT",
		                    x =  617.1428833007812, y =  491.6827697753906 },
		poppedDropall   = { point = "CENTER", relPoint = "BOTTOMLEFT",
		                    x =  619.1744995117188, y =  505.3970336914063 },
		rangeTracker    = { point = "BOTTOM",
		                    x = -357.0796813964844, y =  206.8249359130859 },
	},

	-- InvenRaidFrames3 (절대 픽셀 좌표)
	invenRaid = {
		px         =    2.285762310028076,
		py         = -652.808349609375,
		petpx      =  354.5177459716797,
		petpy      =  227.7413616943359,
		tankpx     =  -99.9998779296875,
		tankpy     =  -12,
	},

	-- Questie 트래커
	questie = {
		trackerLocation = { "TOPLEFT", "UIParent", "TOPLEFT",
		                    1509.786010742188, -319.99951171875 },
		trackerWidth    = 354.8571166992188,
		trackerHeight   = 706.2855224609375,
	},
}

-- 단일 프로필 노출
IUI.Profile = PROFILE

-- 프로필 데이터 조회 — addonProfiles/* 및 install.lua에서 사용
function IUI:GetProfileData()
	return PROFILE
end
