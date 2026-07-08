local _, E = unpack((select(2, ...)))

-- ElvUI 15.18 SLUG 폰트 시스템은 TBC/Mists(앤니버서리 등) 클라에서 CreateFontFamily가
-- 지원되지 않아 폰트 API 전반이 실패한다:
--   • Fonts.lua:83   SetFont bad argument #3  ('SLUG' flag, UpdateBlizzardFonts에서 반복)
--   • CreateFontFamily bad argument #4  (Toolkit FontTemplate → GenerateFontObject 경로)
-- 두 에러의 공통 뿌리는 E:CanFlagSlug — style 뒤에 'SLUG'를 붙이는 순간 위 경로가 터진다.
-- 이 클라들에서 CanFlagSlug를 무력화해 SLUG 경로 자체를 차단한다.
-- ElvUI E:Initialize()(PLAYER_LOGIN)보다 먼저 로드되므로 초기 폰트 생성부터 SLUG가
-- 안 붙어 에러가 발생하지 않는다. fontSlug DB 값은 건드리지 않아 설정/프로필 배포에 무해.
-- Retail은 SLUG가 정상 동작하므로 개입하지 않는다. ElvUI가 클라 호환을 고치면 제거.
if E and (E.TBC or E.Mists) and type(E.CanFlagSlug) == 'function' then
	function E:CanFlagSlug()
		return nil
	end
end
