local E, L, V, P, G = unpack(ElvUI)
local EP = LibStub("LibElvUIPlugin-1.0")
local addon, Engine = ...
local GetAddOnMetadata = C_AddOns.GetAddOnMetadata

local IUI = E.Libs.AceAddon:NewAddon(addon, "AceConsole-3.0", "AceEvent-3.0")

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
