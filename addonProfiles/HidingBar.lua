local IUI, E, L = unpack((select(2, ...)))

-- [서약선] 프로필 verbatim
-- 출처: WTF/Account/CGS7315/SavedVariables/HidingBar.lua (188~412 라인)
-- 신규 유저 환경에서도 동작하도록 프로필 객체를 통째로 박는다.
local SeoyaksunProfile = {
	["config"] = {
		["addFromDataBroker"] = true,
		["mbtnSettings"] = {
			["LibDBIcon10_LFGBulletinBoard"]      = { ["tstmp"] = 1772802157 },
			["LibDBIcon10_ItemRack"]              = { ["tstmp"] = 1778164447 },
			["FP_Minimap_Button"]                 = { ["tstmp"] = 1778164447 },
			["ElvUI_MinimapClickHandler"]         = { ["tstmp"] = 1771074728 },
			["LibDBIcon10_Guidelime"]             = { true, ["tstmp"] = 1778164447 },
			["InvenRaidFrames3MapButton"]         = { ["tstmp"] = 1778164447 },
			["LibDBIcon10_SavedClassic"]          = { true, ["tstmp"] = 1778164447 },
			["LibDBIcon10_Leatrix_Plus"]          = { ["tstmp"] = 1778164447 },
			["LibDBIcon10_NovaWorldBuffs"]        = { false, ["tstmp"] = 1778164447 },
			["LibDBIcon10_BugSack"]               = { ["tstmp"] = 1778164447 },
			["LibDBIcon10_Leatrix_Maps"]          = { ["tstmp"] = 1778164447 },
			["LibDBIcon10_AtlasLoot"]             = { ["tstmp"] = 1778164447 },
			["LibDBIcon10_ShamanPower"]           = { ["tstmp"] = 1778164447 },
			["MSB_MinimapButton"]                 = { ["tstmp"] = 1772801161 },
			["LibDBIcon10_MethodRaidTools"]       = { false, ["tstmp"] = 1778164447 },
			["LibDBIcon10_iWillRemember_MinimapButton"] = { ["tstmp"] = 1778164447 },
			["LibDBIcon10_LoonBestInSlot"]        = { ["tstmp"] = 1774619893 },
			["LibDBIcon10_BIS-TBC"]               = { ["tstmp"] = 1778164447 },
			["LibDBIcon10_BigWigs"]               = { true, ["tstmp"] = 1778164447 },
			["LibDBIcon10_DetailsStreamer"]       = { true, ["tstmp"] = 1778164447 },
			["LibDBIcon10_WeakAuras"]             = { ["tstmp"] = 1778164447 },
			["LibDBIcon10_Questie"]               = { ["tstmp"] = 1778164447 },
			["LibDBIcon10_Details"]               = { false, ["tstmp"] = 1778164447 },
			["LibDBIcon10_PoisonCharges"]         = { ["tstmp"] = 1774621131 },
		},
		["btnSettings"] = {
			["LFGBulletinBoard"]   = { true, ["tstmp"] = 1772802157 },
			["InvenRaidFrames3"]   = { true, ["tstmp"] = 1778164447 },
			["NWB"]                = { true, ["tstmp"] = 1778164447 },
			["HidingBar"]          = { true, ["tstmp"] = 1778164447 },
			["GatherMate2"]        = { true, ["tstmp"] = 1778164447 },
			["BIS-TBC"]            = { true, ["tstmp"] = 1778164447 },
			["BigWigs"]            = { true, ["tstmp"] = 1778164447 },
			["ItemRack"]           = { true, ["tstmp"] = 1778164447 },
			["AtlasLoot"]          = { true, ["tstmp"] = 1778164447 },
			["FindParty"]          = { true, ["tstmp"] = 1778164447 },
			["PoisonCharges"]      = { true, ["tstmp"] = 1774621131 },
			["WeakAuras"]          = { true, ["tstmp"] = 1778164447 },
			["MRT"]                = { true, ["tstmp"] = 1778164447 },
		},
		["grabMinimap"]       = true,
		["grabMinimapAfterN"] = 1,
		["customGrabList"]    = {},
		["ombGrabQueue"]      = {},
		["ignoreMBtn"]        = { "GatherMatePin" },
	},
	["name"] = "서약선",
	["bars"] = {
		{
			["isDefault"] = true,
			["config"] = {
				["lineWidth"]              = 4,
				["secondPosition"]         = -109.119943071775,
				["rangeBetweenBtns"]       = 0,
				["lineBorderColor"]        = { 1, 1, 1, 1 },
				["showDelay"]              = 0,
				["bgTexture"]              = "Solid",
				["borderColor"]            = { 1, 1, 1, 1 },
				["anchor"]                 = "right",
				["lineTexture"]            = "Solid",
				["barTypePosition"]        = 1,
				["size"]                   = 15,
				["interceptTooltipPosition"] = 0,
				["petBattleHide"]          = true,
				["lineColor"]              = { 0.8, 0.6, 0 },
				["position"]               = 656.5999888181686,  -- 해상도별 LoadHidingBarProfile 진입 시 덮어씀
				["mbtnPosition"]           = 2,
				["lineBorderEdge"]         = false,
				["lineBorderOffset"]       = 1,
				["showHandler"]            = 2,
				["expand"]                 = 2,
				["borderEdge"]             = false,
				["bgColor"]                = { 0.1, 0.1, 0.1, 0.7 },
				["hideDelay"]              = 0.75,
				["gapSize"]                = 0,
				["interceptTooltip"]       = true,
				["buttonDirection"]        = { ["V"] = 0, ["H"] = 0 },
				["borderOffset"]           = 4,
				["omb"]                    = {
					["distanceToBar"]   = 0,
					["size"]            = 31,
					["fadeOpacity"]     = 1,
					["anchor"]          = "right",
					["barDisplacement"] = 0,
					["canGrabbed"]      = false,
					["hide"]            = true,
				},
				["buttonSize"]             = 31,
				["frameStrata"]            = 2,
				["lineBorderSize"]         = 2,
				["lock"]                   = false,
				["fadeOpacity"]            = 0.2,
				["orientation"]            = 0,
				["barOffset"]              = 2,
				["hideHandler"]            = 2,
				["borderSize"]             = 16,
			},
			["name"] = "Bar 1",
		},
	},
}

