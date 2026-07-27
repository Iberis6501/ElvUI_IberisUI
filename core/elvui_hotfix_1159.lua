-- ============================================================
-- ElvUI 15.18 × Classic Era 1.15.9(신엔진) 런타임 핫픽스
--
-- 1.15.9(빌드 68808)부터 Classic Era 클라가 신엔진으로 전환됐지만
-- ElvUI 15.18은 아직 구엔진 경로를 타서 초기화가 붕괴한다.
-- 이 파일은 IberisUI 로드 시점(=ElvUI 파일 로드 후, E:Initialize 전)에
-- ElvUI의 함수를 교체/래핑해 파일 수정 없이 동일한 효과를 낸다.
--
-- 동봉 애드온 !IberisFix가 선행 조건: ElvUI가 파일 로드 때 local로
-- 캡처하는 삭제된 전역(CastingBarFrame_SetUnit 등)은 ElvUI보다 먼저
-- 로드되는 !IberisFix가 채운다. (이 파일 시점엔 이미 캡처가 끝나 불가)
--
-- 게이트: Classic 계열 + 빌드 68808+ + ElvUI 15.19 미만.
-- ElvUI가 신엔진 대응 버전을 내면 자동으로 전부 비활성된다.
-- 외부 파일 패치(Apply-ElvUIHotfix.ps1)가 적용된 클라와도 공존 가능.
-- ============================================================

local IUI, E = unpack((select(2, ...)))

if not E then return end

local build = tonumber((select(2, GetBuildInfo()))) or 0
if not (E.Classic and build >= 68808 and (tonumber(E.version) or 99) < 15.19) then return end

local _G = _G
local next, pairs, ipairs, type, select, unpack = next, pairs, ipairs, type, select, unpack
local pcall, xpcall, geterrorhandler = pcall, xpcall, geterrorhandler
local CreateFrame, hooksecurefunc = CreateFrame, hooksecurefunc

local UF = E:GetModule('UnitFrames', true)
local AB = E:GetModule('ActionBars', true)
local B  = E:GetModule('Bags', true)
local NP = E:GetModule('NamePlates', true)
local S  = E:GetModule('Skins', true)

-- 메서드를 격벽(xpcall)으로 감싼다: 워치독 킬/에러가 나도 호출자는 계속 진행
local function Bulkhead(owner, key)
	local orig = owner and owner[key]
	if type(orig) ~= 'function' then return end
	owner[key] = function(...)
		E:CallLoadFunc(orig, ...)
	end
end

-- 프레임의 RegisterEvent를 pcall로 가드: 신엔진에서 삭제된 이벤트
-- (LEARNED_SPELL_IN_TAB 등) 등록 시도가 크래시로 번지지 않게 한다
local function GuardRegisterEvent(frame)
	if not frame or frame.IberisREGuard then return end
	frame.IberisREGuard = true
	local orig = frame.RegisterEvent
	frame.RegisterEvent = function(f, event, ...)
		local ok = pcall(orig, f, event, ...)
		return ok
	end
end

-- ------------------------------------------------------------
-- 1. 삭제된 이벤트 등록 가드 (AceEvent 공용 프레임 + 라이브러리 프레임)
-- ------------------------------------------------------------
GuardRegisterEvent(_G.AceEvent30Frame)

local LAB = _G.LibStub and _G.LibStub('LibActionButton-1.0-ElvUI', true)
if LAB then
	LAB.eventFrame = LAB.eventFrame or CreateFrame('Frame')
	GuardRegisterEvent(LAB.eventFrame)
end

local LD = _G.LibStub and _G.LibStub('LibDispel-1.0', true)
if LD then
	LD.frame = LD.frame or CreateFrame('Frame') -- 우리가 선생성해 가드 (lib는 있으면 재사용)
	GuardRegisterEvent(LD.frame)
end

