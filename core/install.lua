local IUI, E, L = unpack((select(2, ...)))
local ReloadUI = ReloadUI
local tinsert, wipe = table.insert, table.wipe or wipe
local format = string.format

-- ============================================================
-- 안전한 중첩 테이블 접근/생성
-- ============================================================
local function ensure(t, ...)
	local cur = t
	for _, k in ipairs({...}) do
		if type(cur[k]) ~= "table" then cur[k] = {} end
		cur = cur[k]
	end
	return cur
end

-- ============================================================
-- DeepCopy (순환 참조 처리)
-- ============================================================
local function DeepCopy(t, lookup)
	if type(t) ~= "table" then return t end
	local copy = {}
	lookup = lookup or {}
	lookup[t] = copy
	for k, v in pairs(t) do
		copy[k] = lookup[v] or DeepCopy(v, lookup)
	end
	return copy
end

-- ============================================================
-- 이베리스 프로필 적용
-- BenikUI 방식: E.db에 직접 기록 → StaggeredUpdateAll (reload 없음)
-- 내보내기 기반 정확한 값 사용
-- ============================================================
local function ApplyIberisProfile()

	-- ---- General ----
	ensure(E.db, "general")
	E.db.general.font               = "Expressway"
	E.db.general.fontSize           = 11
	E.db.general.autoAcceptInvite   = true
	E.db.general.autoRepair         = "GUILD"
	E.db.general.autoTrackReputation = true
	E.db.general.bottomPanel        = false
	E.db.general.decimalLength      = 2
	E.db.general.interruptAnnounce  = "SAY"
	E.db.general.objectiveFrameAutoHide = false
	E.db.general.objectiveFrameHeight   = 750
	E.db.general.smoothingAmount        = 0.5
	E.db.general.talkingHeadFrameScale  = 1
	E.db.general.bonusObjectivePosition = "AUTO"
	ensure(E.db.general, "backdropcolor")
	E.db.general.backdropcolor.r = 0.025
	E.db.general.backdropcolor.g = 0.025
	E.db.general.backdropcolor.b = 0.025
	ensure(E.db.general, "backdropfadecolor")
	E.db.general.backdropfadecolor.a = 0.75
	E.db.general.backdropfadecolor.r = 0.054
	E.db.general.backdropfadecolor.g = 0.054
	E.db.general.backdropfadecolor.b = 0.054
	ensure(E.db.general, "valuecolor")
	E.db.general.valuecolor.r = 1
	E.db.general.valuecolor.g = 0.5
	E.db.general.valuecolor.b = 0
	ensure(E.db.general, "minimap")
	E.db.general.minimap.locationText = "HIDE"
	E.db.general.minimap.size = 150
	ensure(E.db.general, "itemLevel")
	E.db.general.itemLevel.displayCharacterInfo = false
	E.db.general.itemLevel.displayInspectInfo   = false
	ensure(E.db.general, "totems")
	E.db.general.totems.growthDirection = "HORIZONTAL"
	E.db.general.totems.size    = 50
	E.db.general.totems.spacing = 8

	-- ---- Bags ----
	ensure(E.db, "bags")
	E.db.bags.bagSize       = 32
	E.db.bags.bankSize      = 32
	E.db.bags.bagWidth      = 348
	E.db.bags.bankWidth     = 348
	E.db.bags.transparent   = true
	E.db.bags.scrapIcon     = true
	E.db.bags.junkIcon      = true
	E.db.bags.junkDesaturate= true
	E.db.bags.showBindType  = true
	E.db.bags.reverseSlots  = true
	E.db.bags.clearSearchOnClose = true
	E.db.bags.countFont         = "Expressway"
	E.db.bags.countFontOutline  = "OUTLINE"
	E.db.bags.itemLevelFont     = "Expressway"
	E.db.bags.itemLevelFontOutline = "OUTLINE"
	E.db.bags.itemInfoFontOutline  = "NONE"
	ensure(E.db.bags, "vendorGrays")
	E.db.bags.vendorGrays.enable  = true
	E.db.bags.vendorGrays.details = true
	ensure(E.db.bags, "autoToggle")
	E.db.bags.autoToggle.guildBank = true
	ensure(E.db.bags, "split")
	E.db.bags.split.bag1 = true
	E.db.bags.split.bag2 = true
	E.db.bags.split.bag3 = true
	E.db.bags.split.bag4 = true

	-- ---- Chat ----
	ensure(E.db, "chat")
	E.db.chat.font           = "Expressway"
	E.db.chat.tabFont        = "Expressway"
	E.db.chat.tabFontSize    = 11
	E.db.chat.tabFontOutline = "OUTLINE"
	E.db.chat.panelWidth     = 348
	E.db.chat.panelHeight    = 166
	E.db.chat.panelBackdrop  = "SHOWBOTH"
	E.db.chat.keywordSound   = "Acoustic Guitar"
	E.db.chat.keywords       = "%MYNAME%,이베,약선"
	E.db.chat.panelSnapLeftID  = 1
	E.db.chat.panelSnapRightID = 4
	ensure(E.db.chat, "panelColor")
	E.db.chat.panelColor.a = 0.75
	E.db.chat.panelColor.r = 0.054
	E.db.chat.panelColor.g = 0.054
	E.db.chat.panelColor.b = 0.054
	ensure(E.db.chat, "tabSelectorColor")
	E.db.chat.tabSelectorColor.b = 0.45
	E.db.chat.tabSelectorColor.g = 0.83
	E.db.chat.tabSelectorColor.r = 0.67

	-- ---- Databars ----
	ensure(E.db, "databars")
	E.db.databars.statusbar = "BuiFlat"
	ensure(E.db.databars, "experience")
	E.db.databars.experience.font          = "Expressway"
	E.db.databars.experience.fontSize      = 10
	E.db.databars.experience.height        = 166
	E.db.databars.experience.width         = 9
	E.db.databars.experience.orientation   = "VERTICAL"
	E.db.databars.experience.showLevel     = true
	E.db.databars.experience.hideAtMaxLevel= false
	ensure(E.db.databars, "reputation")
	E.db.databars.reputation.enable      = true
	E.db.databars.reputation.fontSize    = 9
	E.db.databars.reputation.height      = 166
	E.db.databars.reputation.width       = 9
	E.db.databars.reputation.orientation = "VERTICAL"
	E.db.databars.reputation.textFormat  = "NONE"
	ensure(E.db.databars, "petExperience")
	E.db.databars.petExperience.enable = false
	ensure(E.db.databars, "threat")
	E.db.databars.threat.enable = false
	E.db.databars.threat.width  = 472
	E.db.databars.threat.height = 24
	ensure(E.db.databars, "azerite")
	E.db.databars.azerite.enable = false

	-- ---- Datatexts ----
	ensure(E.db, "datatexts")
	E.db.datatexts.font        = "Expressway"
	E.db.datatexts.fontOutline = "OUTLINE"
	E.db.datatexts.fontSize    = 11
	E.db.datatexts.rightChatPanel = false
	ensure(E.db.datatexts, "panels", "LeftChatDataPanel")
	E.db.datatexts.panels.LeftChatDataPanel.enable = false
	ensure(E.db.datatexts, "panels", "RightChatDataPanel")
	E.db.datatexts.panels.RightChatDataPanel.enable = false
	ensure(E.db.datatexts, "panels", "BuiLeftChatDTPanel")
	E.db.datatexts.panels.BuiLeftChatDTPanel[1] = "BuiMail"
	E.db.datatexts.panels.BuiLeftChatDTPanel[2] = "System"
	E.db.datatexts.panels.BuiLeftChatDTPanel[3] = "ElvUI"
	ensure(E.db.datatexts, "panels", "BuiRightChatDTPanel")
	E.db.datatexts.panels.BuiRightChatDTPanel[1] = "Durability"
	ensure(E.db.datatexts, "panels", "BuiMiddleDTPanel")
	E.db.datatexts.panels.BuiMiddleDTPanel[1]   = "LDB_ItemRack"
	E.db.datatexts.panels.BuiMiddleDTPanel[2]   = "LDB_iWillRemember_MinimapButton"
	E.db.datatexts.panels.BuiMiddleDTPanel[3]   = "LDB_AtlasLoot"
	E.db.datatexts.panels.BuiMiddleDTPanel[4]   = "LDB_SavedClassicIcon"
	E.db.datatexts.panels.BuiMiddleDTPanel[5]   = "LDB_FindParty"
	E.db.datatexts.panels.BuiMiddleDTPanel.enable      = true
	E.db.datatexts.panels.BuiMiddleDTPanel.battleground = false
	ensure(E.db.datatexts, "panels", "LocPlusLeftDT")
	E.db.datatexts.panels.LocPlusLeftDT[1] = "MovementSpeed"

	-- ---- Tooltip ----
	ensure(E.db, "tooltip")
	E.db.tooltip.font               = "Expressway"
	E.db.tooltip.headerFontSize     = 11
	E.db.tooltip.textFontSize       = 11
	E.db.tooltip.smallTextFontSize  = 11
	E.db.tooltip.alwaysShowRealm    = true
	E.db.tooltip.cursorAnchor       = true
	E.db.tooltip.cursorAnchorType   = "ANCHOR_CURSOR_RIGHT"
	E.db.tooltip.cursorAnchorX      = 50
	E.db.tooltip.cursorAnchorY      = -25
	E.db.tooltip.itemQuality        = true
	ensure(E.db.tooltip, "healthBar")
	E.db.tooltip.healthBar.font     = "Expressway"
	E.db.tooltip.healthBar.fontSize = 9
	E.db.tooltip.healthBar.height   = 6

	-- ---- Auras ----
	ensure(E.db, "auras", "buffs")
	E.db.auras.buffs.countFont        = "기본 글꼴"
	E.db.auras.buffs.countFontOutline = "NONE"
	E.db.auras.buffs.horizontalSpacing = 3
	E.db.auras.buffs.size              = 30
	ensure(E.db, "auras", "debuffs")
	E.db.auras.debuffs.countFont        = "기본 글꼴"
	E.db.auras.debuffs.countFontOutline = "NONE"
	E.db.auras.debuffs.size             = 30

	-- ---- Actionbar ----
	ensure(E.db, "actionbar")
	E.db.actionbar.font                = "Expressway"
	E.db.actionbar.fontOutline         = "THICKOUTLINE"
	E.db.actionbar.desaturateOnCooldown = true
	E.db.actionbar.rightClickSelfCast  = true
	E.db.actionbar.transparent         = true
	local barDefs = {
		bar1  = {backdropSpacing=6, buttonSize=36, buttonSpacing=3, macrotext=true, macroTextPosition="BOTTOM", macroTextYOffset=0},
		bar2  = {backdropSpacing=6, buttonSize=36, buttonSpacing=3, macrotext=true, macroTextPosition="BOTTOM", macroTextYOffset=0, enabled=true, heightMult=2, visibility="[petbattle] hide; show"},
		bar3  = {backdropSpacing=6, buttonSize=36, buttonSpacing=3, buttons=12, buttonsPerRow=12, macrotext=true, macroTextPosition="BOTTOM", macroTextYOffset=0, visibility="[petbattle] hide; show"},
		bar4  = {backdropSpacing=3, buttonSize=36, buttonSpacing=1, macrotext=true, macroTextPosition="BOTTOM", macroTextYOffset=0, point="TOPLEFT", visibility="[petbattle] hide; show"},
		bar5  = {backdropSpacing=6, buttonSize=36, buttonSpacing=3, buttons=12, buttonsPerRow=12, macrotext=true, macroTextPosition="BOTTOM", macroTextYOffset=0, visibility="[petbattle] hide; show"},
		bar6  = {backdrop=true, backdropSpacing=3, buttonSize=36, buttonSpacing=1, buttonsPerRow=1, enabled=true, macrotext=true, macroTextPosition="BOTTOM", macroTextYOffset=0, point="TOPLEFT", visibility="[petbattle] hide; show"},
		barPet = {backdrop=false, backdropSpacing=6, buttonSize=20, buttonSpacing=4, buttonsPerRow=10, point="TOPLEFT"},
	}
	local thickBars = {"bar1","bar2","bar3","bar4","bar5","bar6","bar7","bar8","bar9","bar10","barPet","stanceBar","extraActionButton","vehicleExitButton"}
	for _, name in ipairs(thickBars) do
		ensure(E.db.actionbar, name)
		E.db.actionbar[name].hotkeyFontOutline = "THICKOUTLINE"
		E.db.actionbar[name].macroFontOutline  = "THICKOUTLINE"
		E.db.actionbar[name].countFontOutline  = "THICKOUTLINE"
	end
	for name, vals in pairs(barDefs) do
		ensure(E.db.actionbar, name)
		for k, v in pairs(vals) do E.db.actionbar[name][k] = v end
	end
	ensure(E.db.actionbar, "stanceBar")
	E.db.actionbar.stanceBar.buttonSize = 30

	-- ---- Nameplates ----
	ensure(E.db, "nameplates")
	E.db.nameplates.font       = "Bui Visitor1"
	E.db.nameplates.fontOutline = "MONOCHROMEOUTLINE"
	E.db.nameplates.fontSize   = 10
	E.db.nameplates.statusbar  = "BuiFlat"
	local npUnits = {"FRIENDLY_NPC","FRIENDLY_PLAYER","ENEMY_NPC","ENEMY_PLAYER"}
	local npSubs  = {"debuffs","buffs","castbar","health","power","name","level"}
	for _, unit in ipairs(npUnits) do
		local u = ensure(E.db.nameplates, "units", unit)
		for _, sub in ipairs(npSubs) do
			ensure(u, sub)
			if u[sub].font    ~= nil or sub == "debuffs" or sub == "buffs" or sub == "castbar" or sub == "name" or sub == "level" then
				u[sub].font = "Expressway"
			end
			if sub == "debuffs" or sub == "buffs" then u[sub].countFont = "Expressway" end
		end
		if u.health and u.health.text then u.health.text.font = "Expressway" end
		if u.power  and u.power.text  then u.power.text.font  = "Expressway" end
	end
	ensure(E.db.nameplates, "units", "ENEMY_PLAYER", "portrait")
	E.db.nameplates.units.ENEMY_PLAYER.portrait.enable   = true
	E.db.nameplates.units.ENEMY_PLAYER.portrait.position = "LEFT"
	E.db.nameplates.units.ENEMY_PLAYER.portrait.classicon = false

	-- ---- Unitframe - General ----
	ensure(E.db, "unitframe")
	E.db.unitframe.font        = "Expressway"
	E.db.unitframe.fontOutline = "OUTLINE"
	E.db.unitframe.fontSize    = 11
	E.db.unitframe.targetSound = true
	E.db.unitframe.smoothbars  = true
	E.db.unitframe.statusbar   = "BuiFlat"
	local ufc = ensure(E.db.unitframe, "colors")
	ufc.castClassColor    = true
	ufc.castReactionColor = true
	ufc.colorhealthbyvalue = false
	ufc.healthclass       = true
	ufc.transparentAurabars = true
	ufc.useDeadBackdrop   = true
	ensure(ufc,"health")["r"]=0.1; ufc.health.g=0.1; ufc.health.b=0.1
	ensure(ufc,"castColor")["r"]=0.1; ufc.castColor.g=0.1; ufc.castColor.b=0.1
	ensure(ufc,"auraBarBuff")["r"]=0.1; ufc.auraBarBuff.g=0.1; ufc.auraBarBuff.b=0.1
	ensure(ufc,"health_backdrop_dead")["r"]=0.14901960784314
	ufc.health_backdrop_dead.g=0.003921568627451; ufc.health_backdrop_dead.b=0.003921568627451
	ensure(ufc,"power","MANA")["r"]=0.30980392156863
	ufc.power.MANA.g=0.45098039215686; ufc.power.MANA.b=0.63137254901961

	-- ---- Unitframe - Player ----
	local player = ensure(E.db.unitframe,"units","player")
	player.width=255; player.height=55; player.disableMouseoverGlow=true
	player.smartAuraPosition="DEBUFFS_ON_BUFFS"
	ensure(player,"portrait").overlay=true; player.portrait.camDistanceScale=1
	ensure(player,"infoPanel").enable=true; player.infoPanel.height=22; player.infoPanel.transparent=true
	ensure(player,"health").attachTextTo="InfoPanel"; player.health.smoothbars=true
	player.health.xOffset=4; player.health.text_format=""
	ensure(player,"power").text_format="[power:current-percent]"; player.power.attachTextTo="Power"
	player.power.position="CENTER"; player.power.height=12; player.power.detachedWidth=369
	player.power.hideonnpc=true; player.power.xOffset=0
	ensure(player,"power","strataAndLevel").frameLevel=2
	ensure(player,"castbar").icon=false; player.castbar.overlayOnFrame="InfoPanel"
	player.castbar.width=255; player.castbar.height=28; player.castbar.insideInfoPanel=false
	ensure(player,"classbar").detachedWidth=140; player.classbar.smoothbars=true
	ensure(player,"classAdditional").width=255
	ensure(player,"buffs").attachTo="FRAME"
	ensure(player,"debuffs").attachTo="BUFFS"
	ensure(player,"healPrediction").absorbStyle="NORMAL"
	ensure(player,"customTexts")["BenikuiPlayerHealth"]={attachTextTo="Health",enable=true,font="Expressway",fontOutline="NONE",justifyH="RIGHT",size=22,text_format="[health:current-percent]",xOffset=-8,yOffset=-1}
	player.customTexts["BenikuiPlayerName"]={attachTextTo="InfoPanel",enable=true,font="Expressway",fontOutline="NONE",justifyH="RIGHT",size=11,text_format="[name]",xOffset=-8,yOffset=0}
	player.customTexts["lvl"]={attachTextTo="InfoPanel",enable=true,font="Expressway",fontOutline="OUTLINE",justifyH="LEFT",size=11,text_format="[level] 레벨",xOffset=8,yOffset=0}

	-- ---- Unitframe - Target ----
	local target = ensure(E.db.unitframe,"units","target")
	target.width=255; target.height=55; target.orientation="LEFT"; target.disableMouseoverGlow=true
	target.smartAuraPosition="DEBUFFS_ON_BUFFS"
	ensure(target,"portrait").overlay=true; target.portrait.camDistanceScale=1
	ensure(target,"infoPanel").enable=true; target.infoPanel.height=22; target.infoPanel.transparent=true
	ensure(target,"health").attachTextTo="InfoPanel"; target.health.smoothbars=true
	target.health.xOffset=4; target.health.text_format=""
	ensure(target,"name").text_format=""; target.name.position="RIGHT"; target.name.xOffset=8
	ensure(target,"power").text_format="[power:current-percent]"; target.power.attachTextTo="Power"
	target.power.position="CENTER"; target.power.height=12; target.power.detachedWidth=300; target.power.xOffset=0
	ensure(target,"castbar").icon=false; target.castbar.overlayOnFrame="InfoPanel"
	target.castbar.width=255; target.castbar.height=40; target.castbar.insideInfoPanel=false
	target.castbar.iconPosition="RIGHT"; target.castbar.iconXOffset=10
	ensure(target,"fader").minAlpha=0.75
	ensure(target,"healPrediction").absorbStyle="NORMAL"
	ensure(target,"customTexts")["BenikuiTargetHealth"]={attachTextTo="Health",enable=true,font="Expressway",fontOutline="NONE",justifyH="LEFT",size=22,text_format="[health:current-percent]",xOffset=8,yOffset=-1}
	target.customTexts["BenikuiTargetName"]={attachTextTo="InfoPanel",enable=true,font="Expressway",fontOutline="NONE",justifyH="LEFT",size=11,text_format="[name:medium] [difficultycolor][smartlevel] [shortclassification]",xOffset=8,yOffset=0}

	-- ---- Unitframe - Secondary Units ----
	local function applySimpleUnit(u, w, h, extra)
		u.width=w; u.height=h
		ensure(u,"health").smoothbars=true
		ensure(u,"fader").minAlpha=0.75
		if extra then extra(u) end
	end
	local ufu = ensure(E.db.unitframe,"units")
	applySimpleUnit(ensure(ufu,"focus"),125,30,function(u)
		u.disableMouseoverGlow=true; u.disableTargetGlow=true
		ensure(u,"power").position="CENTER"; u.power.height=7; u.power.xOffset=0
		ensure(u,"infoPanel").height=12; u.infoPanel.transparent=true
		ensure(u,"portrait").camDistanceScale=1
		local cb=ensure(u,"castbar"); cb.width=125; cb.height=14; cb.overlayOnFrame="Health"; cb.iconSize=26; cb.smoothbars=true
	end)
	applySimpleUnit(ensure(ufu,"focustarget"),125,30,function(u)
		u.disableMouseoverGlow=true; u.disableTargetGlow=true; u.enable=true
		ensure(u,"power").position="CENTER"; u.power.height=7; u.power.xOffset=0
		ensure(u,"castbar").width=125; u.castbar.overlayOnFrame="Health"
	end)
	local tt=ensure(ufu,"targettarget")
	tt.width=125; tt.height=30; tt.disableMouseoverGlow=true; tt.threatStyle="GLOW"
	ensure(tt,"health").smoothbars=true; ensure(tt,"power").height=7
	ensure(tt,"infoPanel").height=12; ensure(tt,"portrait").overlay=true; tt.portrait.camDistanceScale=1
	ensure(tt,"fader").minAlpha=0.75; ensure(tt,"name").text_format="[name:medium]"
	ensure(tt,"debuffs").enable=false
	local pet=ensure(ufu,"pet")
	pet.width=125; pet.height=30; pet.disableMouseoverGlow=true
	ensure(pet,"health").smoothbars=true; ensure(pet,"portrait").overlay=true
	ensure(pet,"power").position="CENTER"; pet.power.height=7; pet.power.xOffset=0
	ensure(pet,"castbar").enable=false; pet.castbar.width=125; pet.castbar.height=10; pet.castbar.iconSize=32
	ensure(pet,"infoPanel").height=14; pet.infoPanel.transparent=true
	ensure(pet,"fader").minAlpha=0.75
	ensure(pet,"name").text_format="[classcolor][name:medium]  [happiness:discord]"
	ensure(pet,"debuffs").attachTo="BUFFS"; pet.debuffs.enable=true; pet.debuffs.growthY="DOWN"
	ensure(pet,"buffs").enable=true; pet.buffs.growthY="DOWN"
	ensure(pet,"customTexts")["만족도"]={attachTextTo="Health",enable=true,font="Expressway",fontOutline="OUTLINE",justifyH="LEFT",size=11,text_format="",xOffset=4,yOffset=0}
	local boss=ensure(ufu,"boss")
	boss.width=148; boss.height=30; boss.middleClickFocus=true; boss.threatStyle="BORDERS"
	ensure(boss,"infoPanel").height=17
	ensure(boss,"castbar").width=148
	ensure(boss,"debuffs").anchorPoint="RIGHT"; boss.debuffs.maxDuration=300; boss.debuffs.sizeOverride=15; boss.debuffs.yOffset=-16
	ensure(boss,"buffs").anchorPoint="RIGHT"; boss.buffs.maxDuration=300; boss.buffs.sizeOverride=15; boss.buffs.yOffset=16
	for _,rn in ipairs({"raid1","raid2","raid3"}) do
		local r=ensure(ufu,rn); r.enable=false; r.width=70; r.height=45; r.growthDirection="DOWN_RIGHT"
		ensure(r,"healPrediction").enable=true
		if rn=="raid1" then ensure(r,"fader").minAlpha=0.55; r.fader.smooth=0.55; ensure(r,"rdebuffs").enable=false; ensure(r,"roleIcon").enable=false end
		if rn~="raid1" then ensure(r,"power").enable=true end
	end
	ensure(ufu,"assist").enable=false
	ensure(ufu,"party").enable=false; ufu.party.width=70; ufu.party.height=45
	ensure(ufu,"tank").middleClickFocus=true
	ensure(ufu,"arena").width=225
	ensure(ufu,"raidpet").numGroups=5; ufu.raidpet.width=70

	-- ---- BenikUI ----
	if E.db.benikui then
		ensure(E.db.benikui,"Databars","experience","notifiers").enable=false
		ensure(E.db.benikui,"Databars","reputation","notifiers").enable=false
		ensure(E.db.benikui,"Databars","threat").enable=false
		ensure(E.db.benikui,"misc","flightMode").enable=false
		ensure(E.db.benikui,"dashboards","tokens").enableTokens=false
		ensure(E.db.benikui,"colors").abAlpha=0.7; E.db.benikui.colors.styleAlpha=0.7
		ensure(E.db.benikui,"unitframes","target").getPlayerPortraitSize=false
		-- 액션바 패널
		local abPanel = ensure(E.db.benikui,"panels","BenikUI_액션바")
		abPanel.enable=true; abPanel.width=1228; abPanel.height=166; abPanel.point="CENTER"
		abPanel.clickThrough=true; abPanel.combatHide=false; abPanel.shadow=true
		abPanel.strata="BACKGROUND"; abPanel.style=true; abPanel.styleColor=1
		abPanel.stylePosition="TOP"; abPanel.tooltip=false; abPanel.transparency=true
		abPanel.visibility=""
		ensure(E.db.benikui,"actionbars","toggleButtons").chooseAb="BAR1"
	end

	-- ---- Movers ----
	ensure(E.db, "movers")
	local movers = {
		AdditionalPowerMover        ="BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,491,288",
		AlertFrameMover             ="TOP,UIParent,TOP,0,-208",
		ArenaHeaderMover            ="TOPRIGHT,UIParent,TOPRIGHT,-243,-381",
		BNETMover                   ="TOPLEFT,UIParent,TOPLEFT,368,-284",
		BelowMinimapContainerMover  ="TOP,UIParent,TOP,0,-75",
		["BenikUI_액션바_Mover"]     ="BOTTOM,ElvUIParent,BOTTOM,0,22",
		BossHeaderMover             ="TOPRIGHT,UIParent,TOPRIGHT,-243,-381",
		BuffsMover                  ="TOPRIGHT,ElvUIParent,TOPRIGHT,-158,-3",
		BuiDashboardMover           ="TOPLEFT,ElvUIParent,TOPLEFT,4,-8",
		ClassBarMover               ="BOTTOM,ElvUIParent,BOTTOM,0,360",
		DTPanelBuiMiddleDTPanelMover="BOTTOM,ElvUIParent,BOTTOM,0,2",
		DebuffsMover                ="TOPRIGHT,ElvUIParent,TOPRIGHT,-158,-128",
		DurabilityFrameMover        ="TOPRIGHT,UIParent,TOPRIGHT,-530,-176",
		ElvAB_1  ="BOTTOM,ElvUIParent,BOTTOM,0,145",
		ElvAB_2  ="BOTTOM,ElvUIParent,BOTTOM,0,105",
		ElvAB_3  ="BOTTOM,ElvUIParent,BOTTOM,0,66",
		ElvAB_4  ="TOPRIGHT,UIParent,TOPRIGHT,-4,-327",
		ElvAB_5  ="BOTTOM,ElvUIParent,BOTTOM,0,27",
		ElvAB_6  ="TOPRIGHT,UIParent,TOPRIGHT,-45,-327",
		ElvAB_7  ="BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,298",
		ElvAB_8  ="BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,332",
		ElvAB_9  ="BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,366",
		ElvAB_10 ="BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,400",
		ElvNP_PlayerMover           ="TOP,UIParent,CENTER,0,-150",
		ElvUF_AssistMover           ="TOPRIGHT,UIParent,TOPRIGHT,-240,-349",
		ElvUF_BodyGuardMover        ="BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,444",
		ElvUF_FocusCastbarMover     ="BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-518,223",
		ElvUF_FocusMover            ="BOTTOM,ElvUIParent,BOTTOM,-292,301",
		ElvUF_FocusTargetMover      ="BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-491,301",
		ElvUF_PartyMover            ="BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,227",
		ElvUF_PetCastbarMover       ="BOTTOM,ElvUIParent,BOTTOM,0,232",
		ElvUF_PetMover              ="BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,491,301",
		ElvUF_PlayerCastbarMover    ="BOTTOM,ElvUIParent,BOTTOM,-231,147",
		ElvUF_PlayerMover           ="BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,491,333",
		ElvUF_Raid1Mover            ="BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,226",
		ElvUF_Raid2Mover            ="BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,227",
		ElvUF_Raid3Mover            ="BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,3,227",
		ElvUF_RaidpetMover          ="TOPLEFT,ElvUIParent,TOPLEFT,3,-470",
		ElvUF_TankMover             ="TOPLEFT,ElvUIParent,TOPLEFT,3,-301",
		ElvUF_TargetCastbarMover    ="BOTTOM,ElvUIParent,BOTTOM,231,147",
		ElvUF_TargetMover           ="BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-491,333",
		ElvUF_TargetTargetMover     ="BOTTOM,ElvUIParent,BOTTOM,292,301",
		ElvUIBagMover               ="BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,22",
		ElvUIBankMover              ="BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,2,23",
		ExperienceBarMover          ="BOTTOMLEFT,UIParent,BOTTOMLEFT,351,22",
		GMMover                     ="TOPLEFT,UIParent,TOPLEFT,158,-138",
		HonorBarMover               ="TOPRIGHT,ElvUIParent,TOPRIGHT,-2,-251",
		LeftChatMover               ="BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,2,22",
		LocationMover               ="TOP,ElvUIParent,TOP,0,-7",
		LootFrameMover              ="TOPLEFT,ElvUIParent,TOPLEFT,368,-188",
		LossControlMover            ="BOTTOM,ElvUIParent,BOTTOM,-1,507",
		MicrobarMover               ="TOPLEFT,ElvUIParent,TOPLEFT,158,-5",
		MinimapMover                ="TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-6",
		MirrorTimer1Mover           ="TOP,ElvUIParent,TOP,-1,-96",
		MirrorTimer2Mover           ="TOP,MirrorTimer1,BOTTOM,0,0",
		MirrorTimer3Mover           ="TOP,MirrorTimer2,BOTTOM,0,0",
		ObjectiveFrameMover         ="TOPRIGHT,UIParent,TOPRIGHT,-295,-231",
		PetAB                       ="BOTTOM,UIParent,BOTTOM,110,193",
		PetExperienceBarMover       ="TOP,UIParent,TOP,0,-544",
		PlayerNameplate             ="BOTTOM,ElvUIParent,BOTTOM,0,359",
		PlayerPowerBarMover         ="BOTTOM,ElvUIParent,BOTTOM,0,350",
		ProfessionsMover            ="TOPLEFT,UIParent,TOPLEFT,4,-120",
		QuestTimerFrameMover        ="TOPRIGHT,UIParent,TOPRIGHT,-421,-253",
		QuestWatchFrameMover        ="TOPRIGHT,UIParent,TOPRIGHT,-290,-228",
		ReputationBarMover          ="BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-351,22",
		RightChatMover              ="BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-2,22",
		ShiftAB                     ="BOTTOM,ElvUIParent,BOTTOM,-120,193",
		SocialMenuMover             ="TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
		SquareMinimapButtonBarMover ="TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-298",
		TargetPowerBarMover         ="BOTTOM,ElvUIParent,BOTTOM,231,215",
		ThreatBarMover              ="TOP,UIParent,TOP,0,-222",
		TimeAlertFrameMover         ="TOPLEFT,ElvUIParent,TOPLEFT,368,-232",
		TopCenterContainerMover     ="TOP,UIParent,TOP,0,-34",
		TotemBarMover               ="TOPLEFT,UIParent,TOPLEFT,368,-430",
		TotemTrackerMover           ="TOPLEFT,UIParent,TOPLEFT,368,-465",
		VOICECHAT                   ="TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
		VehicleLeaveButton          ="BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,457,378",
		VehicleSeatMover            ="TOPLEFT,UIParent,TOPLEFT,368,-336",
		WatchFrameMover             ="TOPRIGHT,ElvUIParent,TOPRIGHT,-122,-292",
		reputationHolderMover       ="TOPLEFT,ElvUIParent,TOPLEFT,4,-320",
		tokenHolderMover            ="TOPLEFT,ElvUIParent,TOPLEFT,4,-123",
	}
	for k, v in pairs(movers) do E.db.movers[k] = v end

	-- ---- Private ----
	if E.private.general then
		E.private.general.chatBubbleFont    = "Expressway"
		E.private.general.chatBubbleFontSize = 10
		E.private.general.dmgfont           = "데미지 글꼴"
		E.private.general.glossTex          = "BuiFlat"
		E.private.general.normTex           = "BuiFlat"
		E.private.general.raidUtility       = false
		E.private.general.totemTracker      = false
		E.private.general.worldMap          = false
	end
	if E.private.skins then
		E.private.skins.parchmentRemoverEnable = true
	end
	if E.private.benikui then
		E.private.benikui.expressway = true
	end

	-- ---- Global (BuiMiddleDTPanel 너비) ----
	if E.global and E.global.datatexts and E.global.datatexts.customPanels then
		local mp = ensure(E.global.datatexts.customPanels, "BuiMiddleDTPanel")
		mp.benikuiStyle  = false
		mp.height        = 19
		mp.numPoints     = 5
		mp.tooltipXOffset = 3
		mp.width         = 1228
	end

	-- ---- BenikUI 중간 패널 생성 ----
	local BUI_ext = ElvUI_BenikUI and ElvUI_BenikUI[1]
	if BUI_ext then
		local Layout = BUI_ext:GetModule("Layout")
		if Layout and Layout.CreateMiddlePanel then Layout:CreateMiddlePanel(true) end
	end

	-- ---- 프로필명 "이베리스" 등록 (다음 재로드에서 유지) ----
	if ElvDB and ElvDB.profileKeys then
		ElvDB.profileKeys[E.mynameRealm] = "이베리스"
	end
	if ElvPrivateDB and ElvPrivateDB.profileKeys then
		ElvPrivateDB.profileKeys[E.mynameRealm] = "이베리스"
	end

	-- ---- 즉시 UI 갱신 (재로드 없음) ----
	E:StaggeredUpdateAll(nil, true)

	DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 이베리스 프로필 적용 완료!")
	PluginInstallStepComplete.message = IUI.Title .. L["Profile Set"]
	PluginInstallStepComplete:Show()
