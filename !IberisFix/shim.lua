-- ============================================================
-- !IberisFix — IberisUI 동봉 선행 shim
--
-- ElvUI 15.18은 파일 로드 시점에 일부 전역 함수를 local로 캡처한다.
-- 1.15.9 신엔진에서 그 전역들이 삭제되어 nil이 캡처되면, 이후 호출에서
-- ElvUI 초기화가 크래시한다. 이 애드온은 '!' 접두사로 ElvUI보다 먼저
-- 로드되어, 없는 전역만 무해한 대체물로 채운다.
--
-- 또한 신엔진에서 삭제된 이벤트(LEARNED_SPELL_IN_TAB 등)를 등록하는
-- ElvUI 라이브러리들의 프레임을 선점 생성해 RegisterEvent를 가드한다.
--
-- 전부 "없을 때만" 정의하므로 구엔진/타 클라이언트에서는 아무 일도
-- 하지 않으며, ElvUI가 신엔진 대응 버전을 내도 그대로 무해하다.
-- 본체 로직은 ElvUI_IberisUI/core/elvui_hotfix_1159.lua 참조.
-- ============================================================

local noop = function() end

-- ------------------------------------------------------------
-- 1. 삭제된 전역 함수 대체 (ElvUI가 local로 캡처하기 전에)
-- ------------------------------------------------------------

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
-- 2. RegisterEvent 가드
--    신엔진에서 삭제된 이벤트 등록 시도를 pcall로 무해화한다.
--    ElvUI 라이브러리들은 자기 파일 로드/OnInitialize 시점(전부
--    IberisUI 로드 전)에 등록하므로 여기서 선점해야 한다.
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

-- 라이브러리 테이블 선점: 동봉 LibStub으로 minor 0 스텁을 만들어
-- 가드된 프레임을 미리 심는다. 진짜 라이브러리는 같은 테이블 위로
-- 업그레이드되며 기존 프레임을 재사용한다(or-패턴).
do
	local LAB = LibStub:NewLibrary('LibActionButton-1.0-ElvUI', 0)
	if LAB then
		LAB.eventFrame = CreateFrame('Frame')
		GuardRegisterEvent(LAB.eventFrame)
	end

	local LD = LibStub:NewLibrary('LibDispel-1.0', 0)
	if LD then
		LD.frame = CreateFrame('Frame')
		GuardRegisterEvent(LD.frame)
	end
end

-- AceEvent 공용 프레임은 Ace3가 로드된 뒤에야 생기므로 ADDON_LOADED마다
-- 시도한다 (ElvUI의 유닛프레임이 OnInitialize에서 AceEvent로 등록하기 전에
-- 반드시 가드가 설치되도록). PLAYER_LOGIN에서 감시 종료.
local function TryInstallGuards()
	GuardRegisterEvent(_G.AceEvent30Frame)

	-- 백업: 어떤 이유로든 선점이 무산됐을 때 실제 라이브러리 프레임에 재시도
	local LAB = LibStub('LibActionButton-1.0-ElvUI', true)
	if LAB and LAB.eventFrame then GuardRegisterEvent(LAB.eventFrame) end

	local LD = LibStub('LibDispel-1.0', true)
	if LD and LD.frame then GuardRegisterEvent(LD.frame) end
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