-- ------------------------------------------------------------
-- 2. 신엔진에서 삭제된 전역 프레임의 런타임(_G 조회) 사용처 더미
-- ------------------------------------------------------------
if not _G.StanceBarFrame then _G.StanceBarFrame = {} end -- StyleShapeShift의 lastSelected 대입용
if not _G.VerticalMultiBarsContainer then _G.VerticalMultiBarsContainer = CreateFrame('Frame') end
if not _G.TemporaryEnchantFrame then _G.TemporaryEnchantFrame = CreateFrame('Frame') end

-- ------------------------------------------------------------
-- 3. 게임 메뉴 (구 GameMenuButtonLogout 경로 → 신 buttonPool 경로)
-- ------------------------------------------------------------
if not _G.GameMenuButtonLogout then
	function E:PositionGameMenuButton()
		local menu = _G.GameMenuFrame
		if E.private.skins and E.private.skins.blizzard and E.private.skins.blizzard.enable and E.private.skins.blizzard.misc
			and menu.Header and menu.Header.Text then
			menu.Header.Text:SetTextColor(unpack(E.media.rgbvaluecolor))
		end

		menu:Height(menu:GetHeight() + 10)

		if menu.buttonPool then
			for button in menu.buttonPool:EnumerateActive() do
				local text = button:GetText()
				if text and (text == _G.LOGOUT or text == _G.LOG_OUT or text == _G.EXIT_GAME or text == _G.RETURN_TO_GAME) then
					button:NudgePoint(nil, -20)
				elseif text == _G.MACROS and menu.ElvUI then
					menu.ElvUI:Point('TOPLEFT', button, 'BOTTOMLEFT')
				end
			end
		end

		if menu.ElvUI then
			menu.ElvUI:SetFormattedText('%sElvUI|r', E.media.hexvaluecolor)
		end
	end

	function E:SetupGameMenu()
		local menu = _G.GameMenuFrame
		if menu.ElvUI then return end

		local button = CreateFrame('Button', 'ElvUI_GameMenuButton', menu, 'MainMenuFrameButtonTemplate')
		button:SetScript('OnClick', E.ClickGameMenu)
		button:Size(144, 21)

		menu.ElvUI = button
		menu.MenuButtons = {}

		hooksecurefunc(menu, 'Layout', E.PositionGameMenuButton)
	end

	-- 신메뉴는 버튼을 열 때마다 buttonPool에서 생성 → Layout 훅으로 스킨
	local menu = _G.GameMenuFrame
	if S and menu and menu.buttonPool and not menu.IberisSkinHook then
		menu.IberisSkinHook = true
		hooksecurefunc(menu, 'Layout', function(m)
			for button in m.buttonPool:EnumerateActive() do
				S:HandleButton(button)
			end
		end)
		if menu.Header and menu.Header.StripTextures then
			menu.Header:StripTextures()
		end
	end
end

-- ------------------------------------------------------------
-- 4. 이름표 클릭영역 (C_NamePlate.SetNamePlate*Size 삭제 대응)
-- ------------------------------------------------------------
if NP and not (_G.C_NamePlate and _G.C_NamePlate.SetNamePlateSelfSize) then
	function NP:SetNamePlateSizes()
		local cs = NP.db and NP.db.clickSize
		if NP.PlateDriver and cs then
			NP.PlateDriver:SetSize(cs.width, cs.height)
		end
	end
end

-- ------------------------------------------------------------
-- 5. 워치독("script ran too long") 이음새 격벽
--    킬이 어디에 떨어져도 "그 조각 하나"만 잃고 초기화는 완주한다
-- ------------------------------------------------------------
function E:InitializeInitialModules()
	for index, object in ipairs(E.RegisteredInitialModules) do
		E:CallLoadFunc(E.CallLoadedModule, E, object, true, E.RegisteredInitialModules, index)
	end
end

function E:InitializeModules()
	for index, object in ipairs(E.RegisteredModules) do
		E:CallLoadFunc(E.CallLoadedModule, E, object, true, E.RegisteredModules, index)
	end
end

