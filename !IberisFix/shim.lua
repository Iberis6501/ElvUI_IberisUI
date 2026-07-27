-- ============================================================
-- !IberisFix — IberisUI 동봉 선행 shim
--
-- ElvUI 15.18은 파일 로드 시점에 일부 전역 함수를 local로 캡처한다.
-- 1.15.9 신엔진에서 그 전역들이 삭제되어 nil이 캡처되면, 이후 호출에서
-- ElvUI 초기화가 크래시한다. 이 애드온은 '!' 접두사로 ElvUI보다 먼저
-- 로드되어, 없는 전역만 무해한 대체물로 채운다.
--
-- 전부 "없을 때만" 정의하므로 구엔진/타 클라이언트에서는 아무 일도
-- 하지 않으며, ElvUI가 신엔진 대응 버전을 내도 그대로 무해하다.
-- 본체 로직은 ElvUI_IberisUI/core/elvui_hotfix_1159.lua 참조.
-- ============================================================

local noop = function() end

-- 캐스트바: 신엔진은 PlayerCastingBarFrame 믹스인 체계 (구 전역 함수 삭제됨)
if not CastingBarFrame_SetUnit then CastingBarFrame_SetUnit = noop end
if not CastingBarFrame_OnLoad then CastingBarFrame_OnLoad = noop end
if not PetCastingBarFrame_OnLoad then PetCastingBarFrame_OnLoad = noop end

-- 펫바/자동시전 반짝임: 신엔진은 AutoCastOverlay 체계
if not AutoCastShine_AutoCastStart then AutoCastShine_AutoCastStart = noop end
if not AutoCastShine_AutoCastStop then AutoCastShine_AutoCastStop = noop end
if not PetActionBar_ShowGrid then PetActionBar_ShowGrid = noop end
if not PetActionBar_HideGrid then PetActionBar_HideGrid = noop end
if not PetActionBar_UpdateCooldowns then PetActionBar_UpdateCooldowns = noop end

-- ------------------------------------------------------------
-- RegisterEvent 가드: 신엔진에서 삭제된 이벤트(LEARNED_SPELL_IN_TAB 등)
-- 등록 시도를 pcall로 무해화. ElvUI 유닛프레임은 자기 ADDON_LOADED
-- 시점(OnInitialize, IberisUI 로드 전)에 등록하므로, ElvUI_Libraries가
-- 로드되는 즉시(=ElvUI 파일 로드 전) 여기서 가드를 설치해야 한다.
-- ------------------------------------------------------------
local function GuardRegisterEvent(frame)
	if not frame or frame.IberisREGuard then return end
	frame.IberisREGuard = true
	local orig = frame.RegisterEvent
	frame.RegisterEvent = function(f, event, ...)
		local ok = pcall(orig, f, event, ...)
		return ok
	end
end

local function TryInstallGuards()
	GuardRegisterEvent(_G.AceEvent30Frame)

	local LibStub = _G.LibStub
	if LibStub then
		local LAB = LibStub('LibActionButton-1.0-ElvUI', true)
		if LAB then
			LAB.eventFrame = LAB.eventFrame or CreateFrame('Frame')
			GuardRegisterEvent(LAB.eventFrame)
		end

		local LD = LibStub('LibDispel-1.0', true)
		if LD then
			LD.frame = LD.frame or CreateFrame('Frame') -- 선생성해 가드 (lib는 있으면 재사용)
			GuardRegisterEvent(LD.frame)
		end
	end
end

local watcher = CreateFrame('Frame')
watcher:RegisterEvent('ADDON_LOADED')
watcher:RegisterEvent('PLAYER_LOGIN')
watcher:SetScript('OnEvent', function(self, event)
	TryInstallGuards()
	if event == 'PLAYER_LOGIN' then
		self:UnregisterAllEvents()
	end
end)
