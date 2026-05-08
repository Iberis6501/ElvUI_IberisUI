local IUI, E, L = unpack((select(2, ...)))

function IUI:LoadBigWigsProfile()
	-- AceDB registry에서 BigWigs3DB를 찾아 "서약선" 프로필로 전환 (Reflux 방식)
	-- 키 형식 실측: "Name - Realm" (BigWigs3DB.profileKeys 확인)
	local key = E.myname .. " - " .. E.myrealm

	-- 런타임 전환 시도 (애드온이 이미 로드된 경우)
	local LibStub = _G["LibStub"]
	local AceDB = LibStub and LibStub:GetLibrary("AceDB-3.0", true)
	if AceDB and AceDB.db_registry then
		for db in pairs(AceDB.db_registry) do
			if not db.parent and db.sv == BigWigs3DB then
				pcall(function() db:SetProfile("서약선") end)
				return
			end
		end
	end

	-- fallback: SavedVariables에 직접 기록 (재로드 후 반영)
	if BigWigs3DB then
		BigWigs3DB.profileKeys = BigWigs3DB.profileKeys or {}
		BigWigs3DB.profileKeys[key] = "서약선"
	end
end