end

-- ============================================================
-- 외부 애드온 설정
-- ============================================================
local addonNames = {}

local function SetupAddons()
	wipe(addonNames)

	local function tryLoad(addonName, loadFn)
		DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r " .. addonName .. " 적용 중...")
		local ok, err = pcall(loadFn)
		if ok then
			tinsert(addonNames, addonName)
			DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r " .. addonName .. " |cff00ff00완료|r")
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r " .. addonName .. " |cffff0000실패|r: " .. tostring(err))
		end
	end

	tryLoad("Details",   function() IUI:LoadDetailsProfile() end)
	tryLoad("MRT",       function() IUI:LoadMRTProfile() end)
	tryLoad("Guidelime", function() IUI:LoadGuidelimeProfile() end)
	tryLoad("HidingBar", function() IUI:LoadHidingBarProfile() end)

	local resultMsg
	if #addonNames > 0 then
		resultMsg = format("|cfffff400저장 완료:|r %s — 재로드 후 반영", table.concat(addonNames, ", "))
	else
		resultMsg = "|cffff8000실패 — 채팅 오류 메시지 확인|r"
	end
	PluginInstallFrame.Desc2:SetText(resultMsg)
	DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r " .. resultMsg)
	PluginInstallStepComplete.message = IUI.Title .. " 애드온 설정 저장됨"
	PluginInstallStepComplete:Show()
