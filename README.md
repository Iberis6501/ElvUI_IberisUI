# ElvUI_IberisUI

<p align="center">
  <img src="https://raw.githubusercontent.com/Iberis6501/ElvUI_IberisUI/main/media/logo_512.png" width="256" alt="IberisUI logo" />
</p>

> A one-click installer that replicates Iberis's complete ElvUI/BenikUI UI — including pre-configured profiles for BigWigs, Details, MRT, and more — across Retail and all Classic clients.
>
> 이베리스의 [서약선] 캐릭터 ElvUI/BenikUI 환경을 그대로 복제 배포하는 애드온. 본섭부터 모든 클래식 클라이언트까지 지원.

&nbsp;

---

## Greetings

Hi, I'm **서약선 (Iberis)**, the author who shares the IberisUI addon.

It's been a while since the last update! I currently play only on the **20th Anniversary TBC server**, so testing on Retail and other Classic clients is a bit limited. That said, since this addon only modifies frame layouts and profiles, you shouldn't run into any major errors.

The previously cumbersome installation has been **simplified**. It now installs just like ElvUI.

> 💡 Current build is based on **ElvUI 15.13**.
>
> ⚠️ Always **back up** your settings before applying any addon. ^^

&nbsp;

---

## Recommended Setup

This addon was built and tested on **3840×2160 (4K UHD) with UIScale 0.7**.

UIScale multiplies every pixel, so the layout is designed to work at other resolutions, but the intended look is most accurate at the reference setup.

&nbsp;

---

## Notes

