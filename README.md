# ElvUI_IberisUI

ElvUI + BenikUI 기반의 이베리스 개인 프로필 세팅 애드온입니다.  
서약선(펜구스의 흉포) 케릭터의 설정을 기반으로 제작되었습니다.

## 요구사항

- [ElvUI](https://tukui.org/elvui) (v15.05 이상)
- [ElvUI_BenikUI](https://www.tukui.org/addons.php?id=benikui) (v2.41 이상)

## 사용 방법

1. `Interface/AddOns/` 폴더에 설치
2. 게임 접속 시 설치 마법사 자동 실행 (5단계)
3. 이후 `/iberisui` 명령어로 마법사 재실행 가능

## 설치 마법사 단계

| 단계 | 내용 |
|------|------|
| 1. 시작 | 환영 화면, 건너뛰기 옵션 |
| 2. 레이아웃 | ElvUI 전체 프로필 적용 (유닛프레임, 액션바, 무버 등) |
| 3. 외부 애드온 | 지원 애드온 자동 감지 후 설정 적용 |
| 4. 채팅 창 | 창 이름·메시지 종류 설정, 개인 채널(애옹·추추) 제외 |
| 5. 완료 | UI 재로드 |

## 적용 설정 목록

### ElvUI
| 항목 | 내용 |
|------|------|
| 폰트 | Expressway (일반), Bui Visitor1 (네임플레이트) |
| 유닛프레임 | 플레이어/타겟 255×55, InfoPanel 22px, 커스텀 텍스트 포함 |
| 데이터바 | Reputation/Experience 세로 9px 바, BuiFlat 텍스처 |
| 채팅 패널 | 너비 348px, 높이 166px |
| 네임플레이트 | Bui Visitor1 폰트, BuiFlat 상태바 |
| 무버 | 40여 개 프레임 위치 일괄 적용 |
| 미니맵 | 크기 150, 위치 텍스트 숨김 |
| BuiMiddleDTPanel | LDB_ItemRack, AtlasLoot 등 구성 |

### 외부 애드온
| 애드온 | 적용 내용 |
|--------|-----------|
| **Details** | 스킨(ElvUI Frame Style), 상태바, run_code 등 표시 설정 |
| **MRT** | Note 창 설정, MarksBar 위치, CDs 서약선 프로필(전문화별 쿨타임), InviteTool |
| **Guidelime** | 창 높이, 단계 표시 옵션 |
| **HidingBar** | 현재 케릭터명으로 프로필 이름 설정 |
| **LFGBulletinBoard** | TBC 레이드/던전 필터 설정 (SSC, BT, Kara 등) |

### 채팅 창
| 창 | 이름 | 주요 메시지 |
|----|------|------------|
| 1 | 일반 | 일반·귓속말·파티·레이드·길드·채널 등 전체 |
| 2 | 기록 | 경험치·명예·스킬 등 전투 정보 (숨김) |
| 3 | 음성 대화 설정 | 음성 텍스트 (숨김) |
| 4 | 전리품 / 거래 요청 | 아이템 획득·골드·스킬 |
| 5 | 길드&파티 | 길드·파티·레이드·귓속말 |
| 6 | 거래 | 기본 (숨김) |

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

- **v1.01** 외부 애드온 프로필 및 채팅 창 설정 추가
  - `addonProfiles/` 디렉터리 신설: Pawn, ItemRack, HidingBar, LFGBulletinBoard, FindParty
  - `core/chat.lua` 신설: 채팅 창 5개 구성, 메시지 그룹 초기화 후 재설정
  - 개인 채널(애옹·추추) 제외, 파티찾기·LookingForGroup 유지
  - 설치 마법사 3단계 → 5단계로 확장 (외부 애드온·채팅 창 단계 추가)

- **v1.02** 외부 애드온 프로필 교체
  - Pawn, ItemRack, FindParty 제거
  - Details, MRT, Guidelime 추가
  - MRT: Note 창, MarksBar, CDs 서약선 프로필(전문화별 쿨타임), InviteTool
  - Details: ElvUI Frame Style 스킨, 상태바, run_code 설정
  - Guidelime: 창 높이·단계 표시 옵션

- **v1.03** 버그 수정 및 해상도 대응
  - **옵션 패널**: `E.Options.args.plugins.args` → `E.Options.args.iberisui` (최상위)로 수정, ElvUI 좌측 사이드바에 IberisUI 탭 표시
  - **프로필 미적용 수정**: `E.private.iberisui` nil 크래시 수정, install_complete 기본값 false로 변경
  - **FHD/QHD 해상도 대응**: UIScale 해상도별 자동 계산 + 모든 mover 좌표를 SM() 함수로 비율 스케일링
    - FHD(1080p): UIScale 0.711 (기준)
    - QHD(1440p): UIScale 0.5334, mover ×1.778
    - 기타 해상도: 비율 자동 계산
