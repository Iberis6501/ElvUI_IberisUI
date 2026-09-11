# CLAUDE.md — ElvUI_IberisUI

> Claude Code가 이 디렉토리에서 시작할 때 자동으로 읽는 컨텍스트 파일.

## 프로젝트 개요

`ElvUI_IberisUI` — 이베리스의 [서약선] 캐릭터 ElvUI/BenikUI 환경을 원클릭으로 복제 배포하는 WoW 애드온. 5개 클라이언트 동시 지원 (`Mainline`/`Mists`/`Wrath`/`TBC`/`Vanilla`).

- 작성자: Iberis (GitHub: Iberis6501)
- 라이선스: All Rights Reserved
- CurseForge: https://www.curseforge.com/wow/addons/iberisui

## 의존성 정책

- **`RequiredDeps`는 `ElvUI, ElvUI_BenikUI` 둘만**. 5개 TOC 전부 동일.
- 다른 외부 애드온 (BigWigs/Details/MRT/HidingBar/InvenRaidFrames3/Questie/ShamanPower/TacoTip/Guidelime/Postal) 은 **선택적** — 설치 안 돼있어도 IberisUI 자체는 무해하게 로드되어야 함.
- 외부 애드온 통합 패턴: **SV 테이블에 프로필 미리 박기** (함수 호출 X, nil 가드 + pcall). 외부 애드온이 나중에 설치되면 자기 SV 읽으면서 자연스럽게 적용.
- 함수 호출이 필요한 곳 (BigWigs `:SetProfile`, Details `:ApplyProfile`) 은 `if _G.X` 가드 + `pcall` 이중 보호.

## 폰트 정책 (v2.32~)

- 폰트 이름은 리터럴 대신 `IUI.Font` / `IUI.PixelFont` (init.lua) 사용. 한/중 클라는 LSM 내장 로케일 기본 폰트(`기본 글꼴` 등), 서양/러시아 클라는 `Expressway` / `Bui Visitor1`.
- 이유: ElvUI·BenikUI·Details 폰트는 한/중 클라에서 LSM 등록이 거부돼 이름이 비어 있음 → 다른 애드온이 같은 이름으로 라틴 전용 폰트를 선등록하면(LSM은 선등록 우선) 한글이 □로 깨짐. LSM 내장 이름은 라이브러리 로드 시 선등록되므로 선점 불가.
- 대상은 **ElvUI/BenikUI가 지정하는 폰트만** (`IUI.LatinFonts` 목록, 마법사 1단계 `fillLocaleFonts`가 P/V/G 기본값까지 커버). 블리자드 기본 폰트(`데미지 글꼴`, `Friz Quadrata TT`, `Fonts\2002.ttf` 경로)와 Details 자체 폰트(`FORCED SQUARE`)는 건드리지 않음.
- Details verbatim 프로필(`_DetailsSeoyaksun.lua`)은 원본 유지, 적용 시 `replaceFont`로 `"Expressway"`만 치환.

## 디렉토리 구조

```
ElvUI_IberisUI/
├── ElvUI_IberisUI_{Mainline,Mists,Wrath,TBC,Vanilla}.toc  멀티 클라이언트 TOC
├── init.lua                          ElvUI plugin 진입점
├── core/                             핵심 로직
│   ├── load_core.xml                 로드 순서 정의 (compat.lua 최우선)
│   ├── compat.lua                    제거된 API 호환 shim
│   ├── core.lua, install.lua, options.lua, chat.lua, resolutions.lua
├── addonProfiles/                    외부 애드온 프로필 주입 (선택 의존성)
├── defaults/                         프로필 데이터
├── locales/                          한/영 문자열
├── media/                            README 표시용 로고 (.pkgmeta에서 패키지 제외)
└── assets/                           ← 별도 private repo (.gitignore로 추적 제외)
```

## 호환 shim 정책 (`core/compat.lua`)

- 외부 애드온(Postal, Guidelime 등)이 BfA/Dragonflight에서 제거된 전역 API를 직접 호출해 nil 에러를 내는 경우, 여기에 alias 또는 no-op 스텁을 추가한다.
- **반드시 조건부**: `if _G[name] == nil and 새API` 처럼 가드. Vanilla Era처럼 전역이 살아있는 클라이언트에서 덮어쓰지 않도록.
- 현재 처리된 케이스:
  - 컨테이너 API 17개 (`GetContainerItemID` 등) → `C_Container.*`로 alias
  - `InterfaceAddOnsList_Update` → no-op 스텁 (Guidelime 옵션창 토글)
  - `DebuffTypeColor` / `DebuffTypeSymbol` → FrameXML 원본 값으로 복원 (KR Classic 2.5.6에서 제거, InvenRaidFrames3·LibRealDispel-1.0 로드 실패 대응)
  - `VMRT.ExCD2.gnGUIDs` → Retail 한정 빈 테이블 선초기화 (MRT Inspect 핸들러 nil 에러 대응)
- 로드 순서: `core/load_core.xml`에서 **가장 먼저** 로드되어야 함.

## 커밋 / 릴리스 규칙

- 커밋 메시지: `type: 한글 제목 (선택 한글 부연)` 형식. 작은 단위로 분리. type 예: `fix`, `feat`, `chore`, `docs`.
- 버전 bump는 **별도 chore 커밋**으로 분리 (`chore: bump version to vX.YY (...)`). 코드 변경과 섞지 않음.
- 5개 TOC `## Version` 동시 갱신 필수.
- 태그 푸시 (`git tag vX.YY && git push origin vX.YY`) → GitHub Actions가 GitHub Releases + CurseForge 자동 배포.

## 개발 환경 (이 PC / 집 PC 공통)

- 레포 클론 위치: `D:\GoogleDrive\개인\게임\와우\ElvUI_IberisUI\` (양 PC 동일 — 구글드라이브 미러 안)
- 각 클라이언트 `_<client>_\Interface\AddOns\ElvUI_IberisUI` 는 위 클론 폴더로 **mklink /J 정션** 연결. 코드 수정 즉시 `/reload`로 반영.
- VS Code에서 직접 작업.
- 인증: `gh auth login` (HTTPS + Git Credential Manager). Iberis6501 계정.

## 비공개 보조 자산 (assets/)

`assets/` 는 별도 **private repo** `Iberis6501/ElvUI_IberisUI-assets` 로 관리. public repo의 `.gitignore`에 등록됨. 상세는 `assets/CLAUDE.md` 참조 (집 PC에서도 해당 private repo를 clone해야 함).
