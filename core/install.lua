local IUI, E, L = unpack((select(2, ...)))
local ReloadUI = ReloadUI
local tinsert, wipe = table.insert, table.wipe or wipe
local format = string.format

-- 중첩 테이블 경로 보장 — 본섭/타 클라/fresh install에서 외부 애드온 DB
-- 서브테이블이 없을 때 nil 인덱싱 에러 방지. 마지막 키 직전까지 테이블 생성 후 마지막 테이블 반환.
-- 사용: ensure(E.db.benikui, "Databars", "experience").notifiers = {...}
local function ensure(root, ...)
	local n = select("#", ...)
	for i = 1, n do
		local k = select(i, ...)
		root[k] = root[k] or {}
		root = root[k]
	end
	return root
end

-- ============================================================
-- ApplyIberisProfile — 내보내기 정확한 값 verbatim 적용
-- 모든 좌표/사이즈는 IUI:GetProfileData()에서 조회 (단일 프로필)
-- ============================================================
local function ApplyIberisProfile()
	local res = IUI:GetProfileData()
	print("|cff00ff00IberisUI|r ApplyIberisProfile 진입")

	-- UIScale ([서약선] 실측 0.7) — 모든 mover 픽셀 좌표 + 채팅창 위치 기준이 됨.
	-- 누락 시 ElvUI가 디폴트 스케일 (1.0 또는 자동) 사용 → 모든 위치 어긋남.
	if E.global and E.global.general then
		E.global.general.UIScale = res.uiScale
	end
	if E.PixelScaleChanged then
		pcall(function() E:PixelScaleChanged() end)
	elseif E.UIScale then
		pcall(function() E:UIScale() end)
	end

	-- 현재 프로필에 직접 기록 (ElvUI/BenikUI 설치마법사와 동일한 방식)
	-- E.data:SetProfile() 호출 금지: OnProfileChanged → ElvUI 전체 재초기화 → 마법사 오동작
	E.db["actionbar"]["bar1"]["enabled"] = true
	E.db["actionbar"]["bar1"]["buttons"] = 12
	E.db["actionbar"]["bar1"]["buttonsPerRow"] = 12
	E.db["actionbar"]["bar1"]["backdropSpacing"] = 6
	E.db["actionbar"]["bar1"]["buttonSize"] = 36
	E.db["actionbar"]["bar1"]["buttonSpacing"] = 3
	E.db["actionbar"]["bar1"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar1"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar1"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar1"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar1"]["macroTextYOffset"] = 0
	E.db["actionbar"]["bar1"]["macrotext"] = true
	E.db["actionbar"]["bar10"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar10"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar10"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar2"]["backdropSpacing"] = 6
	E.db["actionbar"]["bar2"]["buttonSize"] = 36
	E.db["actionbar"]["bar2"]["buttonSpacing"] = 3
	E.db["actionbar"]["bar2"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar2"]["enabled"] = true
	E.db["actionbar"]["bar2"]["heightMult"] = 2
	E.db["actionbar"]["bar2"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar2"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar2"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar2"]["macroTextYOffset"] = 0
	E.db["actionbar"]["bar2"]["macrotext"] = true
	E.db["actionbar"]["bar2"]["visibility"] = "[petbattle] hide; show"
	E.db["actionbar"]["bar3"]["backdropSpacing"] = 6
	E.db["actionbar"]["bar3"]["buttonSize"] = 36
	E.db["actionbar"]["bar3"]["buttonSpacing"] = 3
	E.db["actionbar"]["bar3"]["buttons"] = 12
	E.db["actionbar"]["bar3"]["buttonsPerRow"] = 12
	E.db["actionbar"]["bar3"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar3"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar3"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar3"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar3"]["macroTextYOffset"] = 0
	E.db["actionbar"]["bar3"]["macrotext"] = true
	E.db["actionbar"]["bar3"]["visibility"] = "[petbattle] hide; show"
	E.db["actionbar"]["bar3"]["enabled"] = true
	E.db["actionbar"]["bar4"]["backdropSpacing"] = 3
	E.db["actionbar"]["bar4"]["buttonSize"] = 36
	E.db["actionbar"]["bar4"]["buttonSpacing"] = 1
	E.db["actionbar"]["bar4"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar4"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar4"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar4"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar4"]["macroTextYOffset"] = 0
	E.db["actionbar"]["bar4"]["macrotext"] = true
	E.db["actionbar"]["bar4"]["enabled"] = true
	E.db["actionbar"]["bar4"]["buttons"] = 12
	E.db["actionbar"]["bar4"]["buttonsPerRow"] = 1
	E.db["actionbar"]["bar4"]["point"] = "TOPLEFT"
	E.db["actionbar"]["bar4"]["visibility"] = "[petbattle] hide; show"
	E.db["actionbar"]["bar5"]["backdropSpacing"] = 6
	E.db["actionbar"]["bar5"]["buttonSize"] = 36
	E.db["actionbar"]["bar5"]["buttonSpacing"] = 3
	E.db["actionbar"]["bar5"]["buttons"] = 12
	E.db["actionbar"]["bar5"]["buttonsPerRow"] = 12
	E.db["actionbar"]["bar5"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar5"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar5"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar5"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar5"]["macroTextYOffset"] = 0
	E.db["actionbar"]["bar5"]["macrotext"] = true
	E.db["actionbar"]["bar5"]["visibility"] = "[petbattle] hide; show"
	E.db["actionbar"]["bar5"]["enabled"] = true
	E.db["actionbar"]["bar6"]["backdrop"] = true
	E.db["actionbar"]["bar6"]["backdropSpacing"] = 3
	E.db["actionbar"]["bar6"]["buttonSize"] = 36
	E.db["actionbar"]["bar6"]["buttonSpacing"] = 1
	E.db["actionbar"]["bar6"]["buttons"] = 12
	E.db["actionbar"]["bar6"]["buttonsPerRow"] = 1
	E.db["actionbar"]["bar6"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar6"]["enabled"] = true
	E.db["actionbar"]["bar6"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar6"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar6"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar6"]["macroTextYOffset"] = 0
	E.db["actionbar"]["bar6"]["macrotext"] = true
	E.db["actionbar"]["bar6"]["point"] = "TOPLEFT"
	E.db["actionbar"]["bar6"]["visibility"] = "[petbattle] hide; show"
	E.db["actionbar"]["bar7"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar7"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar7"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar8"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar8"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar8"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar9"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar9"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar9"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["barPet"]["backdrop"] = false
	E.db["actionbar"]["barPet"]["backdropSpacing"] = 6
	E.db["actionbar"]["barPet"]["buttonSize"] = 20
	E.db["actionbar"]["barPet"]["buttonSpacing"] = 4
	E.db["actionbar"]["barPet"]["buttonsPerRow"] = 10
	E.db["actionbar"]["barPet"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["barPet"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["barPet"]["point"] = "TOPLEFT"
	E.db["actionbar"]["desaturateOnCooldown"] = true
	E.db["actionbar"]["extraActionButton"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["font"] = "Expressway"
	E.db["actionbar"]["fontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["rightClickSelfCast"] = true
	E.db["actionbar"]["stanceBar"]["buttonSize"] = 30
	E.db["actionbar"]["stanceBar"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["transparent"] = true
	E.db["actionbar"]["vehicleExitButton"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["auras"]["buffs"]["countFont"] = "기본 글꼴"
	E.db["auras"]["buffs"]["countFontOutline"] = "NONE"
	E.db["auras"]["buffs"]["horizontalSpacing"] = 3
	E.db["auras"]["buffs"]["size"] = 30
	E.db["auras"]["debuffs"]["countFont"] = "기본 글꼴"
	E.db["auras"]["debuffs"]["countFontOutline"] = "NONE"
	E.db["auras"]["debuffs"]["size"] = 30
	E.db["bags"]["autoToggle"]["guildBank"] = true
	E.db["bags"]["bagSize"] = 32
	E.db["bags"]["bagWidth"] = res.panels.bagWidth
	E.db["bags"]["bankSize"] = 32
	E.db["bags"]["bankWidth"] = res.panels.bankWidth
	E.db["bags"]["clearSearchOnClose"] = true
	E.db["bags"]["countFont"] = "Expressway"
	E.db["bags"]["countFontOutline"] = "OUTLINE"
	E.db["bags"]["itemInfoFontOutline"] = "NONE"
	E.db["bags"]["itemLevelFont"] = "Expressway"
	E.db["bags"]["itemLevelFontOutline"] = "OUTLINE"
	E.db["bags"]["junkDesaturate"] = true
	E.db["bags"]["junkIcon"] = true
	E.db["bags"]["reverseSlots"] = true
	E.db["bags"]["scrapIcon"] = true
	E.db["bags"]["showBindType"] = true
	E.db["bags"]["split"]["bag1"] = true
	E.db["bags"]["split"]["bag2"] = true
	E.db["bags"]["split"]["bag3"] = true
	E.db["bags"]["split"]["bag4"] = true
	E.db["bags"]["transparent"] = true
	E.db["bags"]["vendorGrays"]["details"] = true
	E.db["bags"]["vendorGrays"]["enable"] = true
	if E.db["benikui"] then
		-- BenikUI 정보막대(notifiers)만 끔. BenikUI Style 오버레이는 유지.
		-- 키 케이싱이 클라마다 달라 양쪽 다 써둠:
		--   불성/오리지널: E.db.benikui.Databars (대문자 D)
		--   본섭(Mainline): E.db.benikui.databars (소문자 d)
		-- 해당 클라가 안 쓰는 키는 dead key라 무해.
		ensure(E.db.benikui, "Databars", "experience", "notifiers").enable = false
		ensure(E.db.benikui, "Databars", "reputation", "notifiers").enable = false
		ensure(E.db.benikui, "Databars", "threat").enable = false
		ensure(E.db.benikui, "databars", "experience", "notifiers").enable = false
		ensure(E.db.benikui, "databars", "reputation", "notifiers").enable = false
		ensure(E.db.benikui, "databars", "experience").buiStyle = true
		ensure(E.db.benikui, "databars", "reputation").buiStyle = true
		local abStyle = ensure(E.db.benikui, "actionbars", "style")
		abStyle.bar1 = false; abStyle.bar2 = false; abStyle.bar3 = false; abStyle.bar5 = false
		abStyle.bar7 = false; abStyle.bar8 = false; abStyle.bar9 = false; abStyle.bar10 = false
		ensure(E.db.benikui, "actionbars", "toggleButtons").chooseAb = "BAR1"
		local colors = ensure(E.db.benikui, "colors")
		colors.abAlpha = 0.7
		colors.styleAlpha = 0.7
		ensure(E.db.benikui, "dashboards", "tokens").enableTokens = false
		ensure(E.db.benikui, "misc", "flightMode").enable = false
		if not E.db["benikui"]["general"] then E.db["benikui"]["general"] = {} end
		E.db["benikui"]["general"]["auras"] = false
		if not E.db["benikui"]["panels"] then E.db["benikui"]["panels"] = {} end
		if not E.db["benikui"]["panels"]["BenikUI_액션바"] then E.db["benikui"]["panels"]["BenikUI_액션바"] = {} end
		do
			local abPanel = E.db["benikui"]["panels"]["BenikUI_액션바"]
			abPanel["clickThrough"] = true
			abPanel["combatHide"] = false
			if not abPanel["customStyleColor"] then abPanel["customStyleColor"] = {} end
			abPanel["customStyleColor"]["b"] = 0
			abPanel["customStyleColor"]["g"] = 0.7
			abPanel["customStyleColor"]["r"] = 0.9
			abPanel["enable"] = true
			abPanel["height"] = res.panels.abPanelHeight
			abPanel["point"] = "CENTER"
			abPanel["shadow"] = true
			abPanel["strata"] = "BACKGROUND"
			abPanel["style"] = true
			abPanel["styleColor"] = 1
			abPanel["stylePosition"] = "TOP"
			if not abPanel["title"] then abPanel["title"] = {} end
			abPanel["title"]["enable"] = false
			abPanel["title"]["font"] = "Expressway"
			if not abPanel["title"]["fontColor"] then abPanel["title"]["fontColor"] = {} end
			abPanel["title"]["fontColor"]["b"] = 0.9
			abPanel["title"]["fontColor"]["g"] = 0.9
			abPanel["title"]["fontColor"]["r"] = 0.9
			abPanel["title"]["fontflags"] = "OUTLINE"
			abPanel["title"]["fontsize"] = 11
			abPanel["title"]["height"] = 26
			if not abPanel["title"]["panelColor"] then abPanel["title"]["panelColor"] = {} end
			abPanel["title"]["panelColor"]["a"] = 0.7
			abPanel["title"]["panelColor"]["b"] = 0
			abPanel["title"]["panelColor"]["g"] = 0.7
			abPanel["title"]["panelColor"]["r"] = 0.9
			abPanel["title"]["panelTexture"] = "BuiMelli"
			abPanel["title"]["position"] = "TOP"
			abPanel["title"]["text"] = "Title"
			abPanel["title"]["textPosition"] = "CENTER"
			abPanel["title"]["textXoffset"] = 0
			abPanel["title"]["textYoffset"] = 0
			abPanel["title"]["useDTfont"] = true
			abPanel["tooltip"] = false
			abPanel["transparency"] = true
			abPanel["visibility"] = ""
			abPanel["width"] = res.panels.abPanelWidth
		end
		ensure(E.db.benikui, "unitframes", "target").getPlayerPortraitSize = false
	end
	E.db["chat"]["font"] = "Expressway"
	-- chat.keywordSound / chat.keywords 제거 — 개인 알림 키워드는 신규 유저가 직접 설정
	E.db["chat"]["panelColor"]["a"] = 0.75
	E.db["chat"]["panelColor"]["b"] = 0.054
	E.db["chat"]["panelColor"]["g"] = 0.054
	E.db["chat"]["panelColor"]["r"] = 0.054
	E.db["chat"]["panelHeight"] = res.panels.chatPanelHeight
	E.db["chat"]["panelWidth"]  = res.panels.chatPanelWidth
	E.db["chat"]["panelSnapLeftID"]  = 1
	E.db["chat"]["panelSnapRightID"] = 4
	E.db["chat"]["panelBackdrop"] = "SHOWBOTH"
	E.db["chat"]["tabFont"] = "Expressway"
	E.db["chat"]["tabFontOutline"] = "OUTLINE"
	E.db["chat"]["tabFontSize"] = 11
	E.db["chat"]["tabSelectorColor"]["r"] = 0
	E.db["chat"]["tabSelectorColor"]["g"] = 0.44
	E.db["chat"]["tabSelectorColor"]["b"] = 0.87
	E.db["convertPages"] = true
	E.db["cooldown"]["actionbar"]["fontSize"] = 12
	E.db["cooldown"]["auras"]["fontSize"] = 10
	E.db["cooldown"]["global"]["fontSize"] = 15
	E.db["cooldown"]["unitframe"]["fontSize"] = 10
	E.db["databars"]["azerite"]["enable"] = false
	-- honor 바: 본섭/불성/오리지널 모두 비활성 (사용자 요청, 별도 배치 없음)
	-- 본섭 외 클라이언트엔 honor 키가 없을 수 있어 ensure로 방어
	ensure(E.db.databars, "honor").enable = false
	E.db["databars"]["experience"]["font"] = "Expressway"
	E.db["databars"]["experience"]["fontSize"] = 10
	E.db["databars"]["experience"]["height"] = res.panels.expBarHeight
	E.db["databars"]["experience"]["hideAtMaxLevel"] = false
	E.db["databars"]["experience"]["orientation"] = "VERTICAL"
	E.db["databars"]["experience"]["showLevel"] = true
	E.db["databars"]["experience"]["textYoffset"] = 10
	E.db["databars"]["experience"]["width"] = 9
	E.db["databars"]["petExperience"]["enable"] = false
	E.db["databars"]["reputation"]["enable"] = true
	E.db["databars"]["reputation"]["fontSize"] = 9
	E.db["databars"]["reputation"]["height"] = res.panels.repBarHeight
	E.db["databars"]["reputation"]["orientation"] = "VERTICAL"
	E.db["databars"]["reputation"]["width"] = 9
	E.db["databars"]["statusbar"] = "BuiFlat"
	E.db["databars"]["threat"]["enable"] = false
	E.db["databars"]["threat"]["height"] = res.panels.threatBarHeight
	E.db["databars"]["threat"]["width"]  = res.panels.threatBarWidth
	E.db["datatexts"]["font"] = "Expressway"
	E.db["datatexts"]["fontOutline"] = "OUTLINE"
	E.db["datatexts"]["fontSize"] = 11
	local dtPanels = E.db["datatexts"]["panels"]
	-- DT 패널 박기 — 등록되지 않은 panel은 ElvUI DT:UpdatePanelInfo가 nil 인덱싱 에러 발생.
	-- BenikUI custom panels(BuiLeft/Middle/RightChatDTPanel)는 BenikUI Layout/Chat 모듈이
	-- frame을 생성한 후 RegisterPanel로 등록함. 우리는 BUI Layout:CreateMiddlePanel + CP:UpdatePanels 호출
	-- (블록 끝부분)에서 등록을 트리거하므로 그 시점 이전에 dtPanels 박기는 안전.
	-- 그래도 신규 유저 환경에서 panel 등록 실패 가능성 대비 — pcall로 감싸기.
	local DT = E:GetModule("DataTexts", true)
	-- BenikUI custom panel(BuiLeft/Middle/Right ChatDTPanel)이 등록되어 있을 때만 박음.
	-- 등록 안 된 panel에 박으면 ElvUI DT:UpdatePanelInfo가 nil panel로 호출되며 에러.
	local function safeSetDT(panelName, fields, requireRegistered)
		if requireRegistered and DT and DT.RegisteredPanels and not DT.RegisteredPanels[panelName] then
			return
		end
		dtPanels[panelName] = dtPanels[panelName] or {}
		for k, v in pairs(fields) do dtPanels[panelName][k] = v end
	end
	safeSetDT("BuiLeftChatDTPanel",  { [1] = "BuiMail", [2] = "System", [3] = "ElvUI" }, true)
	-- BuiMiddleDTPanel은 여기서 박지 않음 — BUI Layout:CreateMiddlePanel 호출 후에 박는다.
	-- (frame이 생성되고 RegisterPanel 등록되기 전 박으면 ElvUI 자동 갱신이 panel nil로 호출되어 에러)
	safeSetDT("BuiRightChatDTPanel", { [1] = "Durability" }, true)
	safeSetDT("LeftChatDataPanel",   { [3] = "QuickJoin", enable = false })
	if dtPanels["LocPlusLeftDT"] then
		dtPanels["LocPlusLeftDT"][1] = "MovementSpeed"
	end
	safeSetDT("RightChatDataPanel",  { enable = false })
	E.db["datatexts"]["rightChatPanel"] = false
	E.db["datatexts"]["battlePanel"] = E.db["datatexts"]["battlePanel"] or {}
	E.db["datatexts"]["battlePanel"]["BuiMiddleDTPanel"] = {"","","","",""}
	-- 자동화 옵션 (autoAcceptInvite/autoRepair/autoTrackReputation) 제거 — 개인 호불호 영역
	E.db["general"]["layoutSet"] = "tank"
	E.db["general"]["backdropcolor"]["b"] = 0.025
	E.db["general"]["backdropcolor"]["g"] = 0.025
	E.db["general"]["backdropcolor"]["r"] = 0.025
	E.db["general"]["backdropfadecolor"]["a"] = 0.75
	E.db["general"]["backdropfadecolor"]["b"] = 0.054
	E.db["general"]["backdropfadecolor"]["g"] = 0.054
	E.db["general"]["backdropfadecolor"]["r"] = 0.054
	E.db["general"]["bonusObjectivePosition"] = "AUTO"
	E.db["general"]["bottomPanel"] = false
	E.db["general"]["decimalLength"] = 2
	E.db["general"]["font"] = "Expressway"
	E.db["general"]["fontSize"] = 11
	-- general.interruptAnnounce 제거 — 방해 알림 채널은 개인 영역
	E.db["general"]["itemLevel"]["displayCharacterInfo"] = false
	E.db["general"]["itemLevel"]["displayInspectInfo"] = false
	E.db["general"]["minimap"]["locationText"] = "HIDE"
	E.db["general"]["minimap"]["size"] = 150
	E.db["general"]["objectiveFrameAutoHide"] = false
	E.db["general"]["objectiveFrameHeight"] = 750
	E.db["general"]["smoothingAmount"] = 0.5
	E.db["general"]["talkingHeadFrameScale"] = 1
	E.db["general"]["totems"]["growthDirection"] = "HORIZONTAL"
	E.db["general"]["totems"]["size"] = 50
	E.db["general"]["totems"]["spacing"] = 8
	E.db["general"]["valuecolor"]["b"] = 0
	E.db["general"]["valuecolor"]["g"] = 0.5
	E.db["general"]["valuecolor"]["r"] = 1
	if E.db["locplus"] then
		E.db["locplus"]["both"] = false
		E.db["locplus"]["displayOther"] = "NONE"
		E.db["locplus"]["dtheight"] = 18
		E.db["locplus"]["dtwidth"] = 120
		E.db["locplus"]["lpauto"] = false
		E.db["locplus"]["lpfontsize"] = 11
		E.db["locplus"]["lpwidth"] = 220
		E.db["locplus"]["shadow"] = true
		E.db["locplus"]["trunc"] = true
	end
	-- 무버 좌표 — 해상도별 테이블에서 일괄 적용
	E.db["movers"] = E.db["movers"] or {}
	for k, v in pairs(res.movers) do
		E.db["movers"][k] = v
	end
	E.db["nameplates"]["colors"]["selection"][0] = E.db["nameplates"]["colors"]["selection"][0] or {}
	E.db["nameplates"]["colors"]["selection"][0]["b"] = 0.25
	E.db["nameplates"]["colors"]["selection"][0]["g"] = 0.25
	E.db["nameplates"]["colors"]["selection"][0]["r"] = 0.78
	E.db["nameplates"]["colors"]["selection"][2] = E.db["nameplates"]["colors"]["selection"][2] or {}
	E.db["nameplates"]["colors"]["selection"][2]["b"] = 0.36
	E.db["nameplates"]["colors"]["selection"][2]["g"] = 0.76
	E.db["nameplates"]["colors"]["selection"][2]["r"] = 0.85
	E.db["nameplates"]["colors"]["selection"][3] = E.db["nameplates"]["colors"]["selection"][3] or {}
	E.db["nameplates"]["colors"]["selection"][3]["b"] = 0.3
	E.db["nameplates"]["colors"]["selection"][3]["g"] = 0.67
	E.db["nameplates"]["colors"]["selection"][3]["r"] = 0.29
	E.db["nameplates"]["colors"]["threat"]["badColor"]["b"] = 0.25
	E.db["nameplates"]["colors"]["threat"]["badColor"]["g"] = 0.25
	E.db["nameplates"]["colors"]["threat"]["badColor"]["r"] = 0.78
	E.db["nameplates"]["colors"]["threat"]["goodColor"]["b"] = 0.3
	E.db["nameplates"]["colors"]["threat"]["goodColor"]["g"] = 0.67
	E.db["nameplates"]["colors"]["threat"]["goodColor"]["r"] = 0.29
	E.db["nameplates"]["colors"]["threat"]["goodTransition"]["b"] = 0.36
	E.db["nameplates"]["colors"]["threat"]["goodTransition"]["g"] = 0.76
	E.db["nameplates"]["colors"]["threat"]["goodTransition"]["r"] = 0.85
	E.db["nameplates"]["font"] = "Bui Visitor1"
	E.db["nameplates"]["fontOutline"] = "MONOCHROMEOUTLINE"
	E.db["nameplates"]["fontSize"] = 10
	E.db["nameplates"]["statusbar"] = "BuiFlat"
	E.db["nameplates"]["units"]["ENEMY_NPC"]["auras"]["enable"] = false
	E.db["nameplates"]["units"]["ENEMY_NPC"]["raidTargetIndicator"]["position"] = "RIGHT"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["auras"]["enable"] = false
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["countFont"] = "Expressway"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["numAuras"] = 7
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["numRows"] = 2
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["size"] = 22
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["anchorPoint"] = "TOPLEFT"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["attachTo"] = "BUFFS"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["countFont"] = "Expressway"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["growthX"] = "RIGHT"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["numAuras"] = 7
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["numRows"] = 3
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["size"] = 22
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["yOffset"] = 1
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["format"] = ""
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["level"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["portrait"]["classicon"] = false
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["portrait"]["enable"] = true
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["portrait"]["position"] = "LEFT"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["portrait"]["xOffset"] = 0
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["portrait"]["yOffset"] = 0
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["power"]["text"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["raidTargetIndicator"]["position"] = "RIGHT"
	E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["countFont"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_NPC"]["castbar"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["countFont"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_NPC"]["health"]["text"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_NPC"]["level"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_NPC"]["name"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_NPC"]["power"]["text"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["auras"]["enable"] = false
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["countFont"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["castbar"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["countFont"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["health"]["text"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["level"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["name"]["font"] = "Expressway"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["power"]["text"]["font"] = "Expressway"
	E.db["tooltip"]["alwaysShowRealm"] = true
	E.db["tooltip"]["cursorAnchor"] = true
	E.db["tooltip"]["cursorAnchorType"] = "ANCHOR_CURSOR_RIGHT"
	E.db["tooltip"]["cursorAnchorX"] = 50
	E.db["tooltip"]["cursorAnchorY"] = -25
	E.db["tooltip"]["font"] = "Expressway"
	E.db["tooltip"]["headerFontSize"] = 11
	E.db["tooltip"]["healthBar"]["font"] = "Expressway"
	E.db["tooltip"]["healthBar"]["fontSize"] = 9
	E.db["tooltip"]["healthBar"]["height"] = 6
	E.db["tooltip"]["itemQuality"] = true
	E.db["tooltip"]["smallTextFontSize"] = 11
	E.db["tooltip"]["textFontSize"] = 11
	E.db["unitframe"]["colors"]["auraBarBuff"]["b"] = 0.1
	E.db["unitframe"]["colors"]["auraBarBuff"]["g"] = 0.1
	E.db["unitframe"]["colors"]["auraBarBuff"]["r"] = 0.1
	E.db["unitframe"]["colors"]["castClassColor"] = true
	E.db["unitframe"]["colors"]["castColor"]["b"] = 0.1
	E.db["unitframe"]["colors"]["castColor"]["g"] = 0.1
	E.db["unitframe"]["colors"]["castColor"]["r"] = 0.1
	E.db["unitframe"]["colors"]["castReactionColor"] = true
	E.db["unitframe"]["colors"]["colorhealthbyvalue"] = false
	E.db["unitframe"]["colors"]["health"]["b"] = 0.1
	E.db["unitframe"]["colors"]["health"]["g"] = 0.1
	E.db["unitframe"]["colors"]["health"]["r"] = 0.1
	E.db["unitframe"]["colors"]["health_backdrop_dead"]["b"] = 0.003921568627451
	E.db["unitframe"]["colors"]["health_backdrop_dead"]["g"] = 0.003921568627451
	E.db["unitframe"]["colors"]["health_backdrop_dead"]["r"] = 0.14901960784314
	E.db["unitframe"]["colors"]["healthclass"] = true
	E.db["unitframe"]["colors"]["power"]["MANA"]["b"] = 0.63137254901961
	E.db["unitframe"]["colors"]["power"]["MANA"]["g"] = 0.45098039215686
	E.db["unitframe"]["colors"]["power"]["MANA"]["r"] = 0.30980392156863
	E.db["unitframe"]["colors"]["transparentAurabars"] = true
	E.db["unitframe"]["colors"]["useDeadBackdrop"] = true
	E.db["unitframe"]["font"] = "Expressway"
	E.db["unitframe"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["fontSize"] = 11
	-- unitframe.targetSound 제거 — 대상 변경 효과음은 개인 호불호
	E.db["unitframe"]["units"]["arena"]["width"] = 225
	E.db["unitframe"]["units"]["assist"]["enable"] = false
	E.db["unitframe"]["units"]["boss"]["buffs"]["anchorPoint"] = "RIGHT"
	E.db["unitframe"]["units"]["boss"]["buffs"]["maxDuration"] = 300
	E.db["unitframe"]["units"]["boss"]["buffs"]["sizeOverride"] = 15
	E.db["unitframe"]["units"]["boss"]["buffs"]["yOffset"] = 16
	E.db["unitframe"]["units"]["boss"]["castbar"]["width"] = 148
	E.db["unitframe"]["units"]["boss"]["debuffs"]["anchorPoint"] = "RIGHT"
	E.db["unitframe"]["units"]["boss"]["debuffs"]["maxDuration"] = 300
	E.db["unitframe"]["units"]["boss"]["debuffs"]["sizeOverride"] = 15
	E.db["unitframe"]["units"]["boss"]["debuffs"]["yOffset"] = -16
	E.db["unitframe"]["units"]["boss"]["height"] = 30
	E.db["unitframe"]["units"]["boss"]["infoPanel"]["height"] = 17
	E.db["unitframe"]["units"]["boss"]["middleClickFocus"] = true
	E.db["unitframe"]["units"]["boss"]["threatStyle"] = "BORDERS"
	E.db["unitframe"]["units"]["boss"]["width"] = 148
	E.db["unitframe"]["units"]["focus"]["castbar"]["height"] = 14
	E.db["unitframe"]["units"]["focus"]["castbar"]["iconSize"] = 26
	E.db["unitframe"]["units"]["focus"]["castbar"]["overlayOnFrame"] = "Health"
	E.db["unitframe"]["units"]["focus"]["castbar"]["smoothbars"] = true
	E.db["unitframe"]["units"]["focus"]["castbar"]["width"] = 125
	E.db["unitframe"]["units"]["focus"]["disableMouseoverGlow"] = true
	E.db["unitframe"]["units"]["focus"]["disableTargetGlow"] = true
	E.db["unitframe"]["units"]["focus"]["fader"]["minAlpha"] = 0.75
	E.db["unitframe"]["units"]["focus"]["health"]["smoothbars"] = true
	E.db["unitframe"]["units"]["focus"]["height"] = 30
	E.db["unitframe"]["units"]["focus"]["infoPanel"]["height"] = 12
	E.db["unitframe"]["units"]["focus"]["infoPanel"]["transparent"] = true
	E.db["unitframe"]["units"]["focus"]["portrait"]["camDistanceScale"] = 1
	E.db["unitframe"]["units"]["focus"]["power"]["height"] = 7
	E.db["unitframe"]["units"]["focus"]["power"]["position"] = "CENTER"
	E.db["unitframe"]["units"]["focus"]["power"]["xOffset"] = 0
	E.db["unitframe"]["units"]["focus"]["width"] = 125
	E.db["unitframe"]["units"]["focustarget"]["disableMouseoverGlow"] = true
	E.db["unitframe"]["units"]["focustarget"]["disableTargetGlow"] = true
	E.db["unitframe"]["units"]["focustarget"]["enable"] = true
	E.db["unitframe"]["units"]["focustarget"]["fader"]["minAlpha"] = 0.75
	E.db["unitframe"]["units"]["focustarget"]["health"]["smoothbars"] = true
	E.db["unitframe"]["units"]["focustarget"]["height"] = 30
	E.db["unitframe"]["units"]["focustarget"]["power"]["height"] = 7
	E.db["unitframe"]["units"]["focustarget"]["power"]["position"] = "CENTER"
	E.db["unitframe"]["units"]["focustarget"]["power"]["xOffset"] = 0
	E.db["unitframe"]["units"]["focustarget"]["width"] = 125
	if not E.db["unitframe"]["units"]["party"]["customTexts"] then E.db["unitframe"]["units"]["party"]["customTexts"] = {} end
	if not E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"] then E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"] = {} end
	E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["enable"] = false
	E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["font"] = "Expressway"
	E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["justifyH"] = "RIGHT"
	E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["size"] = 12
	E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["text_format"] = "[health:current-percent]"
	E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["xOffset"] = 0
	E.db["unitframe"]["units"]["party"]["customTexts"]["BenikuiPartyHealth"]["yOffset"] = 0
	E.db["unitframe"]["units"]["party"]["buffs"]["perrow"] = 3
	E.db["unitframe"]["units"]["party"]["debuffs"]["enable"] = false
	E.db["unitframe"]["units"]["party"]["debuffs"]["perrow"] = 3
	E.db["unitframe"]["units"]["party"]["debuffs"]["sizeOverride"] = 0
	E.db["unitframe"]["units"]["party"]["enable"] = false
	E.db["unitframe"]["units"]["party"]["groupBy"] = "GROUP"
	E.db["unitframe"]["units"]["party"]["growthDirection"] = "DOWN_RIGHT"
	E.db["unitframe"]["units"]["party"]["healPrediction"]["enable"] = true
	E.db["unitframe"]["units"]["party"]["health"]["position"] = "BOTTOM"
	E.db["unitframe"]["units"]["party"]["health"]["text_format"] = "[healthcolor][health:deficit:shortvalue]"
	E.db["unitframe"]["units"]["party"]["health"]["yOffset"] = 2
	E.db["unitframe"]["units"]["party"]["height"] = 45
	E.db["unitframe"]["units"]["party"]["horizontalSpacing"] = 3
	E.db["unitframe"]["units"]["party"]["infoPanel"]["height"] = 12
	E.db["unitframe"]["units"]["party"]["name"]["text_format"] = "[classcolor][name:short]"
	E.db["unitframe"]["units"]["party"]["orientation"] = "MIDDLE"
	E.db["unitframe"]["units"]["party"]["petsGroup"]["disableFocusGlow"] = false
	E.db["unitframe"]["units"]["party"]["petsGroup"]["disableTargetGlow"] = false
	E.db["unitframe"]["units"]["party"]["petsGroup"]["enable"] = true
	E.db["unitframe"]["units"]["party"]["petsGroup"]["healPrediction"]["enable"] = true
	E.db["unitframe"]["units"]["party"]["petsGroup"]["height"] = 25
	E.db["unitframe"]["units"]["party"]["petsGroup"]["width"] = 60
	E.db["unitframe"]["units"]["party"]["power"]["position"] = "BOTTOMRIGHT"
	E.db["unitframe"]["units"]["party"]["power"]["text_format"] = ""
	E.db["unitframe"]["units"]["party"]["power"]["yOffset"] = 2
	E.db["unitframe"]["units"]["party"]["rdebuffs"]["enable"] = false
	E.db["unitframe"]["units"]["party"]["roleIcon"]["enable"] = false
	E.db["unitframe"]["units"]["party"]["targetsGroup"]["disableFocusGlow"] = false
	E.db["unitframe"]["units"]["party"]["targetsGroup"]["disableTargetGlow"] = false
	E.db["unitframe"]["units"]["party"]["width"] = 70
	E.db["unitframe"]["units"]["pet"]["buffs"]["enable"] = true
	E.db["unitframe"]["units"]["pet"]["buffs"]["growthY"] = "DOWN"
	E.db["unitframe"]["units"]["pet"]["castbar"]["enable"] = false
	E.db["unitframe"]["units"]["pet"]["castbar"]["height"] = 10
	E.db["unitframe"]["units"]["pet"]["castbar"]["iconSize"] = 32
	E.db["unitframe"]["units"]["pet"]["castbar"]["width"] = 125
	if not E.db["unitframe"]["units"]["pet"]["customTexts"] then E.db["unitframe"]["units"]["pet"]["customTexts"] = {} end
	if not E.db["unitframe"]["units"]["pet"]["customTexts"]["만족도"] then E.db["unitframe"]["units"]["pet"]["customTexts"]["만족도"] = {} end
	E.db["unitframe"]["units"]["pet"]["customTexts"]["만족도"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["만족도"]["enable"] = true
	E.db["unitframe"]["units"]["pet"]["customTexts"]["만족도"]["font"] = "Expressway"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["만족도"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["만족도"]["justifyH"] = "LEFT"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["만족도"]["size"] = 11
	E.db["unitframe"]["units"]["pet"]["customTexts"]["만족도"]["text_format"] = ""
	E.db["unitframe"]["units"]["pet"]["customTexts"]["만족도"]["xOffset"] = 4
	E.db["unitframe"]["units"]["pet"]["customTexts"]["만족도"]["yOffset"] = 0
	E.db["unitframe"]["units"]["pet"]["debuffs"]["attachTo"] = "BUFFS"
	E.db["unitframe"]["units"]["pet"]["debuffs"]["enable"] = true
	E.db["unitframe"]["units"]["pet"]["debuffs"]["growthY"] = "DOWN"
	E.db["unitframe"]["units"]["pet"]["disableMouseoverGlow"] = true
	E.db["unitframe"]["units"]["pet"]["fader"]["minAlpha"] = 0.75
	E.db["unitframe"]["units"]["pet"]["health"]["smoothbars"] = true
	E.db["unitframe"]["units"]["pet"]["height"] = 30
	E.db["unitframe"]["units"]["pet"]["infoPanel"]["height"] = 14
	E.db["unitframe"]["units"]["pet"]["infoPanel"]["transparent"] = true
	E.db["unitframe"]["units"]["pet"]["name"]["text_format"] = "[classcolor][name:medium]  [happiness:discord]"
	E.db["unitframe"]["units"]["pet"]["portrait"]["overlay"] = true
	E.db["unitframe"]["units"]["pet"]["power"]["height"] = 7
	E.db["unitframe"]["units"]["pet"]["power"]["position"] = "CENTER"
	E.db["unitframe"]["units"]["pet"]["power"]["xOffset"] = 0
	E.db["unitframe"]["units"]["pet"]["width"] = 125
	E.db["unitframe"]["units"]["pettarget"]["health"]["smoothbars"] = true
	E.db["unitframe"]["units"]["player"]["aurabar"]["enable"] = false  -- 클래스타이머(막대) → 아이콘 buff만 표시 (화면 가림 의견)
	E.db["unitframe"]["units"]["player"]["aurabar"]["anchorPoint"] = "ABOVE"
	E.db["unitframe"]["units"]["player"]["aurabar"]["attachTo"] = "BUFFS"
	E.db["unitframe"]["units"]["player"]["aurabar"]["friendlyAuraType"] = "HARMFUL"
	E.db["unitframe"]["units"]["player"]["aurabar"]["priority"] = "Blacklist,blockNoDuration,Personal,NonPersonal"
	E.db["unitframe"]["units"]["player"]["aurabar"]["maxBars"] = 40
	E.db["unitframe"]["units"]["player"]["aurabar"]["height"] = 13
	E.db["unitframe"]["units"]["player"]["aurabar"]["yOffset"] = 3
	E.db["unitframe"]["units"]["player"]["buffs"]["attachTo"] = "FRAME"
	E.db["unitframe"]["units"]["player"]["buffs"]["enable"] = true
	E.db["unitframe"]["units"]["player"]["buffs"]["filter"] = "HELPFUL"
	E.db["unitframe"]["units"]["player"]["buffs"]["height"] = 24
	E.db["unitframe"]["units"]["player"]["buffs"]["keepSizeRatio"] = true
	E.db["unitframe"]["units"]["player"]["buffs"]["numrows"] = 2
	E.db["unitframe"]["units"]["player"]["buffs"]["perrow"] = 10
	E.db["unitframe"]["units"]["player"]["buffs"]["priority"] = ""
	E.db["unitframe"]["units"]["player"]["buffs"]["spacing"] = 1
	E.db["unitframe"]["units"]["player"]["castbar"]["height"] = 28
	E.db["unitframe"]["units"]["player"]["castbar"]["icon"] = false
	E.db["unitframe"]["units"]["player"]["castbar"]["insideInfoPanel"] = false
	E.db["unitframe"]["units"]["player"]["castbar"]["overlayOnFrame"] = "InfoPanel"
	E.db["unitframe"]["units"]["player"]["castbar"]["strataAndLevel"]["useCustomStrata"] = true
	E.db["unitframe"]["units"]["player"]["castbar"]["strataAndLevel"]["frameStrata"] = "MEDIUM"
	E.db["unitframe"]["units"]["player"]["castbar"]["width"] = 255
	E.db["unitframe"]["units"]["player"]["classAdditional"]["enable"] = true
	E.db["unitframe"]["units"]["player"]["classAdditional"]["frameLevel"] = 2
	E.db["unitframe"]["units"]["player"]["classAdditional"]["height"] = 78
	E.db["unitframe"]["units"]["player"]["classAdditional"]["orientation"] = "VERTICAL"
	E.db["unitframe"]["units"]["player"]["classAdditional"]["width"] = 15
	E.db["unitframe"]["units"]["player"]["classbar"]["detachedWidth"] = 140
	E.db["unitframe"]["units"]["player"]["classbar"]["smoothbars"] = true
	if not E.db["unitframe"]["units"]["player"]["customTexts"] then E.db["unitframe"]["units"]["player"]["customTexts"] = {} end
	if not E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"] then E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"] = {} end
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["enable"] = true
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["font"] = "Expressway"
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["fontOutline"] = "NONE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["justifyH"] = "RIGHT"
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["size"] = 22
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["text_format"] = "[health:current-percent]"
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["xOffset"] = -8
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"]["yOffset"] = -1
	if not E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"] then E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"] = {} end
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["enable"] = true
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["font"] = "Expressway"
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["fontOutline"] = "NONE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["justifyH"] = "RIGHT"
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["size"] = 11
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["text_format"] = "[name]"
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["xOffset"] = -8
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"]["yOffset"] = 0
	if not E.db["unitframe"]["units"]["player"]["customTexts"]["lvl"] then E.db["unitframe"]["units"]["player"]["customTexts"]["lvl"] = {} end
	E.db["unitframe"]["units"]["player"]["customTexts"]["lvl"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["player"]["customTexts"]["lvl"]["enable"] = true
	E.db["unitframe"]["units"]["player"]["customTexts"]["lvl"]["font"] = "Expressway"
	E.db["unitframe"]["units"]["player"]["customTexts"]["lvl"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["lvl"]["justifyH"] = "LEFT"
	E.db["unitframe"]["units"]["player"]["customTexts"]["lvl"]["size"] = 11
	E.db["unitframe"]["units"]["player"]["customTexts"]["lvl"]["text_format"] = "[level] 레벨"
	E.db["unitframe"]["units"]["player"]["customTexts"]["lvl"]["xOffset"] = 8
	E.db["unitframe"]["units"]["player"]["customTexts"]["lvl"]["yOffset"] = 0
	E.db["unitframe"]["units"]["player"]["debuffs"]["attachTo"] = "BUFFS"
	E.db["unitframe"]["units"]["player"]["debuffs"]["perrow"] = 10
	E.db["unitframe"]["units"]["player"]["debuffs"]["numrows"] = 5
	E.db["unitframe"]["units"]["player"]["debuffs"]["priority"] = ""
	E.db["unitframe"]["units"]["player"]["disableMouseoverGlow"] = true
	E.db["unitframe"]["units"]["player"]["healPrediction"]["absorbStyle"] = "NORMAL"
	E.db["unitframe"]["units"]["player"]["health"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["player"]["health"]["smoothbars"] = true
	E.db["unitframe"]["units"]["player"]["health"]["text_format"] = ""
	E.db["unitframe"]["units"]["player"]["health"]["xOffset"] = 4
	E.db["unitframe"]["units"]["player"]["height"] = 55
	E.db["unitframe"]["units"]["player"]["infoPanel"]["enable"] = true
	E.db["unitframe"]["units"]["player"]["infoPanel"]["height"] = 22
	E.db["unitframe"]["units"]["player"]["infoPanel"]["transparent"] = true
	E.db["unitframe"]["units"]["player"]["portrait"]["camDistanceScale"] = 1
	E.db["unitframe"]["units"]["player"]["portrait"]["overlay"] = true
	E.db["unitframe"]["units"]["player"]["power"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["player"]["power"]["detachedWidth"] = 369
	E.db["unitframe"]["units"]["player"]["power"]["height"] = 12
	E.db["unitframe"]["units"]["player"]["power"]["hideonnpc"] = true
	E.db["unitframe"]["units"]["player"]["power"]["position"] = "CENTER"
	E.db["unitframe"]["units"]["player"]["power"]["strataAndLevel"]["frameLevel"] = 2
	E.db["unitframe"]["units"]["player"]["power"]["text_format"] = "[power:current-percent]"
	E.db["unitframe"]["units"]["player"]["power"]["xOffset"] = 0
	E.db["unitframe"]["units"]["player"]["smartAuraPosition"] = "DEBUFFS_ON_BUFFS"
	E.db["unitframe"]["units"]["player"]["width"] = 255
	E.db["unitframe"]["units"]["raid1"]["enable"] = false
	E.db["unitframe"]["units"]["raid1"]["fader"]["minAlpha"] = 0.55
	E.db["unitframe"]["units"]["raid1"]["fader"]["smooth"] = 0.55
	E.db["unitframe"]["units"]["raid1"]["growthDirection"] = "DOWN_RIGHT"
	E.db["unitframe"]["units"]["raid1"]["healPrediction"]["enable"] = true
	E.db["unitframe"]["units"]["raid1"]["height"] = 45
	E.db["unitframe"]["units"]["raid1"]["rdebuffs"]["enable"] = false
	E.db["unitframe"]["units"]["raid1"]["roleIcon"]["enable"] = false
	E.db["unitframe"]["units"]["raid1"]["width"] = 70
	E.db["unitframe"]["units"]["raid2"]["enable"] = false
	E.db["unitframe"]["units"]["raid2"]["growthDirection"] = "DOWN_RIGHT"
	E.db["unitframe"]["units"]["raid2"]["healPrediction"]["enable"] = true
	E.db["unitframe"]["units"]["raid2"]["height"] = 45
	E.db["unitframe"]["units"]["raid2"]["power"]["enable"] = true
	E.db["unitframe"]["units"]["raid2"]["width"] = 70
	E.db["unitframe"]["units"]["raid3"]["enable"] = false
	E.db["unitframe"]["units"]["raid3"]["growthDirection"] = "DOWN_RIGHT"
	E.db["unitframe"]["units"]["raid3"]["healPrediction"]["enable"] = true
	E.db["unitframe"]["units"]["raid3"]["height"] = 45
	E.db["unitframe"]["units"]["raid3"]["numGroups"] = 5
	E.db["unitframe"]["units"]["raid3"]["power"]["enable"] = true
	E.db["unitframe"]["units"]["raid3"]["width"] = 70
	E.db["unitframe"]["units"]["raidpet"]["numGroups"] = 5
	E.db["unitframe"]["units"]["raidpet"]["width"] = 70
	E.db["unitframe"]["units"]["tank"]["middleClickFocus"] = true
	E.db["unitframe"]["units"]["target"]["aurabar"]["enable"] = false  -- 클래스타이머(막대) → 아이콘 buff만 표시
	E.db["unitframe"]["units"]["target"]["aurabar"]["anchorPoint"] = "ABOVE"
	E.db["unitframe"]["units"]["target"]["aurabar"]["attachTo"] = "BUFFS"
	E.db["unitframe"]["units"]["target"]["aurabar"]["priority"] = "Blacklist,blockNoDuration,Personal,NonPersonal"
	E.db["unitframe"]["units"]["target"]["aurabar"]["maxBars"] = 40
	E.db["unitframe"]["units"]["target"]["aurabar"]["height"] = 13
	E.db["unitframe"]["units"]["target"]["aurabar"]["yOffset"] = 3
	-- 바 높이 줄인 만큼 지속시간 숫자도 살짝 축소 (기본 16 → 12)
	E.db["cooldown"] = E.db["cooldown"] or {}
	E.db["cooldown"]["aurabars"] = E.db["cooldown"]["aurabars"] or {}
	E.db["cooldown"]["aurabars"]["fontSize"] = 12
	E.db["unitframe"]["units"]["target"]["auras"]["enable"] = false
	E.db["unitframe"]["units"]["target"]["buffs"]["clickThrough"] = false
	E.db["unitframe"]["units"]["target"]["buffs"]["enable"] = true
	E.db["unitframe"]["units"]["target"]["buffs"]["filter"] = "HELPFUL"
	E.db["unitframe"]["units"]["target"]["buffs"]["height"] = 24
	E.db["unitframe"]["units"]["target"]["buffs"]["keepSizeRatio"] = true
	E.db["unitframe"]["units"]["target"]["buffs"]["numrows"] = 2
	E.db["unitframe"]["units"]["target"]["buffs"]["perrow"] = 10
	E.db["unitframe"]["units"]["target"]["buffs"]["priority"] = ""
	E.db["unitframe"]["units"]["target"]["buffs"]["spacing"] = 1
	E.db["unitframe"]["units"]["target"]["debuffs"]["clickThrough"] = false
	E.db["unitframe"]["units"]["target"]["debuffs"]["perrow"] = 10
	E.db["unitframe"]["units"]["target"]["debuffs"]["numrows"] = 5
	E.db["unitframe"]["units"]["target"]["debuffs"]["priority"] = ""
	E.db["unitframe"]["units"]["target"]["castbar"]["height"] = 40
	E.db["unitframe"]["units"]["target"]["castbar"]["icon"] = false
	E.db["unitframe"]["units"]["target"]["castbar"]["iconPosition"] = "RIGHT"
	E.db["unitframe"]["units"]["target"]["castbar"]["iconXOffset"] = 10
	E.db["unitframe"]["units"]["target"]["castbar"]["insideInfoPanel"] = false
	E.db["unitframe"]["units"]["target"]["castbar"]["overlayOnFrame"] = "InfoPanel"
	E.db["unitframe"]["units"]["target"]["castbar"]["strataAndLevel"]["useCustomStrata"] = true
	E.db["unitframe"]["units"]["target"]["castbar"]["strataAndLevel"]["frameStrata"] = "MEDIUM"
	E.db["unitframe"]["units"]["target"]["castbar"]["width"] = 255
	if not E.db["unitframe"]["units"]["target"]["customTexts"] then E.db["unitframe"]["units"]["target"]["customTexts"] = {} end
	if not E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"] then E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"] = {} end
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["enable"] = true
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["font"] = "Expressway"
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["fontOutline"] = "NONE"
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["justifyH"] = "LEFT"
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["size"] = 22
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["text_format"] = "[health:current-percent]"
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["xOffset"] = 8
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"]["yOffset"] = -1
	if not E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"] then E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"] = {} end
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["enable"] = true
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["font"] = "Expressway"
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["fontOutline"] = "NONE"
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["justifyH"] = "LEFT"
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["size"] = 11
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["text_format"] = "[name:medium] [difficultycolor][smartlevel] [shortclassification]"
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["xOffset"] = 8
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"]["yOffset"] = 0
	E.db["unitframe"]["units"]["target"]["disableMouseoverGlow"] = true
	E.db["unitframe"]["units"]["target"]["fader"]["minAlpha"] = 0.75
	E.db["unitframe"]["units"]["target"]["healPrediction"]["absorbStyle"] = "NORMAL"
	E.db["unitframe"]["units"]["target"]["health"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["target"]["health"]["smoothbars"] = true
	E.db["unitframe"]["units"]["target"]["health"]["text_format"] = ""
	E.db["unitframe"]["units"]["target"]["health"]["xOffset"] = 4
	E.db["unitframe"]["units"]["target"]["height"] = 55
	E.db["unitframe"]["units"]["target"]["infoPanel"]["enable"] = true
	E.db["unitframe"]["units"]["target"]["infoPanel"]["height"] = 22
	E.db["unitframe"]["units"]["target"]["infoPanel"]["transparent"] = true
	E.db["unitframe"]["units"]["target"]["name"]["position"] = "RIGHT"
	E.db["unitframe"]["units"]["target"]["name"]["text_format"] = ""
	E.db["unitframe"]["units"]["target"]["name"]["xOffset"] = 8
	E.db["unitframe"]["units"]["target"]["orientation"] = "LEFT"
	E.db["unitframe"]["units"]["target"]["portrait"]["camDistanceScale"] = 1
	E.db["unitframe"]["units"]["target"]["portrait"]["overlay"] = true
	E.db["unitframe"]["units"]["target"]["power"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["target"]["power"]["detachedWidth"] = 300
	E.db["unitframe"]["units"]["target"]["power"]["height"] = 12
	E.db["unitframe"]["units"]["target"]["power"]["position"] = "CENTER"
	E.db["unitframe"]["units"]["target"]["power"]["text_format"] = "[power:current-percent]"
	E.db["unitframe"]["units"]["target"]["power"]["xOffset"] = 0
	E.db["unitframe"]["units"]["target"]["smartAuraPosition"] = "DEBUFFS_ON_BUFFS"
	E.db["unitframe"]["units"]["target"]["width"] = 255
	E.db["unitframe"]["units"]["targettarget"]["debuffs"]["enable"] = false
	E.db["unitframe"]["units"]["targettarget"]["disableMouseoverGlow"] = true
	E.db["unitframe"]["units"]["targettarget"]["fader"]["minAlpha"] = 0.75
	E.db["unitframe"]["units"]["targettarget"]["health"]["smoothbars"] = true
	E.db["unitframe"]["units"]["targettarget"]["height"] = 30
	E.db["unitframe"]["units"]["targettarget"]["infoPanel"]["height"] = 12
	E.db["unitframe"]["units"]["targettarget"]["name"]["text_format"] = "[name:medium]"
	E.db["unitframe"]["units"]["targettarget"]["portrait"]["camDistanceScale"] = 1
	E.db["unitframe"]["units"]["targettarget"]["portrait"]["overlay"] = true
	E.db["unitframe"]["units"]["targettarget"]["power"]["height"] = 7
	E.db["unitframe"]["units"]["targettarget"]["raidicon"]["attachTo"] = "LEFT"
	E.db["unitframe"]["units"]["targettarget"]["raidicon"]["enable"] = false
	E.db["unitframe"]["units"]["targettarget"]["raidicon"]["xOffset"] = 2
	E.db["unitframe"]["units"]["targettarget"]["raidicon"]["yOffset"] = 0
	E.db["unitframe"]["units"]["targettarget"]["threatStyle"] = "GLOW"
	E.db["unitframe"]["units"]["targettarget"]["width"] = 125

	-- Private
	if E.private["benikui"] then
		E.private["benikui"]["expressway"] = true
	end
	if E.private["general"] then
		E.private["general"]["chatBubbleFont"] = "Expressway"
		E.private["general"]["chatBubbleFontSize"] = 10
		E.private["general"]["dmgfont"] = "데미지 글꼴"
		E.private["general"]["glossTex"] = "BuiFlat"
		E.private["general"]["normTex"] = "BuiFlat"
		E.private["general"]["raidUtility"] = false
		E.private["general"]["totemTracker"] = false
		E.private["general"]["worldMap"] = false
	end
	if E.private["skins"] then
		E.private["skins"]["parchmentRemoverEnable"] = true
	end
	if E.private["theme"] ~= nil then
		E.private["theme"] = "class"
	end

	-- Global
	if E.global and E.global["datatexts"] and E.global["datatexts"]["customPanels"] then
		local mp = E.global["datatexts"]["customPanels"]
		if not mp["BuiMiddleDTPanel"] then mp["BuiMiddleDTPanel"] = {} end
		mp["BuiMiddleDTPanel"]["benikuiStyle"]   = false
		mp["BuiMiddleDTPanel"]["height"]          = res.panels.middleDTHeight
		mp["BuiMiddleDTPanel"]["numPoints"]        = 5
		mp["BuiMiddleDTPanel"]["tooltipXOffset"]   = 3
		mp["BuiMiddleDTPanel"]["width"]            = res.panels.middleDTWidth
	end
	if E.global and E.global["general"] then
		if E.global["general"]["WorldMapCoordinates"] then
			E.global["general"]["WorldMapCoordinates"]["enable"] = false
		end
		E.global["general"]["fadeMapWhenMoving"] = false
		E.global["general"]["smallerWorldMap"]   = false
	end

	-- BenikUI 패널 갱신
	local BUI_ext = ElvUI_BenikUI and ElvUI_BenikUI[1]
	if BUI_ext then
		-- BuiMiddleDTPanel (중앙 데이터텍스트 패널)
		-- forceReset 없이 호출: 우리가 설정한 width=1228, numPoints=5를 보존
		-- forceReset=true 시 width=416, numPoints=3으로 덮어씌워짐
		local Layout = BUI_ext:GetModule("Layout", true)
		if Layout and Layout.CreateMiddlePanel then
			Layout:CreateMiddlePanel()
			-- 이 시점에 BuiMiddleDTPanel frame이 생성되고 DT:RegisterPanel 호출됨
			-- → dtPanels에 안전하게 박을 수 있음
			local mpDT = E.db["datatexts"]["panels"]
			mpDT["BuiMiddleDTPanel"] = mpDT["BuiMiddleDTPanel"] or {}
			if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
				mpDT["BuiMiddleDTPanel"][1] = "LDB_BigWigs"
				mpDT["BuiMiddleDTPanel"][2] = "LDB_IberisRaidAuction"
				mpDT["BuiMiddleDTPanel"][3] = "LDB_InvenRaidFrames3"
				mpDT["BuiMiddleDTPanel"][4] = "LDB_MRT"
				mpDT["BuiMiddleDTPanel"][5] = "LDB_Leatrix_Plus"
			else
				mpDT["BuiMiddleDTPanel"][1] = "LDB_MRT"
				mpDT["BuiMiddleDTPanel"][2] = "LDB_IberisRaidAuction"
				mpDT["BuiMiddleDTPanel"][3] = "LDB_AtlasLoot"
				mpDT["BuiMiddleDTPanel"][4] = "LDB_SavedClassicIcon"
				mpDT["BuiMiddleDTPanel"][5] = "LDB_FindParty"
			end
			mpDT["BuiMiddleDTPanel"]["battleground"] = false
			mpDT["BuiMiddleDTPanel"]["enable"]       = true
			if Layout.LoadDataTexts then Layout:LoadDataTexts() end
		end

		-- BenikUI_액션바 등 커스텀 패널 생성+설정
		-- UpdatePanels = CreatePanel + SetupPanels + Resize + UpdatePanelTitle
		local CP = BUI_ext:GetModule("CustomPanels", true)  -- silent=true: 없으면 nil 반환
		if CP and CP.UpdatePanels then CP:UpdatePanels() end
	end


	-- HUD EditMode 자동 전환은 신규 유저 환경에 [서약선] 레이아웃이 없어 무의미하고,
	-- Anniversary Classic의 Blizzard_EditMode와 ElvUI Minimap mover 사이에 알려진
	-- "Cannot anchor protected frames" 경고와 충돌 우려 → 코드 제거.

	-- CVar — 설치 시 1회 적용, config-cache.wtf에 저장되어 유지됨.
	-- 이후 유저가 직접 켜면 덮어쓰지 않음(설치 시점만).
	-- Sound_EnableErrorSpeech: "아직 사용할 수 없습니다" 류 음성 에러 끄기.
	pcall(SetCVar, "Sound_EnableErrorSpeech", 0)
	-- nameplateSelectedScale: 타겟(선택)한 이름표만 확대. ElvUI 기본은 TBC에서 1.0(확대 없음).
	pcall(SetCVar, "nameplateSelectedScale", 1.25)

	E:StaggeredUpdateAll(nil, true)

	-- ActionBars 모듈 갱신 — buttons/buttonsPerRow 변경 반영
	-- 참고: AB:Initialize() 호출은 모듈 충돌 가능 → 사용하지 않음.
	-- ReloadUI 후 SV에서 다시 로드되며 자연스럽게 적용됨.
	local AB = E:GetModule("ActionBars", true)
	if AB then
		for i = 1, 10 do
			local barName = "bar"..i
			if AB.PositionAndSizeBar then
				pcall(function() AB:PositionAndSizeBar(barName) end)
			end
		end
	end

	DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 이베리스 프로필 적용 완료!")
	PluginInstallStepComplete.message = IUI.Title .. L["Profile Set"]
	PluginInstallStepComplete:Show()
end

-- ============================================================
-- 외부 애드온
-- ============================================================
local addonNames = {}
local function SetupAddons()
	wipe(addonNames)
	local function tryLoad(name, fn)
		local ok, err = pcall(fn)
		if ok then tinsert(addonNames, name)
		else DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r "..name.." 실패: "..tostring(err)) end
	end
	tryLoad("BigWigs",          function() IUI:LoadBigWigsProfile() end)
	tryLoad("Details",          function() IUI:LoadDetailsProfile() end)
	tryLoad("MRT",              function() IUI:LoadMRTProfile() end)
	tryLoad("HidingBar",        function() IUI:LoadHidingBarProfile() end)
	tryLoad("InvenRaidFrames3", function() IUI:LoadInvenRaidFrames3Profile() end)
	tryLoad("Questie",          function() IUI:LoadQuestieProfile() end)
	tryLoad("ShamanPower",      function() IUI:LoadShamanPowerProfile() end)
	tryLoad("TacoTip",          function() IUI:LoadTacoTipProfile() end)
	tryLoad("Guidelime",        function() IUI:LoadGuidelimeProfile() end)
	tryLoad("Postal",           function() IUI:LoadPostalProfile() end)
	local msg = #addonNames > 0
		and format("|cfffff400저장:|r %s (재로드 후 반영)", table.concat(addonNames, ", "))
		or "|cffff8000실패|r — 채팅창 오류 확인"
	PluginInstallFrame.Desc2:SetText(msg)
	DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r "..msg)
	PluginInstallStepComplete.message = IUI.Title.." 애드온 저장됨"
	PluginInstallStepComplete:Show()
end

local function InstallComplete()
	E.private.install_complete = E.version
	IberisUIDB = IberisUIDB or {}
	IberisUIDB.install_complete = true
	ReloadUI()
end

-- ============================================================
-- 설치 마법사 — 4단계 구성
--   1: 이베리스 프로필 적용 (UI 스케일 + ElvUI/BenikUI 설정)
--   2: 외부 애드온 배치
--   3: 채팅창 설정
--   4: 완료/리로드
-- ============================================================
local function HideOption2()
	if PluginInstallFrame.Option2 then PluginInstallFrame.Option2:Hide() end
end
local function HideOption3()
	if PluginInstallFrame.Option3 then PluginInstallFrame.Option3:Hide() end
end

-- IberisUI 영문 로고 (FontString 기반) — 프레임 정중앙에 표시, 모든 단계 공통
local function CreateIberisLogo()
	if PluginInstallFrame.IberisUILogo then return PluginInstallFrame.IberisUILogo end
	local logo = PluginInstallFrame:CreateFontString(nil, "OVERLAY")
	logo:SetFont(E["media"].normFont, 36, "THICKOUTLINE")
	logo:SetText("|cffff9900Iberis|r|cffffffffUI|r")
	-- 부모 프레임 정중앙
	logo:ClearAllPoints()
	logo:SetPoint("CENTER", PluginInstallFrame, "CENTER", 0, 0)
	-- 그림자
	logo:SetShadowColor(0, 0, 0, 1)
	logo:SetShadowOffset(2, -2)
	PluginInstallFrame.IberisUILogo = logo
	return logo
end
local function ShowIberisLogo() CreateIberisLogo():Show() end

local function ProfileApplyHandler()
	return function()
		print("|cff00ff00IberisUI|r 프로필 적용 시작")
		local ok, err = pcall(ApplyIberisProfile)
		if ok then
			print("|cff00ff00IberisUI|r 적용 성공")
		else
			print("|cffff0000IberisUI 오류:|r "..tostring(err))
			DEFAULT_CHAT_FRAME:AddMessage("|cffff0000IberisUI 오류:|r "..tostring(err))
		end
	end
end

IUI.installTable = {
	["Name"] = "|cffff9900IberisUI|r",
	["Title"] = "|cffff9900IberisUI|r 프로필 설치",
	["Pages"] = {
		-- ------------------------------------------------------------
		-- Step 1: 이베리스 프로필 (해상도 선택 후 적용)
		-- ------------------------------------------------------------
		[1] = function()
			PluginInstallFrame:BuiStyle("Outside")
			PluginInstallTitleFrame:BuiStyle("Outside")
			-- 중앙 파란 튜토리얼 이미지 제거
			PluginInstallTutorialImage:SetTexture(nil)
			PluginInstallTutorialImage2:SetTexture(nil)
			PluginInstallTitleFrame.text:SetFont(E["media"].normFont, 16, "OUTLINE")

			HideOption2()
			HideOption3()
			PluginInstallFrame.SubTitle:SetFormattedText(L["Welcome to IberisUI version %s, for ElvUI %s."], IUI.Version, E.version)
			PluginInstallFrame.Desc1:SetText("|cffff9900이베리스(Iberis)|r 프로필 적용")
			PluginInstallFrame.Desc2:SetText("UI 스케일 0.7 기준 — 해상도(4K/QHD/FHD) 무관하게 동일 배치로 적용됩니다.")
			PluginInstallFrame.Desc3:SetText("|cff07D400※|r 32인치 모니터 기준 실측값")

			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", ProfileApplyHandler())
			PluginInstallFrame.Option1:SetText("UI 스케일 적용")

			ShowIberisLogo()
		end,
		-- ------------------------------------------------------------
		-- Step 2: 외부 애드온 배치
		-- ------------------------------------------------------------
		[2] = function()
			HideOption2(); HideOption3(); ShowIberisLogo()
			PluginInstallFrame.SubTitle:SetText("외부 애드온 배치")
			PluginInstallFrame.Desc1:SetText("BigWigs / Details / MRT / HidingBar / InvenRaidFrames3 / Questie / ShamanPower / TacoTip 위치·프로필 적용")
			PluginInstallFrame.Desc2:SetText("재로드 후 위치가 반영됩니다.")
			PluginInstallFrame.Desc3:SetText("중요도: |cffD3CF00보통|r")

			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function()
				local ok, err = pcall(SetupAddons)
				if not ok then DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 오류: "..tostring(err)) end
			end)
			PluginInstallFrame.Option1:SetText("애드온 배치 적용")
		end,
		-- ------------------------------------------------------------
		-- Step 3: 채팅창 설정 (2개 / 3개 선택)
		--   2개: 좌(일반 + 커뮤니티 탭) + 우(전리품)
		--   3개: 좌(일반) + 보조(커뮤니티 단독) + 우(전리품). 보조 = LeftChatPanel 위 3px.
		-- ------------------------------------------------------------
		[3] = function()
			HideOption3(); ShowIberisLogo()
			PluginInstallFrame.SubTitle:SetText("채팅창 설정")
			PluginInstallFrame.Desc1:SetText("ElvUI 채팅창을 좌·우 채팅 패널에 임베드합니다.")
			PluginInstallFrame.Desc2:SetText("3개 선택 시 좌측 패널 위 3px 간격에 보조 패널 추가 — 커뮤니티 탭이 좌측에서 빠져 보조 패널에 단독 도킹됩니다.")
			PluginInstallFrame.Desc3:SetText("중요도: |cffD3CF00보통|r")

			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function()
				local ok, err = pcall(function() IUI:SetupChatWindows(2) end)
				if not ok then DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 채팅 오류: "..tostring(err)) end
			end)
			PluginInstallFrame.Option1:SetText("채팅창 2개 설치")

			if PluginInstallFrame.Option2 then
				PluginInstallFrame.Option2:Show()
				PluginInstallFrame.Option2:SetScript("OnClick", function()
					local ok, err = pcall(function() IUI:SetupChatWindows(3) end)
					if not ok then DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 채팅 오류: "..tostring(err)) end
				end)
				PluginInstallFrame.Option2:SetText("채팅창 3개 설치")
			end
		end,
		-- ------------------------------------------------------------
		-- Step 4: 완료/리로드
		-- ------------------------------------------------------------
		[4] = function()
			HideOption2(); HideOption3(); ShowIberisLogo()
			PluginInstallFrame.SubTitle:SetText(L["Installation Complete"])
			PluginInstallFrame.Desc1:SetText("IberisUI 설치 완료!")
			PluginInstallFrame.Desc2:SetText("'완료' 버튼을 누르면 UI가 재로드됩니다.")
			PluginInstallFrame.Desc3:SetText("")

			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() InstallComplete() end)
			PluginInstallFrame.Option1:SetText(L["Finished"])
			PluginInstallStepComplete.message = IUI.Title..L["Installed"]
			PluginInstallStepComplete:Show()
		end,
	},
	["StepTitles"] = {
		[1] = "프로필",
		[2] = "외부 애드온",
		[3] = "채팅창",
		[4] = L["Installation Complete"],
	},
	StepTitlesColor = {1,1,1}, StepTitlesColorSelected = {1,0.6,0},
	StepTitleWidth = 200, StepTitleButtonWidth = 200, StepTitleTextJustification = "CENTER",
}