-- 깊은 복사 (HidingBar 런타임이 프로필 데이터를 직접 수정할 수 있으므로
-- 모듈 간 공유 상태가 되지 않도록 항상 새 테이블을 SV에 넣는다)
local function deepCopy(t)
	if type(t) ~= "table" then return t end
	local r = {}
	for k, v in pairs(t) do r[k] = deepCopy(v) end
	return r
end

function IUI:LoadHidingBarProfile()
	local res = IUI:GetProfileData()
	if not HidingBarDB then HidingBarDB = {} end
	HidingBarDB.profiles = HidingBarDB.profiles or {}

	-- 좌표를 SeoyaksunProfile 사본에 주입
	local profile = deepCopy(SeoyaksunProfile)
	if profile.bars and profile.bars[1] and profile.bars[1].config then
		profile.bars[1].config.position       = res.hidingBar.barPosition
		profile.bars[1].config.secondPosition = res.hidingBar.secondPosition
	end

	-- 기존 "서약선" 프로필이 있으면 덮어쓰고, 없으면 추가
	local idx
	for i, p in ipairs(HidingBarDB.profiles) do
		if p.name == "서약선" then idx = i; break end
	end
	if idx then
		HidingBarDB.profiles[idx] = profile
	else
		table.insert(HidingBarDB.profiles, profile)
	end

	-- 캐릭터별 활성 프로필 지정
	if not HidingBarDBChar then HidingBarDBChar = {} end
	HidingBarDBChar.currentProfileName = "서약선"
end
