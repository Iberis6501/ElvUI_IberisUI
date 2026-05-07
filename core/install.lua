local IUI, E, L = unpack((select(2, ...)))
local ReloadUI = ReloadUI
local tinsert, wipe = table.insert, table.wipe or wipe
local format = string.format

-- ============================================================
-- ApplyIberisProfile — 내보내기 정확한 값 verbatim 적용
-- ============================================================
local function ApplyIberisProfile()

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
	E.db["actionbar"]["bar4"]["backdropSpacing"] = 3
	E.db["actionbar"]["bar4"]["buttonSize"] = 36
	E.db["actionbar"]["bar4"]["buttonSpacing"] = 1
	E.db["actionbar"]["bar4"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar4"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar4"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar4"]["macroTextPosition"] = "BOTTOM"
	E.db["actionbar"]["bar4"]["macroTextYOffset"] = 0
	E.db["actionbar"]["bar4"]["macrotext"] = true
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
	E.db["actionbar"]["bar6"]["backdrop"] = true
	E.db["actionbar"]["bar6"]["backdropSpacing"] = 3
	E.db["actionbar"]["bar6"]["buttonSize"] = 36
	E.db["actionbar"]["bar6"]["buttonSpacing"] = 1
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
	E.db["bags"]["bagWidth"] = 348
	E.db["bags"]["bankSize"] = 32
	E.db["bags"]["bankWidth"] = 348
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
		E.db["benikui"]["Databars"]["experience"]["notifiers"]["enable"] = false
		E.db["benikui"]["Databars"]["reputation"]["notifiers"]["enable"] = false
		E.db["benikui"]["Databars"]["threat"]["enable"] = false
		E.db["benikui"]["actionbars"]["style"]["bar1"] = false
		E.db["benikui"]["actionbars"]["style"]["bar10"] = false
		E.db["benikui"]["actionbars"]["style"]["bar2"] = false
		E.db["benikui"]["actionbars"]["style"]["bar3"] = false
		E.db["benikui"]["actionbars"]["style"]["bar5"] = false
		E.db["benikui"]["actionbars"]["style"]["bar7"] = false
		E.db["benikui"]["actionbars"]["style"]["bar8"] = false
		E.db["benikui"]["actionbars"]["style"]["bar9"] = false
		E.db["benikui"]["actionbars"]["toggleButtons"]["chooseAb"] = "BAR1"
		E.db["benikui"]["colors"]["abAlpha"] = 0.7
		E.db["benikui"]["colors"]["styleAlpha"] = 0.7
		E.db["benikui"]["dashboards"]["tokens"]["enableTokens"] = false
		E.db["benikui"]["misc"]["flightMode"]["enable"] = false
		if E.db["benikui"]["panels"] and E.db["benikui"]["panels"]["BenikUI_액션바"] then
			local abPanel = E.db["benikui"]["panels"]["BenikUI_액션바"]
			abPanel["clickThrough"] = true
			abPanel["combatHide"] = false
			if not abPanel["customStyleColor"] then abPanel["customStyleColor"] = {} end
			abPanel["customStyleColor"]["b"] = 0
			abPanel["customStyleColor"]["g"] = 0.7
			abPanel["customStyleColor"]["r"] = 0.9
			abPanel["enable"] = true
			abPanel["height"] = 166
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
			abPanel["width"] = 1228
		end
		E.db["benikui"]["unitframes"]["target"]["getPlayerPortraitSize"] = false
	end
	E.db["chat"]["font"] = "Expressway"
	E.db["chat"]["keywordSound"] = "Acoustic Guitar"
	E.db["chat"]["keywords"] = "%MYNAME%,이베,약선"
	E.db["chat"]["panelColor"]["a"] = 0.75
	E.db["chat"]["panelColor"]["b"] = 0.054
	E.db["chat"]["panelColor"]["g"] = 0.054
	E.db["chat"]["panelColor"]["r"] = 0.054
	E.db["chat"]["panelHeight"] = 166
	E.db["chat"]["panelWidth"] = 348
	E.db["chat"]["panelSnapLeftID"]  = 1
	E.db["chat"]["panelSnapRightID"] = 4
	E.db["chat"]["panelBackdrop"] = "SHOWBOTH"
	E.db["chat"]["tabFont"] = "Expressway"
	E.db["chat"]["tabFontOutline"] = "OUTLINE"
	E.db["chat"]["tabFontSize"] = 11
	E.db["chat"]["tabSelectorColor"]["b"] = 0.45
	E.db["chat"]["tabSelectorColor"]["g"] = 0.83
	E.db["chat"]["tabSelectorColor"]["r"] = 0.67
	E.db["convertPages"] = true
	E.db["cooldown"]["auras"]["fontSize"] = 10
	E.db["cooldown"]["global"]["fontSize"] = 15
	E.db["cooldown"]["unitframe"]["fontSize"] = 10
	E.db["databars"]["azerite"]["enable"] = false
	E.db["databars"]["experience"]["font"] = "Expressway"
	E.db["databars"]["experience"]["fontSize"] = 10
	E.db["databars"]["experience"]["height"] = 166
	E.db["databars"]["experience"]["hideAtMaxLevel"] = false
	E.db["databars"]["experience"]["orientation"] = "VERTICAL"
	E.db["databars"]["experience"]["showLevel"] = true
	E.db["databars"]["experience"]["width"] = 9
	E.db["databars"]["petExperience"]["enable"] = false
	E.db["databars"]["reputation"]["enable"] = true
	E.db["databars"]["reputation"]["fontSize"] = 9
	E.db["databars"]["reputation"]["height"] = 166
	E.db["databars"]["reputation"]["orientation"] = "VERTICAL"
	E.db["databars"]["reputation"]["width"] = 9
	E.db["databars"]["statusbar"] = "BuiFlat"
	E.db["databars"]["threat"]["enable"] = false
	E.db["databars"]["threat"]["height"] = 24
	E.db["databars"]["threat"]["width"] = 472
	E.db["datatexts"]["font"] = "Expressway"
	E.db["datatexts"]["fontOutline"] = "OUTLINE"
	E.db["datatexts"]["fontSize"] = 11
	if E.db["datatexts"]["panels"]["BuiLeftChatDTPanel"] then
		E.db["datatexts"]["panels"]["BuiLeftChatDTPanel"][1] = "BuiMail"
		E.db["datatexts"]["panels"]["BuiLeftChatDTPanel"][2] = "System"
		E.db["datatexts"]["panels"]["BuiLeftChatDTPanel"][3] = "ElvUI"
	end
	if E.db["datatexts"]["panels"]["BuiMiddleDTPanel"] then
		E.db["datatexts"]["panels"]["BuiMiddleDTPanel"][1] = "LDB_ItemRack"
		E.db["datatexts"]["panels"]["BuiMiddleDTPanel"][2] = "LDB_iWillRemember_MinimapButton"
		E.db["datatexts"]["panels"]["BuiMiddleDTPanel"][3] = "LDB_AtlasLoot"
		E.db["datatexts"]["panels"]["BuiMiddleDTPanel"][4] = "LDB_SavedClassicIcon"
		E.db["datatexts"]["panels"]["BuiMiddleDTPanel"][5] = "LDB_FindParty"
		E.db["datatexts"]["panels"]["BuiMiddleDTPanel"]["battleground"] = false
		E.db["datatexts"]["panels"]["BuiMiddleDTPanel"]["enable"] = true
	end
	if E.db["datatexts"]["panels"]["BuiRightChatDTPanel"] then
		E.db["datatexts"]["panels"]["BuiRightChatDTPanel"][1] = "Durability"
	end
	if E.db["datatexts"]["panels"]["LeftChatDataPanel"] then
		E.db["datatexts"]["panels"]["LeftChatDataPanel"][3] = "QuickJoin"
		E.db["datatexts"]["panels"]["LeftChatDataPanel"]["enable"] = false
	end
	if E.db["datatexts"]["panels"]["LocPlusLeftDT"] then
		E.db["datatexts"]["panels"]["LocPlusLeftDT"][1] = "MovementSpeed"
	end
	if E.db["datatexts"]["panels"]["RightChatDataPanel"] then
		E.db["datatexts"]["panels"]["RightChatDataPanel"]["enable"] = false
	end
	E.db["general"]["autoAcceptInvite"] = true
	E.db["general"]["autoRepair"] = "GUILD"
	E.db["general"]["autoTrackReputation"] = true
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
	E.db["general"]["interruptAnnounce"] = "SAY"
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
	E.db["movers"]["AdditionalPowerMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,491,288"
	E.db["movers"]["AlertFrameMover"] = "TOP,UIParent,TOP,0,-208"
	E.db["movers"]["ArenaHeaderMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-243,-381"
	E.db["movers"]["BNETMover"] = "TOPLEFT,UIParent,TOPLEFT,368,-284"
	E.db["movers"]["BelowMinimapContainerMover"] = "TOP,UIParent,TOP,0,-75"
	E.db["movers"]["BenikUI_액션바_Mover"] = "BOTTOM,ElvUIParent,BOTTOM,0,22"
	E.db["movers"]["BossHeaderMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-243,-381"
	E.db["movers"]["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-158,-3"
	E.db["movers"]["BuiDashboardMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-8"
	E.db["movers"]["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,360"
	E.db["movers"]["DTPanelBuiMiddleDTPanelMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,2"
	E.db["movers"]["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-158,-128"
	E.db["movers"]["DurabilityFrameMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-530,-176"
	E.db["movers"]["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,145"
	E.db["movers"]["ElvAB_10"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,400"
	E.db["movers"]["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,105"
	E.db["movers"]["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,0,66"
	E.db["movers"]["ElvAB_4"] = "TOPRIGHT,UIParent,TOPRIGHT,-4,-327"
	E.db["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,27"
	E.db["movers"]["ElvAB_6"] = "TOPRIGHT,UIParent,TOPRIGHT,-45,-327"
	E.db["movers"]["ElvAB_7"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,298"
	E.db["movers"]["ElvAB_8"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,332"
	E.db["movers"]["ElvAB_9"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,366"
	E.db["movers"]["ElvNP_PlayerMover"] = "TOP,UIParent,CENTER,0,-150"
	E.db["movers"]["ElvUF_AssistMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-240,-349"
	E.db["movers"]["ElvUF_BodyGuardMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,444"
	E.db["movers"]["ElvUF_FocusCastbarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-518,223"
	E.db["movers"]["ElvUF_FocusMover"] = "BOTTOM,ElvUIParent,BOTTOM,-292,301"
	E.db["movers"]["ElvUF_FocusTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-491,301"
	E.db["movers"]["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,227"
	E.db["movers"]["ElvUF_PetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,232"
	E.db["movers"]["ElvUF_PetMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,491,301"
	E.db["movers"]["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-231,147"
	E.db["movers"]["ElvUF_PlayerMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,491,333"
	E.db["movers"]["ElvUF_Raid1Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,226"
	E.db["movers"]["ElvUF_Raid2Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,227"
	E.db["movers"]["ElvUF_Raid3Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,227"
	E.db["movers"]["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,3,-470"
	E.db["movers"]["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,3,-301"
	E.db["movers"]["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,231,147"
	E.db["movers"]["ElvUF_TargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-491,333"
	E.db["movers"]["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,292,301"
	E.db["movers"]["ElvUIBagMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,22"
	E.db["movers"]["ElvUIBankMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,2,23"
	E.db["movers"]["ExperienceBarMover"] = "BOTTOMLEFT,UIParent,BOTTOMLEFT,351,22"
	E.db["movers"]["GMMover"] = "TOPLEFT,UIParent,TOPLEFT,158,-138"
	E.db["movers"]["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-2,-251"
	E.db["movers"]["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,2,22"
	E.db["movers"]["LocationMover"] = "TOP,ElvUIParent,TOP,0,-7"
	E.db["movers"]["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-188"
	E.db["movers"]["LossControlMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,507"
	E.db["movers"]["MicrobarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,158,-5"
	E.db["movers"]["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-6"
	E.db["movers"]["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96"
	E.db["movers"]["MirrorTimer2Mover"] = "TOP,MirrorTimer1,BOTTOM,0,0"
	E.db["movers"]["MirrorTimer3Mover"] = "TOP,MirrorTimer2,BOTTOM,0,0"
	E.db["movers"]["ObjectiveFrameMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-295,-231"
	E.db["movers"]["PetAB"] = "BOTTOM,UIParent,BOTTOM,110,193"
	E.db["movers"]["PetExperienceBarMover"] = "TOP,UIParent,TOP,0,-544"
	E.db["movers"]["PlayerNameplate"] = "BOTTOM,ElvUIParent,BOTTOM,0,359"
	E.db["movers"]["PlayerPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,350"
	E.db["movers"]["ProfessionsMover"] = "TOPLEFT,UIParent,TOPLEFT,4,-120"
	E.db["movers"]["QuestTimerFrameMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-421,-253"
	E.db["movers"]["QuestWatchFrameMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-290,-228"
	E.db["movers"]["ReputationBarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-351,22"
	E.db["movers"]["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,22"
	E.db["movers"]["ShiftAB"] = "BOTTOM,ElvUIParent,BOTTOM,-120,193"
	E.db["movers"]["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187"
	E.db["movers"]["SquareMinimapButtonBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-298"
	E.db["movers"]["TargetPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,231,215"
	E.db["movers"]["ThreatBarMover"] = "TOP,UIParent,TOP,0,-222"
	E.db["movers"]["TimeAlertFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-232"
	E.db["movers"]["TopCenterContainerMover"] = "TOP,UIParent,TOP,0,-34"
	E.db["movers"]["TotemBarMover"] = "TOPLEFT,UIParent,TOPLEFT,368,-430"
	E.db["movers"]["TotemTrackerMover"] = "TOPLEFT,UIParent,TOPLEFT,368,-465"
	E.db["movers"]["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210"
	E.db["movers"]["VehicleLeaveButton"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,457,378"
	E.db["movers"]["VehicleSeatMover"] = "TOPLEFT,UIParent,TOPLEFT,368,-336"
	E.db["movers"]["WatchFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-122,-292"
	E.db["movers"]["reputationHolderMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-320"
	E.db["movers"]["tokenHolderMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-123"
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
	E.db["nameplates"]["units"]["ENEMY_NPC"]["raidTargetIndicator"]["position"] = "RIGHT"
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
	E.db["unitframe"]["targetSound"] = true
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
	E.db["unitframe"]["units"]["player"]["buffs"]["attachTo"] = "FRAME"
	E.db["unitframe"]["units"]["player"]["castbar"]["height"] = 28
	E.db["unitframe"]["units"]["player"]["castbar"]["icon"] = false
	E.db["unitframe"]["units"]["player"]["castbar"]["insideInfoPanel"] = false
	E.db["unitframe"]["units"]["player"]["castbar"]["overlayOnFrame"] = "InfoPanel"
	E.db["unitframe"]["units"]["player"]["castbar"]["width"] = 255
	E.db["unitframe"]["units"]["player"]["classAdditional"]["width"] = 255
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
	E.db["unitframe"]["units"]["target"]["castbar"]["height"] = 40
	E.db["unitframe"]["units"]["target"]["castbar"]["icon"] = false
	E.db["unitframe"]["units"]["target"]["castbar"]["iconPosition"] = "RIGHT"
	E.db["unitframe"]["units"]["target"]["castbar"]["iconXOffset"] = 10
	E.db["unitframe"]["units"]["target"]["castbar"]["insideInfoPanel"] = false
	E.db["unitframe"]["units"]["target"]["castbar"]["overlayOnFrame"] = "InfoPanel"
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
		mp["BuiMiddleDTPanel"]["height"]          = 19
		mp["BuiMiddleDTPanel"]["numPoints"]        = 5
		mp["BuiMiddleDTPanel"]["tooltipXOffset"]   = 3
		mp["BuiMiddleDTPanel"]["width"]            = 1228
	end
	if E.global and E.global["general"] then
		if E.global["general"]["WorldMapCoordinates"] then
			E.global["general"]["WorldMapCoordinates"]["enable"] = false
		end
		E.global["general"]["fadeMapWhenMoving"] = false
		E.global["general"]["smallerWorldMap"]   = false
	end

	-- BenikUI 중간 패널 생성
	local BUI_ext = ElvUI_BenikUI and ElvUI_BenikUI[1]
	if BUI_ext then
		local Layout = BUI_ext:GetModule("Layout")
		if Layout and Layout.CreateMiddlePanel then Layout:CreateMiddlePanel(true) end
	end

	-- profileKeys 업데이트
	if ElvDB and ElvDB.profileKeys then
		ElvDB.profileKeys[E.mynameRealm] = "이베리스"
	end
	if ElvPrivateDB and ElvPrivateDB.profileKeys then
		ElvPrivateDB.profileKeys[E.mynameRealm] = "이베리스"
	end

	E:StaggeredUpdateAll(nil, true)

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
	tryLoad("Details",   function() IUI:LoadDetailsProfile() end)
	tryLoad("MRT",       function() IUI:LoadMRTProfile() end)
	tryLoad("Guidelime", function() IUI:LoadGuidelimeProfile() end)
	tryLoad("HidingBar", function() IUI:LoadHidingBarProfile() end)
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
	if E.private.iberisui then E.private.iberisui.install_complete = IUI.Version end
	ReloadUI()
end

-- ============================================================
-- 설치 마법사
-- ============================================================
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
			PluginInstallFrame.Desc2:SetText("이베리스 설정을 현재 케릭터에 적용합니다.\n\n|cffff8000팁: 기존 설정 보존 시 먼저 새 프로필을 만드세요.|r")
			PluginInstallFrame.Desc3:SetText("계속 버튼을 눌러 진행하세요.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() InstallComplete() end)
			PluginInstallFrame.Option1:SetText(L["Skip Process"])
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText(L["Layout"])
			PluginInstallFrame.Desc1:SetText("이베리스 프로필 설정을 즉시 적용합니다.")
			PluginInstallFrame.Desc2:SetText("(유닛프레임·액션바·채팅·네임플레이트·무버 포함)")
			PluginInstallFrame.Desc3:SetText(L["Importance: |cff07D400High|r"])
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function()
				local ok, err = pcall(ApplyIberisProfile)
				if not ok then DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 오류: "..tostring(err)) end
			end)
			PluginInstallFrame.Option1:SetText(L["Apply Iberis Profile"])
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetText("외부 애드온 프로필")
			PluginInstallFrame.Desc1:SetText("Details, MRT, Guidelime, HidingBar 설정 저장")
			PluginInstallFrame.Desc2:SetText("(재로드 후 반영)")
			PluginInstallFrame.Desc3:SetText("중요도: |cffD3CF00보통|r")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function()
				local ok, err = pcall(SetupAddons)
				if not ok then DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 오류: "..tostring(err)) end
			end)
			PluginInstallFrame.Option1:SetText("애드온 설정 적용")
		end,
		[4] = function()
			PluginInstallFrame.SubTitle:SetText("채팅 창 설정")
			PluginInstallFrame.Desc1:SetText("ElvUI 기본 채팅 설정을 실행합니다.\n(전리품 창 → 오른쪽 패널)")
			PluginInstallFrame.Desc2:SetText("완료 버튼 재로드 후 좌우 패널이 정상 적용됩니다.")
			PluginInstallFrame.Desc3:SetText("중요도: |cffD3CF00보통|r")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function()
				local ok, err = pcall(function() IUI:SetupChatWindows() end)
				if not ok then DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 채팅 오류: "..tostring(err)) end
			end)
			PluginInstallFrame.Option1:SetText("채팅 설정")
		end,
		[5] = function()
			PluginInstallFrame.SubTitle:SetText(L["Installation Complete"])
			PluginInstallFrame.Desc1:SetText("IberisUI 설치 완료!")
			PluginInstallFrame.Desc2:SetText("'완료' 버튼을 클릭하면 UI가 재로드됩니다.")
			PluginInstallFrame.Desc3:SetText("")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() InstallComplete() end)
			PluginInstallFrame.Option1:SetText(L["Finished"])
			PluginInstallStepComplete.message = IUI.Title..L["Installed"]
			PluginInstallStepComplete:Show()
		end,
	},
	["StepTitles"] = {[1]="시작",[2]=L["Layout"],[3]="외부 애드온",[4]="채팅 창",[5]=L["Installation Complete"]},
	StepTitlesColor={1,1,1}, StepTitlesColorSelected={1,0.6,0},
	StepTitleWidth=200, StepTitleButtonWidth=200, StepTitleTextJustification="CENTER",
}
