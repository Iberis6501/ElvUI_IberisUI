local E, L, V, P, G = unpack(ElvUI)
local EP = LibStub("LibElvUIPlugin-1.0")
local addon, Engine = ...
local GetAddOnMetadata = C_AddOns.GetAddOnMetadata

local IUI = E.Libs.AceAddon:NewAddon(addon, "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")

Engine[1] = IUI
Engine[2] = E
-- Engine.L은 locales/koKR.lua 또는 enUS.lua에서 이미 설정됨
Engine[3] = Engine.L or {}
_G[addon] = Engine

IUI.Config = {}
IUI.Title = format("|cffff9900%s|r|cffffffff%s|r ", "Iberis", "UI")
IUI.Version = GetAddOnMetadata(addon, "Version")
IUI.Erelease = tonumber(GetAddOnMetadata(addon, "X-ElvuiVersion"))
IUI.Eversion = tonumber(E.version)

-- 폰트 이름. BenikUI 설치 기본값(Expressway / Bui Visitor1)은 ElvUI·BenikUI가 서양·러시아 로케일에만
-- LSM 등록하므로 한/중 클라에선 이름이 비어 있고, 다른 애드온이 같은 이름으로 라틴 전용 폰트를 먼저
-- 등록하면(LSM은 선등록 우선) 한글이 □로 깨진다. 한/중 클라는 LSM이 라이브러리 로드 시 직접 등록하는
-- 로케일 기본 폰트 이름을 써서 선점 자체를 막는다 (koKR: "기본 글꼴" = 원래 폴백되던 Fonts\2002.TTF라 외형 동일).
local CJK = { koKR = true, zhCN = true, zhTW = true }
local LSM = E.Libs.LSM
local localeFont = CJK[GetLocale()] and LSM and LSM.DefaultMedia and LSM.DefaultMedia.font
IUI.LocaleFont = localeFont  -- 서양/러시아 클라에선 nil
IUI.Font       = localeFont or "Expressway"
IUI.PixelFont  = localeFont or "Bui Visitor1"

-- ElvUI(SharedMedia.lua)·BenikUI(media/sharedmedia.lua)가 등록하는 라틴 전용 폰트 이름.
-- 한/중 클라에서 LSM 등록이 거부돼 이름이 비어 있는 것들 (선점 대상). "Invisible"은 글자 숨김 용도라 제외.
IUI.LatinFonts = {
	["Action Man"] = true, ["Continuum Medium"] = true, ["Die Die Die!"] = true,
	["PT Sans Narrow"] = true, ["Expressway"] = true, ["Homespun"] = true,
	["Bui Prototype"] = true, ["Bui PrototypeRU"] = true, ["Bui Visitor1"] = true, ["Bui Visitor2"] = true,
	["Bui Tukui"] = true, ["Bui Kait"] = true, ["Bui ArialN"] = true, ["Bui Homizio"] = true, ["Bui FiraBold"] = true,
}

function IUI:AddOptions()
	for _, func in pairs(IUI.Config) do
		func()
	end
end

function IUI:Init()
	if IUI.Eversion < 1 or (IUI.Eversion < IUI.Erelease) then
		E:Delay(2, function()
			E:StaticPopup_Show("IBERISUI_VERSION_MISMATCH")
		end)
		return
	end
	self.initialized = true
	self:Initialize()
	EP:RegisterPlugin(addon, self.AddOptions)
end

E.Libs.EP:HookInitialize(IUI, IUI.Init)

E.PopupDialogs["IBERISUI_VERSION_MISMATCH"] = {
	text = format(
		"%s\n\nElvUI 버전 %.2f 이(가) IberisUI와 호환되지 않습니다.\n최소 필요 버전: %.2f\nhttps://tukui.org/elvui 에서 업데이트하세요.",
		IUI.Title,
		IUI.Eversion or 0,
		IUI.Erelease or 0
	),
	button1 = CLOSE,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}
