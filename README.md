# ElvUI_IberisUI

<p align="center">
  <img src="https://raw.githubusercontent.com/Iberis6501/ElvUI_IberisUI/main/assets/logo_512.png" width="256" alt="IberisUI logo" />
</p>

> 이베리스의 [서약선] 캐릭터 ElvUI/BenikUI 환경을 그대로 복제 배포하는 애드온. 본섭부터 모든 클래식 클라이언트까지 지원.
>
> A one-click installer that replicates Iberis's complete ElvUI/BenikUI UI — including pre-configured profiles for BigWigs, Details, MRT, and more — across Retail and all Classic clients.

---

## 인사말

이베리스 애드온 공유해드리고 있는 **서약선**이라고 합니다.

정말 오랜만에 업데이트해서 글 올립니다. ㅎㅎ

현재는 **20주년 불성기념서버** 에서만 플레이하고 있어서, 본섭과 클래식 서버 쪽은 오류 체크가 어렵습니다.

근데 프레임 구조만 변경하는 애드온이라서 별다른 에러는 없을 거예요.

그리고 그 동안 좀 번거롭던 설치 과정을 아주 **심플하게 변경**했습니다. ElvUI 설치하듯이 작업하시면 됩니다.

> 💡 현재 버전은 **ElvUI 15.13** 기준입니다.
>
> ⚠️ 애드온 적용 전에는 **반드시 백업**하는 습관을 가지세요. ^^

---

## 권장 환경 / Recommended Setup

본 애드온은 **3840×2160 (4K UHD), UIScale 0.7** 환경에서 제작/테스트되었습니다.

UIScale이 모든 픽셀에 곱해지므로 다른 해상도에서도 동일하게 동작하도록 설계됐지만, 기준 환경에서 가장 의도된 모습을 보여줍니다.

> Designed and tested on **3840×2160 (4K UHD) with UIScale 0.7**. Other resolutions should work but may differ slightly from the intended layout.

---

## 주의사항 / Notes

