local IUI, E, L = unpack((select(2, ...)))

-- BenikUI 패턴: LoadAddOn → 프로필 namespaces 설정 → SetProfile
-- 키: "서약선".
function IUI:LoadBigWigsProfile()
	local res = IUI:GetProfileData()
	local key = "서약선"
	local font, fontsize = IUI.Font, 11

	pcall(function() LoadAddOn("BigWigs_Options") end)
	pcall(function() LoadAddOn("BigWigs") end)

	if not BigWigs3DB then BigWigs3DB = {} end
	BigWigs3DB.namespaces = BigWigs3DB.namespaces or {}
	BigWigs3DB.profiles   = BigWigs3DB.profiles   or {}

	-- 프로필이 없으면 새 테이블 생성. 있어도 namespaces는 항상 갱신 (barStyle 변경 등 반영)
	BigWigs3DB.profiles[key] = BigWigs3DB.profiles[key] or {}

	-- 글꼴/색상/사이즈 namespaces — 항상 덮어씀
	local function setNs(name, payload)
		local ns = BigWigs3DB.namespaces[name] or { profiles = {} }
		ns.profiles = ns.profiles or {}
		ns.profiles[key] = payload
		BigWigs3DB.namespaces[name] = ns
	end
	setNs("BigWigs_Plugins_Alt Power",       { fontName = font, fontOutline = "", fontsize = fontsize })
	-- BigWigsAnchor_width는 현행 BigWigs에 없는 키(normalWidth로 대체)라 제거
	local bp = res.bigwigs.barsPosition
	setNs("BigWigs_Plugins_Bars", {
		fontName       = font,
		texture        = "BuiFlat",
		barStyle       = "MonoUI",
		normalPosition = { bp[1], bp[2], bp[3], bp[4] },
	})
	setNs("BigWigs_Plugins_Super Emphasize", { fontName = font })
	setNs("BigWigs_Plugins_Messages",        { fontSize = 20, fontName = font })
	local pp = res.bigwigs.proximityPosition
	setNs("BigWigs_Plugins_Proximity", {
		fontSize = 20, fontName = font,
		width = 140, height = 120,
		posx = pp.x, posy = pp.y,
		sound = true,
	})

	-- BossBlock 글로벌 (모든 유저 공유)
	local bb = BigWigs3DB.namespaces["BigWigs_Plugins_BossBlock"] or { global = {} }
	bb.global = bb.global or {}
	bb.global.tableNeedsCopied = false
	BigWigs3DB.namespaces["BigWigs_Plugins_BossBlock"] = bb

	-- InfoBox 위치 — [서약선] 실측 (해상도별)
	local p  = res.bigwigs.infoBoxPosition
	local ib = BigWigs3DB.namespaces["BigWigs_Plugins_InfoBox"] or { profiles = {} }
	ib.profiles = ib.profiles or {}
	ib.profiles[key] = ib.profiles[key] or {}
	ib.profiles[key].position = { p[1], p[2], p[3], p[4] }
	BigWigs3DB.namespaces["BigWigs_Plugins_InfoBox"] = ib

	-- 활성 프로필 전환 (런타임 + SV)
	if _G.BigWigs and _G.BigWigs.db then
		pcall(function() _G.BigWigs.db:SetProfile(key) end)
	else
		-- BigWigs db 미준비 시 SV 직접 매핑 → 다음 로드에서 반영
		BigWigs3DB.profileKeys = BigWigs3DB.profileKeys or {}
		BigWigs3DB.profileKeys[E.myname .. " - " .. E.myrealm] = key
	end
end
