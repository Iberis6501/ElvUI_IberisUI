local IUI, E, L = unpack((select(2, ...)))

local function AddOptions()
	local config = E.Options.args.plugins.args
	config["IberisUI"] = {
		order = 100,
		type = "group",
		name = IUI.Title,
		args = {
			header = {
				order = 1,
				type = "header",
				name = IUI.Title .. " v" .. (IUI.Version or "1.00"),
			},
			info = {
				order = 2,
				type = "description",
				name = "이베리스(Iberis) 개인 프로필 애드온입니다.\n'서약선' 케릭터의 ElvUI 설정을 기반으로 제작되었습니다.\n\n슬래시 명령어: /iberisui",
			},
			spacer = {
				order = 3,
				type = "description",
				name = " ",
			},
			reinstall = {
				order = 4,
				type = "execute",
				name = "설치 마법사 다시 실행",
				desc = "IberisUI 설치 마법사를 다시 엽니다.",
				func = function()
					IUI:SetupIberisUI()
				end,
			},
		},
	}
end

tinsert(IUI.Config, AddOptions)