Bulkhead(E, 'LoadMovers')
Bulkhead(E, 'UpdateMedia')
Bulkhead(E, 'UpdateAuraCurves')
Bulkhead(E, 'UpdateDispelColors')
Bulkhead(E, 'UpdateCustomClassColors')

-- 설치 마법사는 자기만의 실행 슬라이스에서 (로그인 러시에 킬당하면 마법사가 반쪽이 됨)
do
	local origInstall = E.Install
	if type(origInstall) == 'function' then
		E.Install = function()
			E:Delay(2, function() E:CallLoadFunc(origInstall, E) end)
		end
	end
end

-- 무버 색 갱신: 워치독 킬로 반쪽 생성된 무버가 있어도 순회가 죽지 않게
if E.valueColorUpdateFuncs and E.valueColorUpdateFuncs.Movers then
	local orig = E.valueColorUpdateFuncs.Movers
	E.valueColorUpdateFuncs.Movers = function(...)
		pcall(orig, ...)
	end
end

-- 설정창(/ec) 구성 조각 격벽
Bulkhead(E, 'Config_CreateLeftButtons')
Bulkhead(E, 'Config_CreateBottomButtons')
Bulkhead(E, 'Config_UpdateLeftScroller')

if UF then
	function UF:LoadUnits()
		for _, unit in pairs(UF.unitstoload) do
			E:CallLoadFunc(UF.CreateAndUpdateUF, UF, unit)
		end
		UF.unitstoload = nil

		for group, groupOptions in pairs(UF.unitgroupstoload) do
			local numGroup, template = unpack(groupOptions)
			E:CallLoadFunc(UF.CreateAndUpdateUFGroup, UF, group, numGroup, template)
		end
		UF.unitgroupstoload = nil

		for group, groupOptions in pairs(UF.headerstoload) do
			local groupFilter, template, headerTemplate
			if type(groupOptions) == 'table' then
				groupFilter, template, headerTemplate = unpack(groupOptions)
			end

			E:CallLoadFunc(UF.CreateAndUpdateHeaderGroup, UF, group, groupFilter, template, headerTemplate)
		end
		UF.headerstoload = nil
	end

	-- 비활성 그룹(레이드펫 등)은 헤더 생성 자체를 스킵 → 로그인 부하 대폭 감소.
	-- 나중에 옵션에서 켜면 보관한 템플릿으로 정상 생성.
	do
		local orig = UF.CreateAndUpdateHeaderGroup
		UF.deferredHeaders = UF.deferredHeaders or {}
		UF.CreateAndUpdateHeaderGroup = function(self, group, groupFilter, template, headerTemplate, skip)
			local db = UF.db and UF.db.units and UF.db.units[group]
			if db and not db.enable and not UF[group] then
				UF.deferredHeaders[group] = { groupFilter, template, headerTemplate }
				return
			end

			local opts = UF.deferredHeaders[group]
			if opts and not UF[group] then
				groupFilter, template, headerTemplate = groupFilter or opts[1], template or opts[2], headerTemplate or opts[3]
				UF.deferredHeaders[group] = nil
			end

			return orig(self, group, groupFilter, template, headerTemplate, skip)
		end
	end
end

if AB then
	Bulkhead(AB, 'CreateBar')
	Bulkhead(AB, 'UpdateButtonSettings')
	Bulkhead(AB, 'ToggleCooldownOptions')
	Bulkhead(AB, 'LoadKeyBinder')
	Bulkhead(AB, 'HandleBinds')
	Bulkhead(AB, 'SetTargetAuraCooldowns')

	-- 바인딩 복구 경로를 선등록: AB 초기화가 킬로 잘려도 다음 이벤트에서 자동 복구
	pcall(AB.RegisterEvent, AB, 'UPDATE_BINDINGS', 'UpdateAllBinds')
	pcall(AB.RegisterEvent, AB, 'SPELL_UPDATE_COOLDOWN', 'UpdateSpellBookTooltip')
	-- 펫바 그리드: 구 PetActionBar_ShowGrid 대체 (이벤트가 없으면 가드가 무해하게 삼킴)
	pcall(AB.RegisterEvent, AB, 'PET_UI_UPDATE', 'UpdatePet')
