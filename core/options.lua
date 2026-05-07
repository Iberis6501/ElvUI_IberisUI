local IUI, E, L = unpack((select(2, ...)))

local function AddOptions()
	-- BenikUI와 동일하게 E.Options.args 최상위에 추가
	E.Options.args.iberisui = {
		order = 7,
		type = "group",
		name = IUI.Title,
		childGroups = "tree",
		args = {
			header = {
				order = 1,
				type = "header",
				name = format("%s |cffffa500v%s|r", IUI.Title, IUI.Version or "1.00"),
			},
			info = {
				order = 2,
				type = "description",
				name = "이베리스(Iberis) 개인 프로필 애드온\n'서약선' 케릭터의 ElvUI 설정 기반\n\n슬래시 명령어: |cffffa500/iberisui|r",
				fontSize = "medium",
			},
			spacer = {
				order = 3,
				type = "header",
				name = "",
			},
			install = {
				order = 4,
				type = "execute",
				name = "설치 마법사 실행",
				desc = "IberisUI 설치 마법사를 엽니다.",
				func = function()
					IUI:SetupIberisUI()
					E:ToggleOptions()
				end,
			},
		},
	}
end

tinsert(IUI.Config, AddOptions)
