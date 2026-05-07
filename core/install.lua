local IUI, E, L = unpack((select(2, ...)))
local ReloadUI = ReloadUI
local tinsert, wipe = table.insert, table.wipe or wipe
local format = string.format

-- ============================================================
-- Reflux 방식 DeepCopy — 순환 참조 처리 포함
-- ============================================================
local function DeepCopy(t, lookup_table)
	local copy = {}
	if type(t) ~= "table" then return t end
	for i, v in pairs(t) do
		if type(v) ~= "table" then
			copy[i] = v
		else
			lookup_table = lookup_table or {}
			lookup_table[t] = copy
			if lookup_table[v] then
				copy[i] = lookup_table[v]
			else
				copy[i] = DeepCopy(v, lookup_table)
			end
		end
	end
	return copy
end

-- ============================================================
-- Reflux setAceProfile 방식 — AceDB-3.0 db_registry 순회
-- ============================================================
local function SetAllAceProfiles(profileName)
	local LibStub = _G["LibStub"]
	if not LibStub then return end
	local AceDB = LibStub:GetLibrary("AceDB-3.0", true)
	if not (AceDB and AceDB.db_registry) then return end
	for db in pairs(AceDB.db_registry) do
		if not db.parent then
			pcall(function() db:SetProfile(profileName) end)
		end
	end
end

-- ============================================================
-- 이베리스 프로필 적용
-- 1. 서약선 → 이베리스 DeepCopy (ElvDB, ElvPrivateDB)
-- 2. 모든 AceDB 인스턴스를 "이베리스"로 SetProfile
-- 3. 재로드는 InstallComplete()에서 처리
-- ============================================================
local function ApplyIberisProfile()

	-- 서약선 프로필 존재 확인
	if not (ElvDB and ElvDB.profiles and ElvDB.profiles["서약선"]) then
		DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 오류: '서약선' 프로필 없음")
		DEFAULT_CHAT_FRAME:AddMessage("같은 계정에 '서약선' 케릭터가 있어야 합니다.")
		return
	end

	-- ElvDB: 서약선 → 이베리스 복사
	ElvDB.profiles["이베리스"] = DeepCopy(ElvDB.profiles["서약선"])

	-- ElvPrivateDB: 서약선 → 이베리스 복사
	if ElvPrivateDB and ElvPrivateDB.profiles and ElvPrivateDB.profiles["서약선"] then
		ElvPrivateDB.profiles["이베리스"] = DeepCopy(ElvPrivateDB.profiles["서약선"])
	end

	-- 모든 AceDB-3.0 인스턴스를 "이베리스" 프로필로 전환
	SetAllAceProfiles("이베리스")

	DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r '이베리스' 프로필 생성 완료!")
	DEFAULT_CHAT_FRAME:AddMessage("'완료' 버튼을 눌러 재로드하면 적용됩니다.")
	PluginInstallStepComplete.message = IUI.Title .. L["Profile Set"]
	PluginInstallStepComplete:Show()
end

-- ============================================================
-- 외부 애드온 설정 (IsAddOnLoaded 체크 제거 — 글로벌 변수 직접 설정)
-- ============================================================
local addonNames = {}

local function SetupAddons()
	wipe(addonNames)

	local function tryLoad(addonName, loadFn)
		local ok, err = pcall(loadFn)
		if ok then
			tinsert(addonNames, addonName)
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r " .. addonName .. " 오류: " .. tostring(err))
		end
	end

	tryLoad("Details",   function() IUI:LoadDetailsProfile() end)
	tryLoad("MRT",       function() IUI:LoadMRTProfile() end)
	tryLoad("Guidelime", function() IUI:LoadGuidelimeProfile() end)
	tryLoad("HidingBar", function() IUI:LoadHidingBarProfile() end)

	local resultMsg
	if #addonNames > 0 then
		resultMsg = format("|cfffff400적용 완료:|r %s", table.concat(addonNames, ", "))
	else
		resultMsg = "|cffff8000적용 실패 — 오류 확인 후 재시도|r"
	end
	PluginInstallFrame.Desc2:SetText(resultMsg)
	DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r " .. resultMsg)

	PluginInstallStepComplete.message = IUI.Title .. " 애드온 설정 완료"
	PluginInstallStepComplete:Show()
end

local function InstallComplete()
	E.private.install_complete = E.version
	E.private.iberisui.install_complete = IUI.Version
	ReloadUI()
end

-- ============================================================
-- ElvUI Plugin 설치 마법사
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
			PluginInstallFrame.Desc2:SetText("같은 계정의 '서약선' 케릭터 설정을 현재 케릭터에 복사합니다.\n\n|cffff8000팁: 기존 설정을 보존하려면 먼저 새 프로필을 만드세요.|r")
			PluginInstallFrame.Desc3:SetText("계속 버튼을 눌러 다음 단계로 진행하세요.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() InstallComplete() end)
			PluginInstallFrame.Option1:SetText(L["Skip Process"])
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText(L["Layout"])
			PluginInstallFrame.Desc1:SetText("'서약선' 케릭터의 ElvUI 프로필 전체를 현재 케릭터에 복사합니다.")
			PluginInstallFrame.Desc2:SetText("(유닛프레임, 액션바, 채팅패널, 무버, 하단패널 등 모든 설정)")
			PluginInstallFrame.Desc3:SetText(L["Importance: |cff07D400High|r"])
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function()
				local ok, err = pcall(ApplyIberisProfile)
				if not ok then
					DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 적용 오류: " .. tostring(err))
				end
			end)
			PluginInstallFrame.Option1:SetText(L["Apply Iberis Profile"])
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetText("외부 애드온 프로필")
			PluginInstallFrame.Desc1:SetText("Details, MRT, Guidelime, HidingBar 설정을 적용합니다.")
			PluginInstallFrame.Desc2:SetText("(로드 여부 관계없이 저장 변수에 직접 기록)")
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
			PluginInstallFrame.Desc1:SetText("채팅 창 이름·메시지 종류를 설정하고\n전리품 창을 오른쪽 채팅패널에 임베드합니다.")
			PluginInstallFrame.Desc2:SetText("|cffff8000이 설정은 '완료' 버튼의 UI 재로드 후 완전히 적용됩니다.|r")
			PluginInstallFrame.Desc3:SetText("중요도: |cffD3CF00보통|r")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function()
				local ok, err = pcall(function() IUI:SetupChatWindows() end)
				if not ok then
					DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r 채팅 오류: " .. tostring(err))
				end
			end)
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