end

if B then
	-- 은행 프레임(98칸)은 로그인 슬라이스 밖(+0.5초)에서 생성 → 가방 생성 부하 절반
	local inBagsInit = false

	do
		local origInit = B.Initialize
		B.Initialize = function(self, ...)
			inBagsInit = true
			E:CallLoadFunc(origInit, self, ...)
			inBagsInit = false
		end
	end

	local origConstruct = B.ConstructContainerFrame
	local function AnchorBank()
		local mover = _G.ElvUIBankMover
		if mover and B.BankFrame then
			B.BankFrame:ClearAllPoints()
			B.BankFrame:Point(mover.POINT or 'BOTTOMLEFT', mover)
		end
	end

	B.ConstructContainerFrame = function(self, name, isBank, ...)
		if isBank and inBagsInit and not B.BankFrame then
			E:Delay(0.5, function()
				if not B.BankFrame then
					B.BankFrame = origConstruct(B, name, isBank)
					AnchorBank()

					-- 지연 생성 과정에서 가방이 은행 자리에 붙는 사고 방지: 제자리 고정
					local bagMover = _G.ElvUIBagMover
					if bagMover and B.BagFrame then
						B.BagFrame:ClearAllPoints()
						B.BagFrame:Point(bagMover.POINT or 'BOTTOMRIGHT', bagMover)
					end
				end
			end)
			return nil
		end

		return origConstruct(self, name, isBank, ...)
	end

	do
		local origOpenBank = B.OpenBank
		B.OpenBank = function(self, ...)
			if not B.BankFrame then -- 0.5초 안에 은행을 여는 극단 케이스: 즉석 생성
				B.BankFrame = origConstruct(B, 'ElvUI_BankContainerFrame', true)
				AnchorBank()
			end
			return origOpenBank(self, ...)
		end
	end

	Bulkhead(B, 'CloseBank') -- 은행 프레임이 아직 없을 때의 닫기 이벤트 가드

	-- 은행 무버가 가방 프레임을 붙잡는 폴백 버그 수정판
	function B:PostBagMove()
		if not E.private.bags.enable then return end

		local x, y = self:GetCenter()
		if not x or not y then return end

		if y > (E.screenHeight * 0.5) then
			self:SetText(self.textGrowDown)
			self.POINT = x > (E.screenWidth * 0.5) and 'TOPRIGHT' or 'TOPLEFT'
		else
			self:SetText(self.textGrowUp)
			self.POINT = x > (E.screenWidth * 0.5) and 'BOTTOMRIGHT' or 'BOTTOMLEFT'
		end

		local isBank = self.name == 'ElvUIBankMover'
		local bagFrame = isBank and B.BankFrame or B.BagFrame
		if not bagFrame then return end

		bagFrame:ClearAllPoints()
		bagFrame:Point(self.POINT, self)
	end
end

-- ------------------------------------------------------------
-- 6. Skins 콜백 블랭킷 격벽: 어떤 스킨이 (구 프레임 참조/워치독으로)
--    죽어도 나머지 스킨은 계속 입혀진다. 에러는 BugSack에 보고됨.
-- ------------------------------------------------------------
if S then
	local function WrapReported(fn)
		return function(...)
			xpcall(fn, geterrorhandler(), ...)
		end
	end

	for index, func in next, S.nonAddonsToLoad do
		if type(func) == 'function' then
			S.nonAddonsToLoad[index] = WrapReported(func)
		end
	end

	for _, object in pairs(S.addonsToLoad) do
		if type(object) == 'table' then
			for k, fn in pairs(object) do
				if type(fn) == 'function' then
					object[k] = WrapReported(fn)
				end
			end
		end
	end
end

