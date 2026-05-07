# ElvUI_IberisUI

ElvUI + BenikUI 기반의 이베리스 개인 프로필 세팅 애드온입니다.  
서약선(펜구스의 흉포) 케릭터의 설정을 기반으로 제작되었습니다.

## 요구사항

- [ElvUI](https://tukui.org/elvui) (v15.05 이상)
- [ElvUI_BenikUI](https://www.tukui.org/addons.php?id=benikui) (v2.41 이상)

## 사용 방법

1. `Interface/AddOns/` 폴더에 설치
2. 게임 접속 시 설치 마법사 자동 실행
3. **"이베리스 프로필 적용"** 버튼 클릭 → UI 재로드
4. 이후 `/iberisui` 명령어로 마법사 재실행 가능

## 적용 설정 목록

| 항목 | 내용 |
|------|------|
| 폰트 | Expressway (일반), Bui Visitor1 (네임플레이트) |
| 유닛프레임 | 플레이어/타겟 255×55, InfoPanel 22px, 커스텀 텍스트 포함 |
| 데이터바 | Reputation/Experience 세로 9px 바, BuiFlat 텍스처 |
| 채팅 | 패널 너비 348px, 높이 166px |
| 네임플레이트 | Bui Visitor1 폰트, BuiFlat 상태바 |
| 무버 | 40여 개 프레임 위치 일괄 적용 |
| 미니맵 | 크기 150, 위치 텍스트 숨김 |
| BuiMiddleDTPanel | LDB_ItemRack, AtlasLoot 등 구성 |

---

## 작업 내역

### 2026-05-07

- **v1.00** 최초 제작
  - `ElvUI_BenikUI` 구조를 참고하여 애드온 기본 골격 구성
  - `서약선 - 펜구스의 흉포` 케릭터의 ElvUI 프로필 데이터 기반으로 `install.lua` 작성
  - 설치 마법사 3단계 구성 (환영 → 프로필 적용 → 완료)
  - `/iberisui` 슬래시 명령어 등록
  - ElvUI 옵션 패널에 IberisUI 탭 추가
  - AceLocale 대신 단순 Lua 테이블 방식으로 한국어 로케일 처리
  - GitHub 저장소 연동 (`main` 브랜치)
