-- enUS fallback: koKR.lua가 먼저 로드되므로 이미 Engine.L이 있으면 건너뜀
local addon, Engine = ...
if Engine.L then return end

Engine.L = {
	["Welcome to IberisUI version %s, for ElvUI %s."] = "Welcome to IberisUI version %s, for ElvUI %s.",
	["Skip Process"] = "Skip Process",
	["Apply Iberis Profile"] = "Apply Iberis Profile",
	["Profile Set"] = "Profile Set",
	["Layout"] = "Layout",
	["Importance: |cff07D400High|r"] = "Importance: |cff07D400High|r",
	["Installation Complete"] = "Installation Complete",
	["Finished"] = "Finished",
	["Installed"] = "Installed",
}