-- ------------------------------------------------------------
-- 7. AceAddon 큐 가드: 큐 이음새에 킬이 떨어져도 대기 애드온이
--    통째로 미활성되지 않게 재진입(최대 10회)으로 큐를 소진한다
-- ------------------------------------------------------------
do
	local aceFrame = _G.AceAddon30Frame
	local orig = aceFrame and aceFrame:GetScript('OnEvent')
	if orig and not aceFrame.IberisQueueGuard then
		aceFrame.IberisQueueGuard = true
		aceFrame:SetScript('OnEvent', function(...)
			local tries, ok = 0, false
			repeat
				tries = tries + 1
				ok = xpcall(orig, geterrorhandler(), ...)
			until ok or tries >= 10
		end)
	end
end

-- ------------------------------------------------------------
-- 8. BenikUI 가드: "비활성 그룹 헤더 스킵"과 조합될 때 nil 헤더를
--    무조건 인덱싱하는 BenikUI 유닛프레임 순회들을 격벽 처리
-- ------------------------------------------------------------
do
	local Ace = _G.LibStub and _G.LibStub('AceAddon-3.0', true)
	local BUIaddon = Ace and Ace.GetAddon and Ace:GetAddon('ElvUI_BenikUI', true)
	local Units = BUIaddon and BUIaddon.GetModule and BUIaddon:GetModule('Units', true)
	if Units then
		for _, key in next, {
			'ChangeRaidHealthBarTexture', 'ChangePartyHealthBarTexture',
			'ChangeRaidPowerBarTexture', 'ChangePartyPowerBarTexture',
			'RaidInfoPanelColor', 'PartyInfoPanelColor',
			'PartyShadows', 'RaidShadows', 'UpdateGroupPower',
		} do
			local orig = Units[key]
			if type(orig) == 'function' then
				Units[key] = function(...)
					pcall(orig, ...)
				end
			end
		end
	end
end

-- ------------------------------------------------------------
-- 9. 로그인 후 블리자드 잔재 청소
--    15.18의 숨김 목록(untaint)이 신엔진 프레임 이름을 몰라서 남는 것들.
--    워치독에 잘렸을 경우를 대비해 DisableBlizzard도 한 번 더(멱등 부분만).
-- ------------------------------------------------------------
local function KillBlizzardLeftovers()
	if E.private.actionbar and E.private.actionbar.enable then
		for _, name in next, { 'MainActionBar', 'StanceBar', 'PetActionBar', 'PossessActionBar', 'BagsBar' } do
			local frame = _G[name]
			if frame and frame.UnregisterAllEvents then
				frame:UnregisterAllEvents()
				frame:SetParent(E.HiddenFrame)
			end
		end

		local stbm = _G.StatusTrackingBarManager
		if stbm and stbm.Kill then stbm:Kill() end

		if AB and AB.DisableBlizzard then pcall(AB.DisableBlizzard, AB) end
	end

	if E.private.unitframe and E.private.unitframe.enable then
		local dbf = E.private.unitframe.disabledBlizzardFrames
		if dbf and dbf.castbar then
			for _, name in next, { 'PlayerCastingBarFrame', 'PetCastingBarFrame' } do
				local frame = _G[name]
				if frame and frame.UnregisterAllEvents then
					frame:UnregisterAllEvents()
					frame:SetParent(E.HiddenFrame)
				end
			end
		end

		if UF and UF.DisableBlizzard then pcall(UF.DisableBlizzard, UF) end
	end

	if E.private.general and E.private.general.minimap and E.private.general.minimap.enable then
		local MC = _G.MinimapCluster
		if MC then
			if MC.BorderTop and MC.BorderTop.StripTextures then MC.BorderTop:StripTextures() end
			if MC.ZoneTextButton and MC.ZoneTextButton.Kill then MC.ZoneTextButton:Kill() end
		end
		local clock = _G.TimeManagerClockButton
		if clock and clock.Kill then clock:Kill() end
	end
end

local sweeper = CreateFrame('Frame')
sweeper:RegisterEvent('PLAYER_ENTERING_WORLD')
sweeper:SetScript('OnEvent', function(self)
	self:UnregisterAllEvents()
	E:Delay(3, function() pcall(KillBlizzardLeftovers) end)
end)
