local IUI, E, L = unpack((select(2, ...)))
-- _DetailsSeoyaksun.lua (먼저 로드)에서 Engine.SeoyaksunDetailsProfile 정의
local Engine = select(2, ...)

-- BenikUI ApplyProfile 패턴: 프로필을 _detalhes_global.__profiles["서약선"]에 통째로 박고
-- _detalhes:ApplyProfile("서약선") 호출 → 모든 인스턴스/스킨/제목바/바 스타일 자동 적용.
-- 위치만 [서약선] 실측값으로 덮어씀 (해상도 분기 위해).

local function deepCopy(t)
	if type(t) ~= "table" then return t end
	local r = {}
	for k, v in pairs(t) do r[k] = deepCopy(v) end
	return r
end

local function applyInstancePosition(i, cfg)
	if not _detalhes or not cfg then return end
	local inst
	pcall(function() inst = _detalhes:GetInstance(i) end)
	if not inst then return end
	pcall(function()
		inst.libwindow       = inst.libwindow or {}
		inst.libwindow.point = cfg.point
		inst.libwindow.x     = cfg.x
		inst.libwindow.y     = cfg.y
		inst.libwindow.scale = 1
		if inst.RestoreLibWindow then inst:RestoreLibWindow() end
	end)
end

function IUI:LoadDetailsProfile()
	local res = IUI:GetResolutionData()

	if not _detalhes_global then _detalhes_global = {} end

	-- 1. [서약선] 프로필을 _detalhes_global.__profiles["서약선"]에 통째로 박기
	if Engine.SeoyaksunDetailsProfile then
		_detalhes_global.__profiles = _detalhes_global.__profiles or {}
		_detalhes_global.__profiles["서약선"] = deepCopy(Engine.SeoyaksunDetailsProfile)
	end

	-- 2. 메모리 + SV 모두에 local_instances_config 박기
	-- LoadLocalInstanceConfig는 Details.local_instances_config (메모리 변수)를 읽음.
	-- ApplyProfile이 호출되기 전에 메모리 변수에 박아야 모드 적용됨.
	-- _detalhes_database (캐릭별 SV)에도 박아 다음 reload 보존.
	if not _detalhes_database then _detalhes_database = {} end
	_detalhes_database.profile_name = "서약선"

	local function buildInstanceConfig(cfg)
		return {
			modo               = cfg.modo,
			mode               = cfg.modo,
			attribute          = cfg.attribute,
			sub_attribute      = cfg.sub,
			segment            = cfg.segment,
			last_raid_plugin   = cfg.raidPlugin,
			horizontalSnap     = false,
			verticalSnap       = false,
			isLocked           = true,
			is_open            = true,
			snap               = {},
			sub_atributo_last  = { 1, 1, 1, 1, 1 },
			pos = {
				normal = {
					x = cfg.posX, y = cfg.posY,
					w = cfg.posW or 188, h = cfg.posH or 147,
				},
				solo = { x = 1, y = 2, w = 300, h = 200 },
			},
		}
	end

	-- 메모리 변수 (Details.local_instances_config) — ApplyProfile 호출 시 즉시 사용됨
	if _detalhes then
		_detalhes.local_instances_config = _detalhes.local_instances_config or {}
		for i = 1, 4 do
			_detalhes.local_instances_config[i] = buildInstanceConfig(res.details.instances[i])
		end
	end

	-- SV (다음 reload용)
	_detalhes_database.local_instances_config = _detalhes_database.local_instances_config or {}
	for i = 1, 4 do
		_detalhes_database.local_instances_config[i] = buildInstanceConfig(res.details.instances[i])
	end

	-- 3. 글로벌 SV: 캐릭터 → 프로필 매핑
	_detalhes_global.__char_profiles = _detalhes_global.__char_profiles or {}
	_detalhes_global.__char_profiles[E.myname .. "-" .. E.myrealm] = "서약선"

	-- 4. 런타임에 프로필 적용 — 위 local_instances_config가 LoadLocalInstanceConfig로 자동 적용
	if _detalhes and _detalhes.ApplyProfile then
		pcall(function() _detalhes:ApplyProfile("서약선") end)
	end

	-- 5. 4개 인스턴스 위치를 해상도별 [서약선] 좌표로 덮어씀
	-- (프로필 import 후 LibWindow 좌표를 우리 해상도 데이터로 강제)
	for i = 1, 4 do
		applyInstancePosition(i, res.details.instances[i])
	end
	if E and E.Delay then
		E:Delay(1.0, function()
			for i = 1, 4 do
				applyInstancePosition(i, res.details.instances[i])
			end
		end)
	end

	DEFAULT_CHAT_FRAME:AddMessage("|cffff9900IberisUI|r Details — [서약선] 프로필 import + 위치 적용 완료.")
end
