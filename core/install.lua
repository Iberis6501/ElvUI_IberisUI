local IUI, E, L = unpack((select(2, ...)))
local ReloadUI = ReloadUI
local tinsert, wipe = table.insert, table.wipe or wipe

-- 서약선 프로필의 전체 설정을 적용합니다.
local function ApplyIberisProfile()

	-- ============================================================
	-- General
	-- ============================================================
	E.db["general"]["font"] = "Expressway"
	E.db["general"]["fontSize"] = 11
	E.db["general"]["autoAcceptInvite"] = true
	E.db["general"]["autoRepair"] = "GUILD"
	E.db["general"]["decimalLength"] = 2
	E.db["general"]["bottomPanel"] = false
	E.db["general"]["topPanel"] = false
	E.db["general"]["stickyFrames"] = true
	E.db["general"]["objectiveFrameHeight"] = 750
	E.db["general"]["objectiveFrameAutoHide"] = false
	E.db["general"]["smoothingAmount"] = 0.5
	E.db["general"]["minimap"]["size"] = 150
	E.db["general"]["minimap"]["locationText"] = "HIDE"
	E.db["general"]["backdropcolor"]["r"] = 0.025
	E.db["general"]["backdropcolor"]["g"] = 0.025
	E.db["general"]["backdropcolor"]["b"] = 0.025
	E.db["general"]["backdropfadecolor"]["r"] = 0.054
	E.db["general"]["backdropfadecolor"]["g"] = 0.054
	E.db["general"]["backdropfadecolor"]["b"] = 0.054
	E.db["general"]["backdropfadecolor"]["a"] = 0.75
	E.db["general"]["bordercolor"]["r"] = 0
	E.db["general"]["bordercolor"]["g"] = 0
	E.db["general"]["bordercolor"]["b"] = 0
	E.db["general"]["valuecolor"]["r"] = 1
	E.db["general"]["valuecolor"]["g"] = 0.5
	E.db["general"]["valuecolor"]["b"] = 0
	E.db["general"]["valuecolor"]["a"] = 1
	E.db["general"]["interruptAnnounce"] = "SAY"
	E.db["general"]["autoTrackReputation"] = true
	E.db["general"]["bonusObjectivePosition"] = "AUTO"
	E.db["hideTutorial"] = true

	-- ============================================================
	-- Private settings (normTex, fonts, skins)
	-- ============================================================
	E.private["general"]["normTex"] = "BuiFlat"
	E.private["general"]["glossTex"] = "BuiFlat"
	E.private["general"]["chatBubbles"] = "backdrop"
	E.private["general"]["chatBubbleFont"] = "Expressway"
	E.private["general"]["chatBubbleFontSize"] = 10
	E.private["general"]["dmgfont"] = "Expressway"
	E.private["general"]["namefont"] = "Expressway"
	E.private["skins"]["blizzard"]["alertframes"] = true
	E.private["skins"]["blizzard"]["questChoice"] = true
	E.private["skins"]["parchmentRemoverEnable"] = true
	E.private["general"]["raidUtility"] = false
	E.private["general"]["totemTracker"] = false
	E.private["general"]["worldMap"] = false

	-- ============================================================
	-- Bags
	-- ============================================================
	E.db["bags"]["bagSize"] = 32
	E.db["bags"]["bankSize"] = 32
	E.db["bags"]["bagWidth"] = 348
	E.db["bags"]["bankWidth"] = 348
	E.db["bags"]["transparent"] = true
	E.db["bags"]["scrapIcon"] = true
	E.db["bags"]["junkIcon"] = true
	E.db["bags"]["junkDesaturate"] = true
	E.db["bags"]["showBindType"] = true
	E.db["bags"]["reverseSlots"] = true
	E.db["bags"]["clearSearchOnClose"] = true
	E.db["bags"]["countFont"] = "Expressway"
	E.db["bags"]["countFontOutline"] = "OUTLINE"
	E.db["bags"]["itemLevelFont"] = "Expressway"
	E.db["bags"]["itemLevelFontOutline"] = "OUTLINE"
	E.db["bags"]["itemInfoFontOutline"] = "NONE"
	E.db["bags"]["vendorGrays"]["enable"] = true
	E.db["bags"]["vendorGrays"]["details"] = true
	E.db["bags"]["autoToggle"]["guildBank"] = true
	E.db["bags"]["sortInverted"] = false
	E.db["bags"]["itemLevelCustomColorEnable"] = false

	-- ============================================================
	-- Chat
	-- ============================================================
	E.db["chat"]["font"] = "Expressway"
	E.db["chat"]["tabFont"] = "Expressway"
	E.db["chat"]["tabFontSize"] = 11
	E.db["chat"]["tabFontOutline"] = "OUTLINE"
	E.db["chat"]["panelWidth"] = 348
	E.db["chat"]["panelHeight"] = 166
	E.db["chat"]["panelBackdrop"] = "SHOWBOTH"
	E.db["chat"]["timeStampFormat"] = "%H:%M "
	E.db["chat"]["keywordSound"] = "Acoustic Guitar"
	E.db["chat"]["keywords"] = "%MYNAME%,이베,약선"
	E.db["chat"]["panelSnapLeftID"] = 1
	E.db["chat"]["panelSnapRightID"] = 4
	E.db["chat"]["panelColor"]["r"] = 0.054
	E.db["chat"]["panelColor"]["g"] = 0.054
	E.db["chat"]["panelColor"]["b"] = 0.054
	E.db["chat"]["panelColor"]["a"] = 0.75
	E.db["chat"]["tabSelectorColor"]["r"] = 0
	E.db["chat"]["tabSelectorColor"]["g"] = 0.44
	E.db["chat"]["tabSelectorColor"]["b"] = 0.87
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["enable"] = false
	E.db["datatexts"]["panels"]["RightChatDataPanel"]["enable"] = false
	E.db["datatexts"]["rightChatPanel"] = false

	-- ============================================================
	-- Databars
	-- ============================================================
	E.db["databars"]["statusbar"] = "BuiFlat"
	E.db["databars"]["experience"]["enable"] = true
	E.db["databars"]["experience"]["font"] = "Expressway"
	E.db["databars"]["experience"]["fontSize"] = 10
	E.db["databars"]["experience"]["textFormat"] = "CURPERC"
	E.db["databars"]["experience"]["textYoffset"] = 10
	E.db["databars"]["experience"]["orientation"] = "VERTICAL"
	E.db["databars"]["experience"]["width"] = 9
	E.db["databars"]["experience"]["height"] = 166
	E.db["databars"]["experience"]["showLevel"] = true
	E.db["databars"]["experience"]["hideAtMaxLevel"] = false
	E.db["databars"]["reputation"]["enable"] = true
	E.db["databars"]["reputation"]["fontSize"] = 9
	E.db["databars"]["reputation"]["width"] = 9
	E.db["databars"]["reputation"]["height"] = 166
	E.db["databars"]["reputation"]["orientation"] = "VERTICAL"
	E.db["databars"]["reputation"]["textFormat"] = "NONE"
	E.db["databars"]["petExperience"]["enable"] = false
	E.db["databars"]["threat"]["enable"] = false

	-- ============================================================
	-- Datatexts
	-- ============================================================
	E.db["datatexts"]["font"] = "Expressway"
	E.db["datatexts"]["fontSize"] = 11
	E.db["datatexts"]["fontOutline"] = "OUTLINE"

	if E.db["datatexts"]["panels"]["BuiMiddleDTPanel"] then
		E.db["datatexts"]["panels"]["BuiMiddleDTPanel"][1] = "LDB_ItemRack"
		E.db["datatexts"]["panels"]["BuiMiddleDTPanel"][2] = "LDB_iWillRemember_MinimapButton"
		E.db["datatexts"]["panels"]["BuiMiddleDTPanel"][3] = "LDB_AtlasLoot"
		E.db["datatexts"]["panels"]["BuiMiddleDTPanel"][4] = "LDB_SavedClassicIcon"
		E.db["datatexts"]["panels"]["BuiMiddleDTPanel"][5] = "LDB_FindParty"
		E.db["datatexts"]["panels"]["BuiMiddleDTPanel"]["enable"] = true
		E.db["datatexts"]["panels"]["BuiMiddleDTPanel"]["battleground"] = false
		if E.DataTexts then
			E.DataTexts:UpdatePanelInfo("BuiMiddleDTPanel")
		end
	end

	if E.db["datatexts"]["panels"]["BuiLeftChatDTPanel"] then
		E.db["datatexts"]["panels"]["BuiLeftChatDTPanel"][1] = "BuiMail"
		E.db["datatexts"]["panels"]["BuiLeftChatDTPanel"][2] = "System"
		E.db["datatexts"]["panels"]["BuiLeftChatDTPanel"][3] = "ElvUI"
		if E.DataTexts then
			E.DataTexts:UpdatePanelInfo("BuiLeftChatDTPanel")
		end
	end

	if E.db["datatexts"]["panels"]["BuiRightChatDTPanel"] then
		E.db["datatexts"]["panels"]["BuiRightChatDTPanel"][1] = "Durability"
		if E.DataTexts then
			E.DataTexts:UpdatePanelInfo("BuiRightChatDTPanel")
		end
	end

	if E.db["datatexts"]["panels"]["LocPlusLeftDT"] then
		E.db["datatexts"]["panels"]["LocPlusLeftDT"][1] = "MovementSpeed"
		if E.DataTexts then
			E.DataTexts:UpdatePanelInfo("LocPlusLeftDT")
		end
	end

	-- ============================================================
	-- Tooltip
	-- ============================================================
	E.db["tooltip"]["font"] = "Expressway"
	E.db["tooltip"]["fontSize"] = 10
	E.db["tooltip"]["fontOutline"] = "NONE"
	E.db["tooltip"]["headerFontSize"] = 11
	E.db["tooltip"]["textFontSize"] = 11
	E.db["tooltip"]["smallTextFontSize"] = 11
	E.db["tooltip"]["itemQuality"] = true
	E.db["tooltip"]["alwaysShowRealm"] = true
	E.db["tooltip"]["cursorAnchor"] = true
	E.db["tooltip"]["cursorAnchorType"] = "ANCHOR_CURSOR_RIGHT"
	E.db["tooltip"]["cursorAnchorX"] = 50
	E.db["tooltip"]["cursorAnchorY"] = -25
	E.db["tooltip"]["healthBar"]["font"] = "Expressway"
	E.db["tooltip"]["healthBar"]["fontSize"] = 9
	E.db["tooltip"]["healthBar"]["fontOutline"] = "OUTLINE"
	E.db["tooltip"]["healthBar"]["height"] = 6

	-- ============================================================
	-- Actionbars
	-- ============================================================
	E.db["actionbar"]["lockActionBars"] = true
	E.db["actionbar"]["transparent"] = true
	E.db["actionbar"]["font"] = "Expressway"
	E.db["actionbar"]["fontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["desaturateOnCooldown"] = true
	E.db["actionbar"]["rightClickSelfCast"] = true

	-- Bar 3 설정 (메인 스킬바 - 36사이즈)
	E.db["actionbar"]["bar3"]["buttons"] = 12
	E.db["actionbar"]["bar3"]["buttonsPerRow"] = 12
	E.db["actionbar"]["bar3"]["buttonSize"] = 36
	E.db["actionbar"]["bar3"]["buttonSpacing"] = 3
	E.db["actionbar"]["bar3"]["backdropSpacing"] = 6
	E.db["actionbar"]["bar3"]["macrotext"] = true
	E.db["actionbar"]["bar3"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar3"]["macroTextYOffset"] = 0
	E.db["actionbar"]["bar3"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar3"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar3"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar3"]["visibility"] = "[petbattle] hide; show"

	-- Pet bar
	E.db["actionbar"]["barPet"]["buttonsPerRow"] = 10
	E.db["actionbar"]["barPet"]["buttonSize"] = 20
	E.db["actionbar"]["barPet"]["buttonSpacing"] = 4
	E.db["actionbar"]["barPet"]["backdropSpacing"] = 6
	E.db["actionbar"]["barPet"]["backdrop"] = false
	E.db["actionbar"]["barPet"]["point"] = "TOPLEFT"
	E.db["actionbar"]["barPet"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["barPet"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["barPet"]["countFontOutline"] = "THICKOUTLINE"

	-- ============================================================
	-- Nameplates
	-- ============================================================
	E.db["nameplates"]["font"] = "Bui Visitor1"
	E.db["nameplates"]["fontSize"] = 10
	E.db["nameplates"]["fontOutline"] = "MONOCHROMEOUTLINE"
	E.db["nameplates"]["statusbar"] = "BuiFlat"

	-- FRIENDLY_NPC
	local npcFonts = { "debuffs", "buffs", "castbar", "health", "buffs", "name", "level", "power" }
	for _, section in ipairs({ "FRIENDLY_NPC", "FRIENDLY_PLAYER" }) do
		if E.db["nameplates"]["units"][section] then
			if E.db["nameplates"]["units"][section]["debuffs"] then
				E.db["nameplates"]["units"][section]["debuffs"]["font"] = "Expressway"
				E.db["nameplates"]["units"][section]["debuffs"]["countFont"] = "Expressway"
			end
			if E.db["nameplates"]["units"][section]["buffs"] then
				E.db["nameplates"]["units"][section]["buffs"]["font"] = "Expressway"
				E.db["nameplates"]["units"][section]["buffs"]["countFont"] = "Expressway"
			end
			if E.db["nameplates"]["units"][section]["castbar"] then
				E.db["nameplates"]["units"][section]["castbar"]["font"] = "Expressway"
			end
			if E.db["nameplates"]["units"][section]["name"] then
				E.db["nameplates"]["units"][section]["name"]["font"] = "Expressway"
			end
			if E.db["nameplates"]["units"][section]["level"] then
				E.db["nameplates"]["units"][section]["level"]["font"] = "Expressway"
			end
			if E.db["nameplates"]["units"][section]["health"] and E.db["nameplates"]["units"][section]["health"]["text"] then
				E.db["nameplates"]["units"][section]["health"]["text"]["font"] = "Expressway"
			end
			if E.db["nameplates"]["units"][section]["power"] and E.db["nameplates"]["units"][section]["power"]["text"] then
				E.db["nameplates"]["units"][section]["power"]["text"]["font"] = "Expressway"
			end
		end
	end

	-- ENEMY_PLAYER portrait
	if E.db["nameplates"]["units"]["ENEMY_PLAYER"] then
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["portrait"]["enable"] = true
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["portrait"]["position"] = "LEFT"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["portrait"]["classicon"] = false
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["numRows"] = 3
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["numAuras"] = 7
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["size"] = 22
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["attachTo"] = "BUFFS"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["anchorPoint"] = "TOPLEFT"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["growthX"] = "RIGHT"
	end

	-- ============================================================
	-- Unitframes - General
	-- ============================================================
	E.db["unitframe"]["font"] = "Expressway"
	E.db["unitframe"]["fontSize"] = 11
	E.db["unitframe"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["smoothbars"] = true
	E.db["unitframe"]["statusbar"] = "BuiFlat"
	E.db["unitframe"]["targetSound"] = true
	E.db["unitframe"]["colors"]["healthclass"] = true
	E.db["unitframe"]["colors"]["castClassColor"] = true
	E.db["unitframe"]["colors"]["castReactionColor"] = true
	E.db["unitframe"]["colors"]["colorhealthbyvalue"] = false
	E.db["unitframe"]["colors"]["transparentHealth"] = true
	E.db["unitframe"]["colors"]["transparentPower"] = false
	E.db["unitframe"]["colors"]["transparentAurabars"] = true
	E.db["unitframe"]["colors"]["transparentCastbar"] = false
	E.db["unitframe"]["colors"]["useDeadBackdrop"] = true
	E.db["unitframe"]["colors"]["health"]["r"] = 0.1
	E.db["unitframe"]["colors"]["health"]["g"] = 0.1
	E.db["unitframe"]["colors"]["health"]["b"] = 0.1
	E.db["unitframe"]["colors"]["castColor"]["r"] = 0.1
	E.db["unitframe"]["colors"]["castColor"]["g"] = 0.1
	E.db["unitframe"]["colors"]["castColor"]["b"] = 0.1
	E.db["unitframe"]["colors"]["auraBarBuff"]["r"] = 0.1
	E.db["unitframe"]["colors"]["auraBarBuff"]["g"] = 0.1
	E.db["unitframe"]["colors"]["auraBarBuff"]["b"] = 0.1
	E.db["unitframe"]["colors"]["health_backdrop_dead"]["r"] = 0.14901960784314
	E.db["unitframe"]["colors"]["health_backdrop_dead"]["g"] = 0.003921568627451
	E.db["unitframe"]["colors"]["health_backdrop_dead"]["b"] = 0.003921568627451
	E.db["unitframe"]["colors"]["power"]["MANA"]["r"] = 0.3098039215686275
	E.db["unitframe"]["colors"]["power"]["MANA"]["g"] = 0.4509803921568628
	E.db["unitframe"]["colors"]["power"]["MANA"]["b"] = 0.6313725490196078

	-- ============================================================
	-- Unitframes - Player
	-- ============================================================
	E.db["unitframe"]["units"]["player"]["width"] = 255
	E.db["unitframe"]["units"]["player"]["height"] = 55
	E.db["unitframe"]["units"]["player"]["disableMouseoverGlow"] = true
	E.db["unitframe"]["units"]["player"]["threatStyle"] = "GLOW"
	E.db["unitframe"]["units"]["player"]["smartAuraPosition"] = "DEBUFFS_ON_BUFFS"

	E.db["unitframe"]["units"]["player"]["portrait"]["enable"] = true
	E.db["unitframe"]["units"]["player"]["portrait"]["overlay"] = true
	E.db["unitframe"]["units"]["player"]["portrait"]["camDistanceScale"] = 1

	E.db["unitframe"]["units"]["player"]["infoPanel"]["enable"] = true
	E.db["unitframe"]["units"]["player"]["infoPanel"]["height"] = 22
	E.db["unitframe"]["units"]["player"]["infoPanel"]["transparent"] = true

	E.db["unitframe"]["units"]["player"]["health"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["player"]["health"]["smoothbars"] = true
	E.db["unitframe"]["units"]["player"]["health"]["xOffset"] = 4
	E.db["unitframe"]["units"]["player"]["health"]["text_format"] = ""

	E.db["unitframe"]["units"]["player"]["power"]["text_format"] = "[power:current-percent]"
	E.db["unitframe"]["units"]["player"]["power"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["player"]["power"]["position"] = "CENTER"
	E.db["unitframe"]["units"]["player"]["power"]["height"] = 12
	E.db["unitframe"]["units"]["player"]["power"]["detachedWidth"] = 369
	E.db["unitframe"]["units"]["player"]["power"]["hideonnpc"] = true

	E.db["unitframe"]["units"]["player"]["castbar"]["icon"] = false
	E.db["unitframe"]["units"]["player"]["castbar"]["overlayOnFrame"] = "InfoPanel"
	E.db["unitframe"]["units"]["player"]["castbar"]["width"] = 255
	E.db["unitframe"]["units"]["player"]["castbar"]["height"] = 28
	E.db["unitframe"]["units"]["player"]["castbar"]["insideInfoPanel"] = false

	E.db["unitframe"]["units"]["player"]["classbar"]["detachedWidth"] = 140
	E.db["unitframe"]["units"]["player"]["classbar"]["smoothbars"] = true

	E.db["unitframe"]["units"]["player"]["buffs"]["attachTo"] = "FRAME"
	E.db["unitframe"]["units"]["player"]["buffs"]["noDuration"] = false
	E.db["unitframe"]["units"]["player"]["buffs"]["fontSize"] = 10

	E.db["unitframe"]["units"]["player"]["debuffs"]["attachTo"] = "BUFFS"
	E.db["unitframe"]["units"]["player"]["debuffs"]["fontSize"] = 10

	E.db["unitframe"]["units"]["player"]["aurabar"]["enable"] = false

	-- Player custom texts
	if not E.db.unitframe.units.player.customTexts then
		E.db.unitframe.units.player.customTexts = {}
	end
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerHealth"] = {
		["attachTextTo"] = "Health",
		["xOffset"] = -8,
		["yOffset"] = -1,
		["text_format"] = "[health:current-percent]",
		["font"] = "Expressway",
		["justifyH"] = "RIGHT",
		["fontOutline"] = "NONE",
		["enable"] = true,
		["size"] = 22,
	}
	E.db["unitframe"]["units"]["player"]["customTexts"]["BenikuiPlayerName"] = {
		["attachTextTo"] = "InfoPanel",
		["xOffset"] = -8,
		["yOffset"] = 0,
		["text_format"] = "[name]",
		["font"] = "Expressway",
		["justifyH"] = "RIGHT",
		["fontOutline"] = "NONE",
		["enable"] = true,
		["size"] = 11,
	}
	E.db["unitframe"]["units"]["player"]["customTexts"]["lvl"] = {
		["attachTextTo"] = "InfoPanel",
		["xOffset"] = 8,
		["yOffset"] = 0,
		["text_format"] = "[level] 레벨",
		["font"] = "Expressway",
		["justifyH"] = "LEFT",
		["fontOutline"] = "OUTLINE",
		["enable"] = true,
		["size"] = 11,
	}

	-- ============================================================
	-- Unitframes - Target
	-- ============================================================
	E.db["unitframe"]["units"]["target"]["width"] = 255
	E.db["unitframe"]["units"]["target"]["height"] = 55
	E.db["unitframe"]["units"]["target"]["orientation"] = "LEFT"
	E.db["unitframe"]["units"]["target"]["disableMouseoverGlow"] = true
	E.db["unitframe"]["units"]["target"]["smartAuraDisplay"] = "DISABLED"
	E.db["unitframe"]["units"]["target"]["smartAuraPosition"] = "DEBUFFS_ON_BUFFS"

	E.db["unitframe"]["units"]["target"]["portrait"]["enable"] = true
	E.db["unitframe"]["units"]["target"]["portrait"]["overlay"] = true
	E.db["unitframe"]["units"]["target"]["portrait"]["camDistanceScale"] = 1

	E.db["unitframe"]["units"]["target"]["infoPanel"]["enable"] = true
	E.db["unitframe"]["units"]["target"]["infoPanel"]["height"] = 22
	E.db["unitframe"]["units"]["target"]["infoPanel"]["transparent"] = true

	E.db["unitframe"]["units"]["target"]["health"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["target"]["health"]["smoothbars"] = true
	E.db["unitframe"]["units"]["target"]["health"]["xOffset"] = 4
	E.db["unitframe"]["units"]["target"]["health"]["text_format"] = ""

	E.db["unitframe"]["units"]["target"]["name"]["text_format"] = ""
	E.db["unitframe"]["units"]["target"]["name"]["position"] = "RIGHT"
	E.db["unitframe"]["units"]["target"]["name"]["xOffset"] = 8

	E.db["unitframe"]["units"]["target"]["power"]["text_format"] = "[power:current-percent]"
	E.db["unitframe"]["units"]["target"]["power"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["target"]["power"]["position"] = "CENTER"
	E.db["unitframe"]["units"]["target"]["power"]["height"] = 12
	E.db["unitframe"]["units"]["target"]["power"]["detachedWidth"] = 300
	E.db["unitframe"]["units"]["target"]["power"]["threatStyle"] = "GLOW"

	E.db["unitframe"]["units"]["target"]["castbar"]["icon"] = false
	E.db["unitframe"]["units"]["target"]["castbar"]["overlayOnFrame"] = "InfoPanel"
	E.db["unitframe"]["units"]["target"]["castbar"]["width"] = 255
	E.db["unitframe"]["units"]["target"]["castbar"]["height"] = 40
	E.db["unitframe"]["units"]["target"]["castbar"]["insideInfoPanel"] = false
	E.db["unitframe"]["units"]["target"]["castbar"]["iconPosition"] = "RIGHT"
	E.db["unitframe"]["units"]["target"]["castbar"]["iconXOffset"] = 10

	E.db["unitframe"]["units"]["target"]["buffs"]["fontSize"] = 10
	E.db["unitframe"]["units"]["target"]["debuffs"]["fontSize"] = 10
	E.db["unitframe"]["units"]["target"]["aurabar"]["enable"] = false

	if not E.db.unitframe.units.target.customTexts then
		E.db.unitframe.units.target.customTexts = {}
	end
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetHealth"] = {
		["attachTextTo"] = "Health",
		["xOffset"] = 8,
		["yOffset"] = -1,
		["text_format"] = "[health:current-percent]",
		["font"] = "Expressway",
		["justifyH"] = "LEFT",
		["fontOutline"] = "NONE",
		["enable"] = true,
		["size"] = 22,
	}
	E.db["unitframe"]["units"]["target"]["customTexts"]["BenikuiTargetName"] = {
		["attachTextTo"] = "InfoPanel",
		["xOffset"] = 8,
		["yOffset"] = 0,
		["text_format"] = "[name:medium] [difficultycolor][smartlevel] [shortclassification]",
		["font"] = "Expressway",
		["justifyH"] = "LEFT",
		["fontOutline"] = "NONE",
		["enable"] = true,
		["size"] = 11,
	}

	-- ============================================================
	-- Unitframes - Focus / TargetTarget / Pet
	-- ============================================================
	E.db["unitframe"]["units"]["focus"]["width"] = 125
	E.db["unitframe"]["units"]["focus"]["height"] = 30
	E.db["unitframe"]["units"]["focus"]["disableMouseoverGlow"] = true
	E.db["unitframe"]["units"]["focus"]["disableTargetGlow"] = true
	E.db["unitframe"]["units"]["focus"]["health"]["smoothbars"] = true
	E.db["unitframe"]["units"]["focus"]["power"]["position"] = "CENTER"
	E.db["unitframe"]["units"]["focus"]["power"]["height"] = 7
	E.db["unitframe"]["units"]["focus"]["infoPanel"]["height"] = 12
	E.db["unitframe"]["units"]["focus"]["infoPanel"]["transparent"] = true
	E.db["unitframe"]["units"]["focus"]["castbar"]["width"] = 125
	E.db["unitframe"]["units"]["focus"]["castbar"]["height"] = 14
	E.db["unitframe"]["units"]["focus"]["castbar"]["overlayOnFrame"] = "Health"
	E.db["unitframe"]["units"]["focus"]["castbar"]["iconSize"] = 26
	E.db["unitframe"]["units"]["focus"]["portrait"]["camDistanceScale"] = 1
	E.db["unitframe"]["units"]["focus"]["fader"]["minAlpha"] = 0.75

	E.db["unitframe"]["units"]["targettarget"]["width"] = 125
	E.db["unitframe"]["units"]["targettarget"]["height"] = 30
	E.db["unitframe"]["units"]["targettarget"]["disableMouseoverGlow"] = true
	E.db["unitframe"]["units"]["targettarget"]["threatStyle"] = "GLOW"
	E.db["unitframe"]["units"]["targettarget"]["health"]["smoothbars"] = true
	E.db["unitframe"]["units"]["targettarget"]["power"]["height"] = 7
	E.db["unitframe"]["units"]["targettarget"]["infoPanel"]["height"] = 12
	E.db["unitframe"]["units"]["targettarget"]["portrait"]["overlay"] = true
	E.db["unitframe"]["units"]["targettarget"]["portrait"]["camDistanceScale"] = 1
	E.db["unitframe"]["units"]["targettarget"]["fader"]["minAlpha"] = 0.75
	E.db["unitframe"]["units"]["targettarget"]["name"]["text_format"] = "[name:medium]"
	E.db["unitframe"]["units"]["targettarget"]["debuffs"]["enable"] = false

	E.db["unitframe"]["units"]["focustarget"]["enable"] = true
	E.db["unitframe"]["units"]["focustarget"]["width"] = 125
	E.db["unitframe"]["units"]["focustarget"]["height"] = 30
	E.db["unitframe"]["units"]["focustarget"]["disableMouseoverGlow"] = true
	E.db["unitframe"]["units"]["focustarget"]["disableTargetGlow"] = true
	E.db["unitframe"]["units"]["focustarget"]["health"]["smoothbars"] = true
	E.db["unitframe"]["units"]["focustarget"]["power"]["position"] = "CENTER"
	E.db["unitframe"]["units"]["focustarget"]["power"]["height"] = 7
	E.db["unitframe"]["units"]["focustarget"]["castbar"]["width"] = 125
	E.db["unitframe"]["units"]["focustarget"]["castbar"]["overlayOnFrame"] = "Health"
	E.db["unitframe"]["units"]["focustarget"]["fader"]["minAlpha"] = 0.75

	E.db["unitframe"]["units"]["pet"]["width"] = 125
	E.db["unitframe"]["units"]["pet"]["height"] = 30
	E.db["unitframe"]["units"]["pet"]["disableMouseoverGlow"] = true
	E.db["unitframe"]["units"]["pet"]["health"]["smoothbars"] = true
	E.db["unitframe"]["units"]["pet"]["portrait"]["overlay"] = true
	E.db["unitframe"]["units"]["pet"]["power"]["position"] = "CENTER"
	E.db["unitframe"]["units"]["pet"]["power"]["height"] = 7
	E.db["unitframe"]["units"]["pet"]["castbar"]["enable"] = false
	E.db["unitframe"]["units"]["pet"]["castbar"]["width"] = 125
	E.db["unitframe"]["units"]["pet"]["castbar"]["height"] = 10
	E.db["unitframe"]["units"]["pet"]["infoPanel"]["height"] = 14
	E.db["unitframe"]["units"]["pet"]["infoPanel"]["transparent"] = true
	E.db["unitframe"]["units"]["pet"]["fader"]["minAlpha"] = 0.75
	E.db["unitframe"]["units"]["pet"]["name"]["text_format"] = "[classcolor][name:medium]  [happiness:discord]"
	E.db["unitframe"]["units"]["pet"]["debuffs"]["growthY"] = "DOWN"
	E.db["unitframe"]["units"]["pet"]["debuffs"]["attachTo"] = "BUFFS"
	E.db["unitframe"]["units"]["pet"]["debuffs"]["enable"] = true
	E.db["unitframe"]["units"]["pet"]["buffs"]["growthY"] = "DOWN"
	E.db["unitframe"]["units"]["pet"]["buffs"]["enable"] = true

	-- ============================================================
	-- Unitframes - Boss
	-- ============================================================
	E.db["unitframe"]["units"]["boss"]["width"] = 148
	E.db["unitframe"]["units"]["boss"]["height"] = 30
	E.db["unitframe"]["units"]["boss"]["middleClickFocus"] = true
	E.db["unitframe"]["units"]["boss"]["threatStyle"] = "BORDERS"
	E.db["unitframe"]["units"]["boss"]["infoPanel"]["height"] = 17
	E.db["unitframe"]["units"]["boss"]["castbar"]["width"] = 148
	E.db["unitframe"]["units"]["boss"]["debuffs"]["yOffset"] = -16
	E.db["unitframe"]["units"]["boss"]["debuffs"]["maxDuration"] = 300
	E.db["unitframe"]["units"]["boss"]["debuffs"]["sizeOverride"] = 15
	E.db["unitframe"]["units"]["boss"]["debuffs"]["anchorPoint"] = "RIGHT"
	E.db["unitframe"]["units"]["boss"]["buffs"]["yOffset"] = 16
	E.db["unitframe"]["units"]["boss"]["buffs"]["maxDuration"] = 300
	E.db["unitframe"]["units"]["boss"]["buffs"]["sizeOverride"] = 15
	E.db["unitframe"]["units"]["boss"]["buffs"]["anchorPoint"] = "RIGHT"

	-- ============================================================
	-- Unitframes - Party
	-- ============================================================
	E.db["unitframe"]["units"]["party"]["enable"] = false
	E.db["unitframe"]["units"]["party"]["width"] = 70
	E.db["unitframe"]["units"]["party"]["height"] = 45
	E.db["unitframe"]["units"]["party"]["numGroups"] = 5
	E.db["unitframe"]["units"]["party"]["growthDirection"] = "DOWN_RIGHT"
	E.db["unitframe"]["units"]["party"]["groupBy"] = "GROUP"
	E.db["unitframe"]["units"]["party"]["groupsPerRowCol"] = 1
	E.db["unitframe"]["units"]["party"]["horizontalSpacing"] = 3
	E.db["unitframe"]["units"]["party"]["name"]["text_format"] = "[classcolor][name:short]"
	E.db["unitframe"]["units"]["party"]["healPrediction"]["enable"] = true
	E.db["unitframe"]["units"]["party"]["power"]["text_format"] = ""
	E.db["unitframe"]["units"]["party"]["power"]["position"] = "BOTTOMRIGHT"
	E.db["unitframe"]["units"]["party"]["power"]["yOffset"] = 2
	E.db["unitframe"]["units"]["party"]["health"]["position"] = "BOTTOM"
	E.db["unitframe"]["units"]["party"]["health"]["text_format"] = "[healthcolor][health:deficit:shortvalue]"
	E.db["unitframe"]["units"]["party"]["health"]["yOffset"] = 2

	-- ============================================================
	-- Unitframes - Raid
	-- ============================================================
	E.db["unitframe"]["units"]["raid1"]["enable"] = false
	E.db["unitframe"]["units"]["raid1"]["width"] = 70
	E.db["unitframe"]["units"]["raid1"]["height"] = 45
	E.db["unitframe"]["units"]["raid1"]["growthDirection"] = "DOWN_RIGHT"
	E.db["unitframe"]["units"]["raid1"]["healPrediction"]["enable"] = true
	E.db["unitframe"]["units"]["raid1"]["fader"]["minAlpha"] = 0.55
	E.db["unitframe"]["units"]["raid1"]["fader"]["smooth"] = 0.55
	E.db["unitframe"]["units"]["raid1"]["rdebuffs"]["enable"] = false

	E.db["unitframe"]["units"]["raid2"]["enable"] = false
	E.db["unitframe"]["units"]["raid2"]["width"] = 70
	E.db["unitframe"]["units"]["raid2"]["height"] = 45
	E.db["unitframe"]["units"]["raid2"]["growthDirection"] = "DOWN_RIGHT"
	E.db["unitframe"]["units"]["raid2"]["healPrediction"]["enable"] = true
	E.db["unitframe"]["units"]["raid2"]["power"]["enable"] = true

	E.db["unitframe"]["units"]["raid3"]["enable"] = false
	E.db["unitframe"]["units"]["raid3"]["width"] = 70
	E.db["unitframe"]["units"]["raid3"]["height"] = 45
	E.db["unitframe"]["units"]["raid3"]["growthDirection"] = "DOWN_RIGHT"
	E.db["unitframe"]["units"]["raid3"]["healPrediction"]["enable"] = true
	E.db["unitframe"]["units"]["raid3"]["power"]["enable"] = true

	-- ============================================================
	-- BenikUI 설정 (E.db.benikui)
	-- ============================================================
	if E.db.benikui then
		if E.db.benikui.general then
			E.db["benikui"]["general"]["auras"] = false
			E.db["benikui"]["general"]["shadows"] = true
		end
		if E.db.benikui.datatexts and E.db.benikui.datatexts.chat then
			E.db["benikui"]["datatexts"]["chat"]["enable"] = true
		end
		if E.db.benikui.colors then
			E.db["benikui"]["colors"]["colorTheme"] = "Elv"
		end
	end

	-- BenikUI Databars (v2.x 이후 최상위 키 benikuiDatabars 사용)
	if E.db.benikuiDatabars then
		if E.db.benikuiDatabars.reputation then
			E.db["benikuiDatabars"]["reputation"]["buttonStyle"] = "DEFAULT"
			if E.db.benikuiDatabars.reputation.notifiers then
				E.db["benikuiDatabars"]["reputation"]["notifiers"]["position"] = "ABOVE"
			end
		end
		if E.db.benikuiDatabars.experience then
			E.db["benikuiDatabars"]["experience"]["buiStyle"] = false
			if E.db.benikuiDatabars.experience.notifiers then
				E.db["benikuiDatabars"]["experience"]["notifiers"]["position"] = "ABOVE"
			end
		end
		if E.db.benikuiDatabars.petExperience then
			E.db["benikuiDatabars"]["petExperience"]["buttonStyle"] = "DEFAULT"
			if E.db.benikuiDatabars.petExperience.notifiers then
				E.db["benikuiDatabars"]["petExperience"]["notifiers"]["position"] = "RIGHT"
			end
		end
	end

	-- Elv 색상 테마 직접 적용
	E.db["general"]["backdropfadecolor"]["r"] = 0.054
	E.db["general"]["backdropfadecolor"]["g"] = 0.054
	E.db["general"]["backdropfadecolor"]["b"] = 0.054
	E.db["general"]["backdropfadecolor"]["a"] = 0.75
	E.db["general"]["backdropcolor"]["r"] = 0.025
	E.db["general"]["backdropcolor"]["g"] = 0.025
	E.db["general"]["backdropcolor"]["b"] = 0.025
	if E.db.chat and E.db.chat.panelColor then
		E.db["chat"]["panelColor"]["r"] = 0.054
		E.db["chat"]["panelColor"]["g"] = 0.054
		E.db["chat"]["panelColor"]["b"] = 0.054
		E.db["chat"]["panelColor"]["a"] = 0.75
	end

	-- BenikUI 중간 패널 생성 (BenikUI가 로드된 경우)
	local BUI_ext = ElvUI_BenikUI and ElvUI_BenikUI[1]
	if BUI_ext then
		local Layout = BUI_ext:GetModule("Layout")
		if Layout and Layout.CreateMiddlePanel then
			Layout:CreateMiddlePanel(true)
		end
	end

	-- Private BenikUI
	if E.private.benikui then
		E.private.benikui.expressway = true
	end

	-- ============================================================
	-- UI Scale
	-- ============================================================
	if E.screenheight == 1080 then
		E.db["general"]["UIScale"] = 0.711
	end

	-- ============================================================
	-- Movers (서약선 프로필 기준)
	-- ============================================================
	if E.db["movers"] == nil then E.db["movers"] = {} end
	E.db["movers"]["AlertFrameMover"] = "TOP,UIParent,TOP,0,-208"
	E.db["movers"]["BelowMinimapContainerMover"] = "TOP,UIParent,TOP,0,-75"
	E.db["movers"]["BNETMover"] = "TOPLEFT,UIParent,TOPLEFT,368,-284"
	E.db["movers"]["BuiDashboardMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-8"
	E.db["movers"]["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-158,-3"
	E.db["movers"]["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,360"
	E.db["movers"]["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-158,-128"
	E.db["movers"]["DTPanelBuiMiddleDTPanelMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,2"
	E.db["movers"]["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,145"
	E.db["movers"]["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,105"
	E.db["movers"]["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,0,66"
	E.db["movers"]["ElvAB_4"] = "TOPRIGHT,UIParent,TOPRIGHT,-4,-327"
	E.db["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,27"
	E.db["movers"]["ElvAB_6"] = "TOPRIGHT,UIParent,TOPRIGHT,-45,-327"
	E.db["movers"]["ElvAB_7"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,298"
	E.db["movers"]["ElvAB_8"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,332"
	E.db["movers"]["ElvAB_9"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,366"
	E.db["movers"]["ElvAB_10"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,400"
	E.db["movers"]["ElvUIBagMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,22"
	E.db["movers"]["ElvUIBankMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,2,23"
	E.db["movers"]["ElvUF_FocusMover"] = "BOTTOM,ElvUIParent,BOTTOM,-292,301"
	E.db["movers"]["ElvUF_FocusCastbarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-518,223"
	E.db["movers"]["ElvUF_FocusTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-491,301"
	E.db["movers"]["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,227"
	E.db["movers"]["ElvUF_PetMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,491,301"
	E.db["movers"]["ElvUF_PetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,232"
	E.db["movers"]["ElvUF_PlayerMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,491,333"
	E.db["movers"]["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-231,147"
	E.db["movers"]["ElvUF_Raid1Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,226"
	E.db["movers"]["ElvUF_Raid2Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,227"
	E.db["movers"]["ElvUF_Raid3Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,227"
	E.db["movers"]["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,3,-470"
	E.db["movers"]["ElvUF_TargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-491,333"
	E.db["movers"]["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,231,147"
	E.db["movers"]["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,292,301"
	E.db["movers"]["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,3,-301"
	E.db["movers"]["ElvUF_AssistMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-240,-349"
	E.db["movers"]["ElvUF_BodyGuardMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,444"
	E.db["movers"]["ExperienceBarMover"] = "BOTTOMLEFT,UIParent,BOTTOMLEFT,351,22"
	E.db["movers"]["GMMover"] = "TOPLEFT,UIParent,TOPLEFT,158,-138"
	E.db["movers"]["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,2,22"
	E.db["movers"]["LocationMover"] = "TOP,ElvUIParent,TOP,0,-7"
	E.db["movers"]["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-188"
	E.db["movers"]["MicrobarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,158,-5"
	E.db["movers"]["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-6"
	E.db["movers"]["ObjectiveFrameMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-295,-231"
	E.db["movers"]["PetAB"] = "BOTTOM,UIParent,BOTTOM,110,193"
	E.db["movers"]["PetExperienceBarMover"] = "TOP,UIParent,TOP,0,-544"
	E.db["movers"]["PlayerNameplate"] = "BOTTOM,ElvUIParent,BOTTOM,0,359"
	E.db["movers"]["PlayerPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,350"
	E.db["movers"]["ProfessionsMover"] = "TOPLEFT,UIParent,TOPLEFT,4,-120"
	E.db["movers"]["QuestWatchFrameMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-290,-228"
	E.db["movers"]["QuestTimerFrameMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-421,-253"
	E.db["movers"]["ReputationBarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-351,22"
	E.db["movers"]["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,22"
	E.db["movers"]["ShiftAB"] = "BOTTOM,ElvUIParent,BOTTOM,-120,193"
	E.db["movers"]["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187"
	E.db["movers"]["SquareMinimapButtonBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-298"
	E.db["movers"]["TargetPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,231,215"
	E.db["movers"]["TimeAlertFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-232"
	E.db["movers"]["ThreatBarMover"] = "TOP,UIParent,TOP,0,-222"
	E.db["movers"]["TotemBarMover"] = "TOPLEFT,UIParent,TOPLEFT,368,-430"
	E.db["movers"]["TotemTrackerMover"] = "TOPLEFT,UIParent,TOPLEFT,368,-465"
	E.db["movers"]["TopCenterContainerMover"] = "TOP,UIParent,TOP,0,-34"
	E.db["movers"]["tokenHolderMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-123"
	E.db["movers"]["reputationHolderMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-320"
	E.db["movers"]["VehicleSeatMover"] = "TOPLEFT,UIParent,TOPLEFT,368,-336"
	E.db["movers"]["VehicleLeaveButton"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,457,378"
	E.db["movers"]["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210"
	E.db["movers"]["WatchFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-122,-292"
	E.db["movers"]["BenikUI_액션바_Mover"] = "BOTTOM,ElvUIParent,BOTTOM,0,22"
	E.db["movers"]["ArenaHeaderMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-243,-381"
	E.db["movers"]["BossHeaderMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-243,-381"
	E.db["movers"]["AdditionalPowerMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,491,288"
	E.db["movers"]["LossControlMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,507"
	E.db["movers"]["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96"
	E.db["movers"]["MirrorTimer2Mover"] = "TOP,MirrorTimer1,BOTTOM,0,0"
	E.db["movers"]["MirrorTimer3Mover"] = "TOP,MirrorTimer2,BOTTOM,0,0"
	E.db["movers"]["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-2,-251"
	E.db["movers"]["AdditionalPowerMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,491,288"
	E.db["movers"]["ElvNP_PlayerMover"] = "TOP,UIParent,CENTER,0,-150"
	E.db["movers"]["DurabilityFrameMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-530,-176"

	E:StaggeredUpdateAll(nil, true)

	PluginInstallStepComplete.message = IUI.Title .. L["Profile Set"]
	PluginInstallStepComplete:Show()
end

local addonNames = {}

local function SetupAddons()
	wipe(addonNames)

	if C_AddOns.IsAddOnLoaded("Details") then
		IUI:LoadDetailsProfile()
		tinsert(addonNames, "Details")
	end
	if C_AddOns.IsAddOnLoaded("MRT") then
		IUI:LoadMRTProfile()
		tinsert(addonNames, "MRT")
	end
	if C_AddOns.IsAddOnLoaded("Guidelime") then
		IUI:LoadGuidelimeProfile()
		tinsert(addonNames, "Guidelime")
	end
	if C_AddOns.IsAddOnLoaded("HidingBar") then
		IUI:LoadHidingBarProfile()
		tinsert(addonNames, "HidingBar")
	end
	if C_AddOns.IsAddOnLoaded("LFGBulletinBoard") then
		IUI:LoadLFGBulletinBoardProfile()
		tinsert(addonNames, "LFGBulletinBoard")
	end

	if #addonNames > 0 then
		PluginInstallFrame.Desc4:SetText(
			format("|cfffff400적용된 애드온:|r %s", table.concat(addonNames, ", "))
		)
	else
		PluginInstallFrame.Desc4:SetText("|cffff8000지원 애드온이 로드되어 있지 않습니다.|r")
	end

	PluginInstallStepComplete.message = IUI.Title .. " 애드온 설정 완료"
	PluginInstallStepComplete:Show()
end

local function InstallComplete()
	E.private.install_complete = E.version
	E.private.iberisui.install_complete = IUI.Version
	ReloadUI()
end

-- ElvUI Plugin 설치 마법사
IUI.installTable = {
	["Name"] = "|cffff9900IberisUI|r",
	["Title"] = "|cffff9900IberisUI|r 프로필 설치",
	["Pages"] = {
		[1] = function()
			PluginInstallFrame:BuiStyle("Outside")
			PluginInstallTitleFrame:BuiStyle("Outside")
			PluginInstallTutorialImage:Size(384, 96)
			PluginInstallTutorialImage:Point("BOTTOM", 0, 100)
			PluginInstallTutorialImage2:SetTexture(nil)
			PluginInstallTitleFrame.text:SetFont(E["media"].normFont, 16, "OUTLINE")
			PluginInstallFrame.SubTitle:SetFormattedText(L["Welcome to IberisUI version %s, for ElvUI %s."], IUI.Version, E.version)
			PluginInstallFrame.Desc1:SetText("|cffff9900이베리스(Iberis)|r 개인 프로필 애드온에 오신 것을 환영합니다.")
			PluginInstallFrame.Desc2:SetText("계속 버튼을 누르면 '서약선' 케릭터 기준의 설정이 적용됩니다.\n\n|cffff8000팁: 기존 설정을 보존하려면 먼저 새 프로필을 만드세요.|r")
			PluginInstallFrame.Desc3:SetText("계속 버튼을 눌러 다음 단계로 진행하세요.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() InstallComplete() end)
			PluginInstallFrame.Option1:SetText(L["Skip Process"])
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText(L["Layout"])
			PluginInstallFrame.Desc1:SetText("ElvUI 전체 설정(유닛프레임, 액션바, 네임플레이트, 무버 등)을 적용합니다.")
			PluginInstallFrame.Desc2:SetText("아래 버튼을 클릭하면 서약선 기준 설정이 한 번에 적용됩니다.")
			PluginInstallFrame.Desc3:SetText(L["Importance: |cff07D400High|r"])
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() ApplyIberisProfile() end)
			PluginInstallFrame.Option1:SetText(L["Apply Iberis Profile"])
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetText("외부 애드온 프로필")
			PluginInstallFrame.Desc1:SetText("로드된 애드온에 서약선 기준 설정을 적용합니다.")
			PluginInstallFrame.Desc2:SetText("지원: Pawn, ItemRack, HidingBar, LFGBulletinBoard, FindParty")
			PluginInstallFrame.Desc3:SetText("중요도: |cffD3CF00보통|r")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() SetupAddons() end)
			PluginInstallFrame.Option1:SetText("애드온 설정 적용")
		end,
		[4] = function()
			PluginInstallFrame.SubTitle:SetText("채팅 창 설정")
			PluginInstallFrame.Desc1:SetText("채팅 창 구성(이름, 메시지 종류)을 서약선 기준으로 설정합니다.")
			PluginInstallFrame.Desc2:SetText("|cffff8000'애옹', '추추' 채널은 개인 채널이므로 제외됩니다.|r\n파티찾기, LookingForGroup 채널은 유지됩니다.")
			PluginInstallFrame.Desc3:SetText("중요도: |cffD3CF00보통|r")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() IUI:SetupChatWindows() end)
			PluginInstallFrame.Option1:SetText("채팅 창 설정")
		end,
		[5] = function()
			PluginInstallFrame.SubTitle:SetText(L["Installation Complete"])
			PluginInstallFrame.Desc1:SetText("IberisUI 설치가 완료되었습니다!")
			PluginInstallFrame.Desc2:SetText("'완료' 버튼을 클릭하면 UI가 재로드됩니다.")
			PluginInstallFrame.Desc3:SetText("")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() InstallComplete() end)
			PluginInstallFrame.Option1:SetText(L["Finished"])
			PluginInstallStepComplete.message = IUI.Title .. L["Installed"]
			PluginInstallStepComplete:Show()
		end,
	},
	["StepTitles"] = {
		[1] = "시작",
		[2] = L["Layout"],
		[3] = "외부 애드온",
		[4] = "채팅 창",
		[5] = L["Installation Complete"],
	},
	StepTitlesColor = { 1, 1, 1 },
	StepTitlesColorSelected = { 1, 0.6, 0 },
	StepTitleWidth = 200,
	StepTitleButtonWidth = 200,
	StepTitleTextJustification = "CENTER",
}