1. If you see minor errors, type `/console scriptErrors 0` in chat.
2. If action bars are missing, update through the **CurseForge App**.
3. **[ElvUI](https://tukui.org/elvui) and [ElvUI_BenikUI](https://www.curseforge.com/wow/addons/benikui) are required.**
4. When reporting issues, please reproduce with **only ElvUI, BenikUI, and IberisUI enabled** — it makes the cause much easier to identify.

&nbsp;

---

## Supported Clients

| Client | Folder | TOC |
|---|---|---|
| Retail | `_retail_` | `ElvUI_IberisUI_Mainline.toc` |
| Mists Classic | `_classic_` | `ElvUI_IberisUI_Mists.toc` |
| Wrath Classic | `_wrath_` | `ElvUI_IberisUI_Wrath.toc` |
| TBC Anniversary | `_anniversary_` | `ElvUI_IberisUI_TBC.toc` |
| Classic Era / SoD | `_classic_era_` | `ElvUI_IberisUI_Vanilla.toc` |

&nbsp;

---

## Requirements

- **[ElvUI](https://tukui.org/elvui)** v15.13+
- **[ElvUI_BenikUI](https://www.curseforge.com/wow/addons/benikui)** v2.41+

> ⚠️ IberisUI **does not include** ElvUI or BenikUI. They must be installed separately.

&nbsp;

---

## Installation

Install the required dependencies first, then install IberisUI.

### Step 1: Install ElvUI
ElvUI is a required dependency and is distributed through its [official site](https://tukui.org/elvui) (not available on CurseForge). Please follow the installation instructions provided there.

### Step 2: Install BenikUI + IberisUI

**CurseForge App (Recommended)**
- Search for **`BenikUI`** → Install
- Search for **`IberisUI`** → Install

**Manual install**
1. Download the zips for [BenikUI](https://www.curseforge.com/wow/addons/benikui) and [IberisUI](https://www.curseforge.com/wow/addons/iberisui)
2. Extract into `Interface/AddOns/`

The IberisUI setup wizard runs automatically on first login. You can re-run it later via `/iberisui`.

&nbsp;

---

## Setup Wizard

| Step | Description |
|---|---|
| 1. UI Scale | Apply ElvUI profile in one click (UIScale 0.7 baseline) |
| 2. External addons | Auto-detect installed addons → apply profiles |
| 3. Chat frames | Left = General/Community tabs, Right = Loot chat |
| 4. Done | UI reload |

&nbsp;

---

## Applied Profiles

### ElvUI
- Fonts: Expressway / Bui Visitor1
- Unit frames: Player/Target 255×55, InfoPanel 22px, custom text
- Databars: 9px vertical bars, BuiFlat texture
- Chat: 348×166 panels
- Movers: ~40 frames repositioned

### External Addons
| Addon | Type | Applied Profile |
|---|---|---|
| **[BigWigs](https://www.curseforge.com/wow/search?search=bigwigs)** | Raid alerts | MonoUI bar layout |
| **[Details](https://www.curseforge.com/wow/search?search=details+damage+meter)** | Damage meter | ElvUI Frame Style skin, 4-window layout (Threat / Healing / Damage / Total) |
| **[InvenRaidFrames3](https://www.curseforge.com/wow/addons/inven-raid-frame)** | Raid frames | 서약선 raid layout |
| **[MRT](https://www.curseforge.com/wow/addons/method-raid-tools)** | Raid helper | Note window, MarksBar enabled, CDs profile (per-spec cooldowns), InviteTool |
| **[HidingBar](https://www.curseforge.com/wow/addons/hidingbar)** | Minimap button organizer | Per-character profile |
| **[Questie](https://www.curseforge.com/wow/addons/questie)** | Quest helper | Enabled |
| **[ShamanPower](https://www.curseforge.com/wow/addons/shamanpower)** | Shaman helper | Enabled |
| **[TacoTip](https://www.curseforge.com/wow/addons/tacotip-gearscore-talents)** | Tooltip addon | Enabled |

&nbsp;

---

## Known Issues

- The author primarily plays on **TBC Anniversary (20th anniversary server)**, so testing on **Retail / MoP Classic / Classic Era** is limited. Please report any issues you find via the bug tracker linked at the bottom of the page.
- The ElvUI install wizard is auto-skipped, and **your existing ElvUI profile will be overwritten** by the IberisUI profile — back up first if you want to preserve your current setup.
- Chat frame (ChatFrame1/4) positions are hard-locked against external changes. **This is intentional.**

&nbsp;

---

## Credits

This addon depends on and runs on top of the following projects:

- **[ElvUI](https://github.com/tukui-org/ElvUI)** — Elv & Tukui team
- **[ElvUI_BenikUI](https://www.curseforge.com/wow/addons/benikui)** — Benik

The project structure (multi-client TOC pattern, install wizard pattern) was inspired by ElvUI_BenikUI.

Source code from these projects is **not included** in this distribution.

&nbsp;

---

## License

**All Rights Reserved.** See [LICENSE](LICENSE).

You may freely use IberisUI and modify it for personal use. Redistributing or republishing any part of this addon outside of the [official GitHub repository](https://github.com/Iberis6501/ElvUI_IberisUI) and the [official CurseForge page](https://www.curseforge.com/wow/addons/iberisui) is **not permitted**.

ElvUI and ElvUI_BenikUI are governed by their own licenses.

&nbsp;

---

## 인사말

**이베리스 UI** 공유해드리고 있는 **서약선**이라고 합니다.

정말 오랜만에 업데이트해서 글 올립니다. ㅎㅎ

현재는 **20주년 불성기념서버** 에서만 플레이하고 있어서, 본섭과 클래식 서버 쪽은 오류 체크가 어렵습니다.

근데 프레임 구조만 변경하는 애드온이라서 별다른 에러는 없을 거예요.

그리고 그 동안 좀 번거롭던 설치 과정을 아주 **심플하게 변경**했습니다. ElvUI 설치하듯이 작업하시면 됩니다.

> 💡 현재 버전은 **ElvUI 15.13** 기준입니다.
>
> ⚠️ 애드온 적용 전에는 **반드시 백업**하는 습관을 가지세요. ^^

&nbsp;

---

## 권장 환경

본 애드온은 **3840×2160 (4K UHD), UIScale 0.7** 환경에서 제작/테스트되었습니다.

UIScale이 모든 픽셀에 곱해지므로 다른 해상도에서도 동일하게 동작하도록 설계됐지만, 기준 환경에서 가장 의도된 모습을 보여줍니다.

&nbsp;

---

## 주의사항

1. 사소한 에러가 발생할 경우 채팅창에 `/console scriptErrors 0`을 입력해주세요.
2. 액션바가 안 보이는 분들은 **CurseForge App**을 통해 업데이트 진행하시면 됩니다.
3. **반드시 [ElvUI](https://tukui.org/elvui) 와 [ElvUI_BenikUI](https://www.curseforge.com/wow/addons/benikui) 가 필요합니다.**
4. 버그 리포트 시에는 **ElvUI / BenikUI / IberisUI만 켜고 재현**해주시면 원인 파악이 빠릅니다.

&nbsp;

---

## 지원 클라이언트

| 클라이언트 | 폴더 | TOC |
|---|---|---|
| 본섭 (Retail) | `_retail_` | `ElvUI_IberisUI_Mainline.toc` |
| 판다 (Mists Classic) | `_classic_` | `ElvUI_IberisUI_Mists.toc` |
| 리치왕 (Wrath Classic) | `_wrath_` | `ElvUI_IberisUI_Wrath.toc` |
| 불성 (TBC Anniversary) | `_anniversary_` | `ElvUI_IberisUI_TBC.toc` |
| 오리지널 / 디스커버리 (Classic Era / SoD) | `_classic_era_` | `ElvUI_IberisUI_Vanilla.toc` |

&nbsp;

---

## 요구사항

- **[ElvUI](https://tukui.org/elvui)** v15.13+
- **[ElvUI_BenikUI](https://www.curseforge.com/wow/addons/benikui)** v2.41+

> ⚠️ IberisUI는 ElvUI와 BenikUI를 **포함하지 않습니다**. 별도로 먼저 설치하세요.

&nbsp;

---

## 설치

필수 의존성을 먼저 설치하고, 그 다음 IberisUI를 설치하세요.

### 1단계: ElvUI 설치
ElvUI는 필수 의존성이며, [공식 ElvUI 사이트](https://tukui.org/elvui)에서 배포됩니다 (CurseForge에는 없음). 해당 사이트의 안내에 따라 설치해주세요.

### 2단계: BenikUI + IberisUI 설치

**CurseForge App (추천)**
- CurseForge App에서 **`BenikUI`** 검색 → 설치
- CurseForge App에서 **`IberisUI`** 검색 → 설치

**수동 설치**
1. [BenikUI](https://www.curseforge.com/wow/addons/benikui)와 [IberisUI](https://www.curseforge.com/wow/addons/iberisui) 각각의 zip을 다운로드
2. `Interface/AddOns/`에 압축 해제

게임 첫 접속 시 IberisUI 설치 마법사가 자동 실행됩니다. 이후 `/iberisui` 명령어로 재실행 가능.

&nbsp;

---

## 설치 마법사

| 단계 | 내용 |
|---|---|
| 1. UI 스케일 | 단일 버튼으로 ElvUI 프로필 일괄 적용 (UIScale 0.7 기준) |
| 2. 외부 애드온 | 설치된 외부 애드온 자동 감지 → 프로필 적용 |
| 3. 채팅창 | 좌측 일반/커뮤니티 탭, 우측 전리품 채팅창 구성 |
| 4. 완료 | UI 리로드 |

&nbsp;

---

## 적용 프로필

### ElvUI
- 폰트: Expressway / Bui Visitor1
- 유닛프레임: Player/Target 255×55, InfoPanel 22px, 커스텀 텍스트
- 데이터바: 9px 세로 바, BuiFlat 텍스처
- 채팅: 348×166 패널
- 무버: 40여 개 프레임 일괄 재배치

### 외부 애드온
| 애드온 | 종류 | 적용 프로필 |
|---|---|---|
| **[BigWigs](https://www.curseforge.com/wow/search?search=bigwigs)** | 레이드 경보 | MonoUI 바 레이아웃 |
| **[Details](https://www.curseforge.com/wow/search?search=details+damage+meter)** | 데미지 미터기 | ElvUI Frame Style 스킨, 4창 구성 (위협수준 / 치유 / 피해 / 총합) |
| **[InvenRaidFrames3](https://www.curseforge.com/wow/addons/inven-raid-frame)** | 공격대 창 | 서약선 레이드 레이아웃 |
| **[MRT](https://www.curseforge.com/wow/addons/method-raid-tools)** | 공격대 도우미 | Note 창, MarksBar 사용, CDs 프로필 (전문화별 쿨타임), InviteTool |
| **[HidingBar](https://www.curseforge.com/wow/addons/hidingbar)** | 미니맵 버튼 정렬 | 캐릭터별 프로필 |
| **[Questie](https://www.curseforge.com/wow/addons/questie)** | 퀘스트 도우미 | 활성화 |
| **[ShamanPower](https://www.curseforge.com/wow/addons/shamanpower)** | 주술사 도우미 | 활성화 |
| **[TacoTip](https://www.curseforge.com/wow/addons/tacotip-gearscore-talents)** | 툴팁 애드온 | 활성화 |

&nbsp;

---

## 알려진 제약

- 현재 **불성(20주년 기념서버)** 을 메인으로 플레이 중이므로, **본섭(Retail) / 판다(MoP Classic) / 오리지널(Classic Era)** 환경에서의 미세한 오류 검증이 다소 부족할 수 있습니다. 발견 시 페이지 하단 링크의 버그 리포트로 알려주세요.
- ElvUI 설치 마법사가 자동 스킵됩니다. **기존 ElvUI 프로필이 IberisUI 프로필로 덮어써집니다** — 기존 설정을 보존하려면 적용 전 백업하세요.
- 채팅창(ChatFrame1/4) 위치는 외부 코드의 변경을 즉시 차단(hard-lock)합니다. **의도된 동작**입니다.

&nbsp;

---

## 크레딧

이 애드온은 다음 제작자분들의 작업물에 의존하며, 그 위에서 동작합니다:

- **[ElvUI](https://github.com/tukui-org/ElvUI)** — Elv & Tukui team
- **[ElvUI_BenikUI](https://www.curseforge.com/wow/addons/benikui)** — Benik

프로젝트 구조(멀티 클라이언트 TOC 패턴, 설치 마법사 패턴)는 ElvUI_BenikUI에서 영감을 받았습니다.

두 프로젝트의 소스 코드는 본 배포물에 포함되지 않습니다.

&nbsp;

---

## 라이선스

**All Rights Reserved.** [LICENSE](LICENSE) 참조.

IberisUI를 자유롭게 사용하시고 사적인 용도의 수정은 가능합니다. 다만 본 애드온의 일부 또는 전체를 [공식 GitHub 저장소](https://github.com/Iberis6501/ElvUI_IberisUI)와 [공식 CurseForge 페이지](https://www.curseforge.com/wow/addons/iberisui) 외의 곳에 재배포·재게시하는 것은 허용되지 않습니다.

ElvUI와 ElvUI_BenikUI는 각자의 라이선스를 따릅니다.

&nbsp;

---

## Links / 링크

- **GitHub:** https://github.com/Iberis6501/ElvUI_IberisUI
- **CurseForge:** https://www.curseforge.com/wow/addons/iberisui
- **Bug Reports / Issues / 버그 리포트:** https://github.com/Iberis6501/ElvUI_IberisUI/issues

&nbsp;

---

## 작업 내역 / Changelog

### v2.19 (2026-05-24)
- ElvUI player/target buffs/debuffs `priority` 필터 비활성화 (`""`) — 모든 버프/디버프 표시
- MRT 공격대 생존기(ExCD2) 프로필 추가: 활성화 + 수동 등록 스킬 3종(33206/1044/12043) + 즐겨찾기/색상 매핑/컬럼 설정
- InvenRaidFrames3 `enableClassBuff=false` (`_InvenRaidSeoyaksun.lua`)

### v2.18 (2026-05-23)
- MRT 공격대 마크 바(MarksBar) 기본 비활성화 (`enabled=false`)

### v2.17 (2026-05-23)
- 유닛프레임 player/target aurabar(클래스타이머 막대) 비활성화 — 아이콘 buff/debuff 표시로 통일
- player/target debuffs 표시 + 정렬 갱신 (`perrow=10, numrows=5`)
- target buffs/debuffs `clickThrough=true`
- InvenRaidFrames3 소환수 프레임 위치 미세 조정 + 가로 칸 수 `20 → 13`

### v2.14 (2026-05-19)
- **AdditionalPower(드루이드 변신 마나바) 위치/크기 갱신** (`core/install.lua`, `core/resolutions.lua`) — 마법사 재실행 시 반영:
  - AdditionalPowerMover anchor: `BOTTOMLEFT,491,288` → `BOTTOM,-222,333`
  - classAdditional 모양: 가로 `width 255` → 세로 `VERTICAL 15x78` (`enable`/`frameLevel=2` 명시)
  - ([연약선] 드루이드 실측. Default 프로필 공유라 서약선/연약선 등 모든 [-약선] 캐릭터에 동일 적용)

### v2.13 (2026-05-18)
- **드루이드 변신 시 추가 마나바 표시 fix** (`core/core.lua`):
  - ElvUI Classic 계열에서 `AdditionalPower` element의 `displayPairs`가 비어 있어 곰형/표범형 변신 중 마나바가 oUF visibility 검사에서 자동으로 숨겨지던 현상 해소
  - `UF:Configure_ClassBar` hook으로 매 호출마다 `UF.ALT_POWER_INFO`를 backfill + 이미 만들어진 player frame에 즉시 주입 + `ForceUpdate`
  - 매 로그인마다 자동 적용 (마법사 재실행 불필요)
- **Guidelime 창 크기 갱신** (`addonProfiles/Guidelime.lua`) — 마법사 재실행 시 반영:
  - mainFrameWidth: 350 → 359.65
  - mainFrameHeight: 400 → 311.62
  - ([연약선] 실측값)

### v2.12 (2026-05-17)
- **InvenRaidFrames3 메인 공격대 위치 정밀화** (`core/resolutions.lua`):
  - [이베링] 본섭 실측 anchor 좌표 반영 + 불성 기념일 클라이언트 px 추가 보정
- **본섭(Retail) LDB 슬롯 분기 + aurabar 슬롯/높이/오프셋 조정** (`core/install.lua`) — 마법사 재실행 시 반영
- **LDB/HidingBar 프로필 RaidBook → IberisRaidAuction 교체** (`core/install.lua`, `addonProfiles/HidingBar.lua`):
  - GDKP 장부 애드온을 자체 fork ([IberisRaidAuction](https://github.com/Iberis6501/IberisRaidAuction)) 로 전환
  - `BuiMiddleDTPanel[2]` LDB 슬롯 + HidingBar 미니맵 아이콘 자동 hide 목록 갱신
  - 마법사 재실행 시 반영
- **InvenRaidFrames3 [서약선] grouporder 기본 순서로 복귀** (`addonProfiles/_InvenRaidSeoyaksun.lua`) — 마법사 재실행 시 반영
- **`/iui testbars N` 슬래시 명령 추가** (`core/core.lua`):
  - `/iui` 를 `/iberisui` 별칭으로 등록 + aurabar 정렬 테스트용 가짜 바 N개 생성
- **표현 통일 (docs)**: 'IberisUI 애드온' → '이베리스 UI' (`README.md`)

### v2.11 (2026-05-13)
- **ChatFrame5("커뮤니티") 흰 배경 + region oldAlpha nil 에러 차단** (`core/chat.lua`, `core/core.lua`):
  - `FCF_FadeOutChatFrame`이 ChatFrame 본체의 oldAlpha뿐 아니라 region 객체(`Background`/`TopLeftTexture` 등 9개)의 oldAlpha도 순회 → 이전 v2.08 fix는 본체만 처리해서 region nil 에러 재발
  - 새 함수 `IUI:ApplyChatFadeFix()` — 모든 ChatFrame + 9개 region oldAlpha=1 초기화 + ChatFrame5는 region 텍스처 `SetTexture(nil)` + `SetAlpha(0)`로 흰 배경 노출 차단
  - `IUI:Initialize()`에서 즉시 + 1초 지연 두 번 호출 → ChatFrame5가 SV 복원된 후에도 재적용. 매 로그인마다 자동 적용 (마법사 재실행 불필요)
- **[서약선] 프로필 ElvUI 설정 대량 추가** (`core/install.lua`) — 마법사 재실행 시 반영:
  - 액션바 재사용 대기시간 폰트 18 → 12 (`cooldown.actionbar.fontSize`)
  - 플레이어 버프 활성: 한 줄 10개 × 최대 2줄, 24px 아이콘, 본인이 안 건 버프 + 영구 버프(축복/오라 등) 모두 표시 (`player.buffs.*`)
  - 대상 버프 동일 사이즈/줄/필터 설정 (`target.buffs.*`)
  - 플레이어/대상 디버프 아이콘 끔 — classtimer로만 표시 (`player.debuffs.enable`, `target.debuffs.enable = false`)
  - 플레이어/대상 classtimer(aurabar) 활성: 강화효과(buffs) 위 attach, 본인+남이 건 디버프 모두 표시 (`player.aurabar.*`, `target.aurabar.*`)
  - 대상 우상단 CC 강조 큰 아이콘 element 끔 (`target.auras.enable = false`) — 본인이 건 디버프가 missing-texture 분홍 사각형으로 노출되던 현상 해소
  - 이름표 우측 CC 강조 element 끔 (ENEMY_NPC/ENEMY_PLAYER/FRIENDLY_PLAYER `auras.enable = false`)
- **기존 유저 안내**: ElvUI 설정 항목은 마법사 재실행해야 [서약선] 프로필 기준으로 새로 박힘. 다만 유저가 직접 커스텀한 ElvUI 설정이 있다면 마법사 재실행 시 해당 키가 [서약선] 기본값으로 덮어써짐 — 마법사 재실행 여부는 유저 선택. 채팅창 fix(`core/chat.lua`, `core/core.lua`)는 매 로그인마다 자동 적용되므로 마법사 재실행 불필요.

### v2.10 (2026-05-12)
- 서약선 캐릭터 게임 내 설정 변경 반영:
  - **InvenRaidFrames3 [서약선] 프로필** (`addonProfiles/_InvenRaidSeoyaksun.lua`):
    - `grouporder = {5,6,7,8,1,2,3,4}` 추가 (공격대 그룹 순서 — 전 클라이언트 공통)
    - `border = false` 추가 (Retail 한정 효과 — Anniversary 기본값이 이미 false라 무해)
    - `lock = false` (잠금 해제)
    - `enableSpellTimer = true` (주문 타이머 활성)
  - **MRT MarksBar** (`addonProfiles/MRT.lua`):
    - `enabled = true` — 징표바 사용으로 전환 (기존 false)
    - Retail 한정 `Show[3] = false` — 징표 기둥 표시 끔 (Anniversary는 그대로 켜둠)

### v2.09 (2026-05-12)
- Retail(Midnight) 전용 호환 패치 — Anniversary/TBC/Wrath/Vanilla 동작 영향 없음:
  - **InvenRaidFrames3 프로필 적용 수정**: Retail 빌드는 `InvenRaidFrames3DB.profileKeys["<player> - <realm>"]` 만 읽도록 변경됨. 기존 `CharDB.profile_Xm` 박기는 무시되어 [서약선] 프로필이 적용 안 되던 문제 해소 (`addonProfiles/InvenRaidFrames3.lua`)
  - **MRT `VMRT.ExCD2.gnGUIDs` nil 에러 우회**: Midnight 클라이언트에서 MRT의 ExCD2 ADDON_LOADED가 `if ExRT.isMN then return end`로 early-return하면서 `gnGUIDs` 초기화 코드를 건너뛰는데, INSPECT_READY 핸들러는 같은 가드가 없어 인스펙트 시마다 `attempt to perform indexed assignment on field 'gnGUIDs' (a nil value)` 발생. MRT 로드 시 우리 쪽에서 빈 테이블 미리 박음 (`core/compat.lua`)

### v2.08 (2026-05-11)
- ChatFrame5("커뮤니티") 페이드 아웃 시 `oldAlpha` nil 에러 방지:
  - Blizzard `FCF_FadeOutChatFrame`이 `max(GetAlpha, chatFrame.oldAlpha)` 호출 시 nil 인자
  - `oldAlpha`는 `ChatFrame_OnEnter`에서 처음 세팅 — 마우스 진입 전 fade 트리거 시 누락
  - `SetupChatWindows` 마지막에 모든 `ChatFrame.oldAlpha = 1` 안전망 추가
- 로드/업데이트 안내 메시지 추가:
  - 채팅창에 IberisUI 버전 자동 출력 (첫 로드 / 업데이트 / 동일 버전 3분기 자동 감지)
  - 업데이트 분기: "버전 X 로드됨 (이전: vY)" + 변경 사항 링크 표시
  - CurseForge 링크는 클릭 가능 hyperlink — 클릭 시 URL 입력박스 다이얼로그 (Ctrl+C 복사)

### v2.07 (2026-05-11)
- 외부 애드온 호환 shim 추가 (`core/compat.lua`):
  - BfA 이후 제거된 컨테이너 API 17개를 `C_Container.*`에서 전역으로 alias — Postal 등 구버전 애드온의 `GetContainerItemID` 등 nil 호출 해소
  - `InterfaceAddOnsList_Update` no-op 스텁 — Guidelime 옵션창 토글 시 발생하던 nil 호출 해소

### v2.06 (2026-05-10)
- RAID_WARNING(공격대 경보) sticky 채널 자동 설정:
  - WoW 기본은 `/경보` 한 번 보내면 다음 엔터 시 SAY로 자동 복귀 (sticky 아님)
  - `IUI:ApplyStickyChannels()` 추가 — `ChatTypeInfo.RAID_WARNING.sticky = 1`
  - `IUI:Initialize()`에서 매 로그인마다 호출 (ChatTypeInfo는 세션마다 reset됨)
  - `IUI:SetupChatWindows()`에서도 즉시 적용

### v2.05 (2026-05-10)
- 서약선 캐릭터 게임 내 변경 사항 반영:
  - HidingBar 프로필: bar `size` 15 → 20
  - HidingBar 프로필: `LibDBIcon10_RaidBook` mbtnSetting 추가
  - BuiMiddleDTPanel 슬롯 2: `LDB_iWillRemember_MinimapButton` → `LDB_RaidBook`

### v2.04 (2026-05-10)
- CurseForge 모더레이션 정책 추가 대응:
  - 영문/한글 `## Links` 섹션 두 개 → 페이지 최하단 통합 `## Links / 링크` 한 곳으로 (cross-hosting 링크는 페이지 하단 위치 정책 준수)
  - Installation Step 1 — ElvUI 다운로드 imperative 톤 다운 ("Download directly..." → "is distributed through its official site")
  - Known Issues — 인라인 GitHub Issues 링크 제거, 하단 Links 섹션 참조로 변경

### v2.03 (2026-05-10)
- README/CurseForge Description 영문 우선 구조로 재편 (CurseForge 모더레이션 정책 대응 — 영문이 페이지 최상단에 위치)
- `# English` / `# 한국어 / Korean` 두 섹션으로 본문 분리, 각 섹션은 자기 언어로 완결
- 기존에 한글만 있던 인사말/요구사항/설치/마법사/적용 프로필/크레딧/라이선스/링크 영문 버전 신규 작성

### v2.02 (2026-05-10)
- 한글 우선 톤으로 README/Description 재작성, 와우인벤 스타일 인사말 포함
- 권장 환경(4K UHD + UIScale 0.7) 명시
- 알려진 제약 솔직하게 표기 (검증 부족 클라이언트, 마법사 덮어쓰기, 채팅 hard-lock)
- 외부 애드온 표에 한글 종류 표기 추가 (BigWigs=레이드 경보, Details=데미지 미터기 등)
- ElvUI 호환 버전 표기 v15.05 → v15.13
- BenikUI 링크 GitHub(404) → CurseForge로 정정
- WowUp 언급 제거 (CurseForge App만 안내)
- 설치 안내 정확화: ElvUI는 Tukui.org에서 별도 설치 (CF에 없음), BenikUI/IberisUI는 CF에서 각각 설치
- "작자" → "제작자" 표기 통일

### v2.01 (2026-05-10)
- CI: CurseForge 자동 업로드 시크릿 이름 매칭 수정 (v2.00 빌드는 GitHub Release에만 발행되고 CurseForge에는 누락됨)

### v2.00 (2026-05-10)
- 첫 CurseForge 정식 배포
- 본섭/판다/불성/오리지널/디스커버리 5개 클라이언트 동시 지원
- BigWigs MonoUI 바 프로필 추가
- 본섭 BenikUI Databars nil 인덱싱 에러 차단
- ChatFrame 위치 hard-lock (외부 코드의 위치 변경 즉시 차단)
- Details/InvenRaidFrames3 프로필을 SV에서 자동 추출 → verbatim 박음
- 단일 `IUI.Profile` 테이블 (해상도 분기 제거 — UIScale 0.7이 모든 픽셀에 곱해짐)

### v1.x (2026-05-07 ~)
초기 v1.0~1.03 개발 기록은 [git log](https://github.com/Iberis6501/ElvUI_IberisUI/commits/main)에서 확인.
