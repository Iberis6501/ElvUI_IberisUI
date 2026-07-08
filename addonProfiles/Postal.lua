local IUI, E, L = unpack((select(2, ...)))

-- Postal 거래차단(TradeBlock) 모듈을 끈다.
-- 우편함을 연 동안 들어오는 거래 요청을 자동 차단하는 기능인데, [서약선] 환경 기본은 비활성.
-- Postal은 AceDB(캐릭터별 프로필) 구조 — 현재 캐릭 프로필의 ModuleEnabledState.TradeBlock
-- 만 false로 세팅하고 나머지 Postal 설정(BlackBook 등)은 건드리지 않는다.
-- 재로드 후 반영(다음 Postal 로드 시 이 모듈이 비활성으로 초기화됨).
function IUI:LoadPostalProfile()
	if not Postal3DB then return end  -- Postal 미설치/SV 미로드 시 스킵

	local charKey = UnitName("player") .. " - " .. GetRealmName()
	local profileName = (Postal3DB.profileKeys and Postal3DB.profileKeys[charKey]) or charKey

	Postal3DB.profiles = Postal3DB.profiles or {}
	local prof = Postal3DB.profiles[profileName]
	if not prof then prof = {} Postal3DB.profiles[profileName] = prof end

	prof.ModuleEnabledState = prof.ModuleEnabledState or {}
	prof.ModuleEnabledState.TradeBlock = false
end