end

local function InstallComplete()
	E.private.install_complete = E.version
	if E.private.iberisui then
		E.private.iberisui.install_complete = IUI.Version
	end
	ReloadUI()
end

-- ============================================================
-- 설치 마법사
-- ============================================================
IUI.installTable = {
	["Name"]  = "|cffff9900IberisUI|r",
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
			PluginInstallFrame.Desc2:SetText("이베리스 설정을 현재 케릭터에 즉시 적용합니다.\n\n|cffff8000팁: 기존 설정을 보존하려면 먼저 새 프로필을 만드세요.|r")
			PluginInstallFrame.Desc3:SetText("계속 버튼을 눌러 다음 단계로 진행하세요.")
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
				if not ok then
					DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 오류: " .. tostring(err))
				end
			end)
			PluginInstallFrame.Option1:SetText(L["Apply Iberis Profile"])
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetText("외부 애드온 프로필")
			PluginInstallFrame.Desc1:SetText("Details, MRT, Guidelime, HidingBar 설정을 저장합니다.")
			PluginInstallFrame.Desc2:SetText("(재로드 후 반영)")
			PluginInstallFrame.Desc3:SetText("중요도: |cffD3CF00보통|r")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function()
				local ok, err = pcall(SetupAddons)
				if not ok then
					DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 애드온 오류: " .. tostring(err))
				end
			end)
			PluginInstallFrame.Option1:SetText("애드온 설정 적용")
		end,
		[4] = function()
			PluginInstallFrame.SubTitle:SetText("채팅 창 설정")
			PluginInstallFrame.Desc1:SetText("이베리스 프로필에 채팅 패널 설정이 포함되어 있습니다.")
			PluginInstallFrame.Desc2:SetText("'완료' 버튼으로 재로드 시 좌측·우측 채팅 패널이 자동 구성됩니다.\n별도 조작 없이 확인 버튼을 누르세요.")
			PluginInstallFrame.Desc3:SetText("중요도: |cffD3CF00보통|r")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function()
				local ok, err = pcall(function() IUI:SetupChatWindows() end)
				if not ok then
					DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 채팅 오류: " .. tostring(err))
				end
			end)
			PluginInstallFrame.Option1:SetText("확인")
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
	StepTitlesColor         = {1, 1, 1},
	StepTitlesColorSelected = {1, 0.6, 0},
	StepTitleWidth          = 200,
	StepTitleButtonWidth    = 200,
	StepTitleTextJustification = "CENTER",
}
