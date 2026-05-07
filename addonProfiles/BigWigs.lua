local IUI, E, L = unpack((select(2, ...)))

-- BigWigs/Details AceDB 프로필을 "서약선"으로 전환 (Reflux setAceProfile 방식)
-- BigWigs3DB, BigWigs4DB 등 특정 SavedVariable에 바인딩된 AceDB만 대상으로 함
local function switchAddonProfile(svName, profileName)
	local LibStub = _G["LibStub"]
	if not LibStub then return false end
	local AceDB = LibStub:GetLibrary("AceDB-3.0", true)
	if not (AceDB and AceDB.db_registry) then return false end

	-- SavedVariable 글로벌 이름 → 테이블 매핑
	local function findSvName(sv)
		for k, v in pairs(_G) do
			if v == sv then return k end
		end
		return nil
	end

	local switched = false
	for db in pairs(AceDB.db_registry) do
		if not db.parent then
			local name = findSvName(db.sv)
			if name == svName then
				pcall(function() db:SetProfile(profileName) end)
				switched = true
			end
		end
	end
	return switched
end

function IUI:LoadBigWigsProfile()
	-- BigWigs3DB (BigWigs 3.x) / BigWigs4DB (BigWigs 4.x)
	local ok = switchAddonProfile("BigWigs3DB", "서약선")
	if not ok then switchAddonProfile("BigWigs4DB", "서약선") end
end

function IUI:LoadDetailsAddonProfile()
	-- Details는 _detalhes_global (plain table, account-wide)
	-- 계정 내 모든 케릭이 동일한 설정을 공유하므로 서약선과 이미 동일함
	-- 추가로 AceDB 백엔드가 있다면 프로필 전환 시도
	switchAddonProfile("detalhes_global_db", "서약선")
	switchAddonProfile("DetailsDB", "서약선")
end