1. 사소한 에러가 발생할 경우 채팅창에 `/console scriptErrors 0`을 입력해주세요.
2. 액션바가 안 보이는 분들은 **CurseForge App**을 통해 업데이트 진행하시면 됩니다.
3. **반드시 [ElvUI](https://tukui.org/elvui) 와 [ElvUI_BenikUI](https://www.curseforge.com/wow/addons/benikui) 가 필요합니다.**
4. 버그 리포트 시에는 **ElvUI / BenikUI / IberisUI만 켜고 재현**해주시면 원인 파악이 빠릅니다.

(When reporting issues, please reproduce with only ElvUI, BenikUI, and IberisUI enabled.)

---

## 지원 클라이언트 / Supported Clients

| 클라이언트 | 폴더 | TOC |
|---|---|---|
| 본섭 (Retail) | `_retail_` | `ElvUI_IberisUI_Mainline.toc` |
| 판다 (Mists Classic) | `_classic_` | `ElvUI_IberisUI_Mists.toc` |
| 리치왕 (Wrath Classic) | `_wrath_` | `ElvUI_IberisUI_Wrath.toc` |
| 불성 (TBC Anniversary) | `_anniversary_` | `ElvUI_IberisUI_TBC.toc` |
| 오리지널 / 디스커버리 (Classic Era / SoD) | `_classic_era_` | `ElvUI_IberisUI_Vanilla.toc` |

## 요구사항 / Requirements

- **[ElvUI](https://tukui.org/elvui)** v15.13+
- **[ElvUI_BenikUI](https://www.curseforge.com/wow/addons/benikui)** v2.41+

> ⚠️ IberisUI는 ElvUI와 BenikUI를 **포함하지 않습니다**. 별도로 먼저 설치하세요.
>
> ⚠️ IberisUI **does not include** ElvUI or BenikUI. They must be installed separately.

## 설치 / Installation

필수 의존성을 먼저 설치하고, 그 다음 IberisUI를 설치하세요.

### 1단계: ElvUI 설치 (Tukui.org)
ElvUI는 **CurseForge에 없습니다**. [tukui.org/elvui](https://tukui.org/elvui)에서 직접 다운로드 후 `Interface/AddOns/`에 압축 해제하세요.

### 2단계: BenikUI + IberisUI 설치

**CurseForge App (추천)**
- CurseForge App에서 **`BenikUI`** 검색 → 설치
- CurseForge App에서 **`IberisUI`** 검색 → 설치

**수동 설치**
1. [BenikUI](https://www.curseforge.com/wow/addons/benikui)와 [IberisUI](https://www.curseforge.com/wow/addons/iberisui) 각각의 zip을 다운로드
2. `Interface/AddOns/`에 압축 해제

게임 첫 접속 시 IberisUI 설치 마법사가 자동 실행됩니다. 이후 `/iberisui` 명령어로 재실행 가능.

## 설치 마법사 / Setup Wizard

| 단계 | 내용 |
|---|---|
| 1. UI 스케일 | 단일 버튼으로 ElvUI 프로필 일괄 적용 (UIScale 0.7 기준) |
| 2. 외부 애드온 | 설치된 외부 애드온 자동 감지 → 프로필 적용 |
| 3. 채팅창 | 좌측 일반/커뮤니티 탭, 우측 전리품 채팅창 구성 |
| 4. 완료 | UI 리로드 |

## 적용 프로필 / Applied Profiles

### ElvUI
- 폰트: Expressway / Bui Visitor1
- 유닛프레임: Player/Target 255×55, InfoPanel 22px, 커스텀 텍스트
- 데이터바: 9px 세로 바, BuiFlat 텍스처
- 채팅: 348×166 패널
- 무버: 40여 개 프레임 일괄 재배치

### 외부 애드온
| 애드온 | 종류 | 적용 프로필 |
|---|---|---|
| **BigWigs** | 레이드 경보 | MonoUI 바 레이아웃 |
| **Details** | 데미지 미터기 | ElvUI Frame Style 스킨, 4창 구성 (위협수준 / 치유 / 피해 / 총합) |
| **InvenRaidFrames3** | 공격대 창 | 서약선 레이드 레이아웃 |
| **MRT** | 공격대 도우미 | Note 창, MarksBar 비활성, CDs 프로필 (전문화별 쿨타임), InviteTool |
| **HidingBar** | 미니맵 버튼 정렬 | 캐릭터별 프로필 |
| **Questie** | 퀘스트 도우미 | 활성화 |
| **ShamanPower** | 주술사 도우미 | 활성화 |
| **TacoTip** | 툴팁 애드온 | 활성화 |

## 알려진 제약 / Known Issues

- 현재 **불성(20주년 기념서버)** 을 메인으로 플레이 중이므로, **본섭(Retail) / 판다(MoP Classic) / 오리지널(Classic Era)** 환경에서의 미세한 오류 검증이 다소 부족할 수 있습니다. 발견 시 [GitHub Issues](https://github.com/Iberis6501/ElvUI_IberisUI/issues)로 알려주세요.
- ElvUI 설치 마법사가 자동 스킵됩니다. **기존 ElvUI 프로필이 IberisUI 프로필로 덮어써집니다** — 기존 설정을 보존하려면 적용 전 백업하세요.
- 채팅창(ChatFrame1/4) 위치는 외부 코드의 변경을 즉시 차단(hard-lock)합니다. **의도된 동작**입니다.

> Limited testing on Retail / MoP Classic / Classic Era — author plays primarily on TBC Anniversary. The installer overwrites your existing ElvUI profile, and chat frame positions are hard-locked by design.

## 크레딧 / Credits

이 애드온은 다음 제작자분들의 작업물에 의존하며, 그 위에서 동작합니다:

- **[ElvUI](https://github.com/tukui-org/ElvUI)** — Elv & Tukui team
- **[ElvUI_BenikUI](https://www.curseforge.com/wow/addons/benikui)** — Benik

프로젝트 구조(멀티 클라이언트 TOC 패턴, 설치 마법사 패턴)는 ElvUI_BenikUI에서 영감을 받았습니다.

두 프로젝트의 소스 코드는 본 배포물에 포함되지 않습니다.

## 라이선스 / License

**All Rights Reserved.** [LICENSE](LICENSE) 참조.

IberisUI를 자유롭게 사용하시고 사적인 용도의 수정은 가능합니다. 다만 본 애드온의 일부 또는 전체를 [공식 GitHub 저장소](https://github.com/Iberis6501/ElvUI_IberisUI)와 [공식 CurseForge 페이지](https://www.curseforge.com/wow/addons/iberisui) 외의 곳에 재배포·재게시하는 것은 허용되지 않습니다.

ElvUI와 ElvUI_BenikUI는 각자의 라이선스를 따릅니다.

## 링크 / Links

- **GitHub:** https://github.com/Iberis6501/ElvUI_IberisUI
- **CurseForge:** https://www.curseforge.com/wow/addons/iberisui
- **버그 리포트 / Issues:** https://github.com/Iberis6501/ElvUI_IberisUI/issues

---

## 작업 내역 / Changelog

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
