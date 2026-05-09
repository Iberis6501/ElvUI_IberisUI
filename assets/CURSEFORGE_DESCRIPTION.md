> A one-click installer that replicates Iberis's complete ElvUI/BenikUI UI — including pre-configured profiles for BigWigs, Details, MRT, and more — across Retail and all Classic clients.
>
> 이베리스의 [서약선] 캐릭터 ElvUI/BenikUI 환경을 그대로 복제 배포하는 애드온. 본섭부터 모든 클래식 클라이언트까지 지원.

---

## Supported Clients / 지원 클라이언트

| Client | Folder | TOC |
|---|---|---|
| Retail (본섭) | `_retail_` | `ElvUI_IberisUI_Mainline.toc` |
| Mists Classic (판다) | `_classic_` | `ElvUI_IberisUI_Mists.toc` |
| Wrath Classic | `_wrath_` | `ElvUI_IberisUI_Wrath.toc` |
| TBC Anniversary (불성) | `_anniversary_` | `ElvUI_IberisUI_TBC.toc` |
| Classic Era / SoD (오리지널/디스커버리) | `_classic_era_` | `ElvUI_IberisUI_Vanilla.toc` |

## Requirements / 요구사항

- **[ElvUI](https://tukui.org/elvui)** v15.05+
- **[ElvUI_BenikUI](https://github.com/Benik/ElvUI_BenikUI)** v2.41+

> ⚠️ IberisUI **does not include** ElvUI or BenikUI. They must be installed separately.
> IberisUI는 ElvUI와 BenikUI를 **포함하지 않습니다**. 별도로 먼저 설치하세요.

## Installation / 설치

### Via CurseForge App / WowUp (recommended)
1. Search for `IberisUI` and install. Required dependencies are pulled in automatically.

### Manual
1. Download the latest release zip.
2. Extract `ElvUI_IberisUI/` into `Interface/AddOns/`.

On first login the setup wizard runs automatically. Re-run anytime with `/iberisui`.

## Setup Wizard / 설치 마법사

| Step | Description |
|---|---|
| 1. UI Scale | 단일 버튼으로 ElvUI 프로필 일괄 적용 (UIScale 0.7 기준) |
| 2. External Addons | 설치된 외부 애드온 자동 감지 → 프로필 적용 |
| 3. Chat Frames | 좌측 일반/커뮤니티 탭, 우측 전리품 채팅창 구성 |
| 4. Finish | UI 리로드 |

## Applied Profiles / 적용 프로필

### ElvUI
- Fonts: Expressway / Bui Visitor1
- Unitframes: Player/Target 255×55, InfoPanel 22px, custom texts
- Databars: 9px vertical, BuiFlat texture
- Chat: 348×166 panels
- Movers: 40+ frames repositioned

### External Addons
| Addon | Profile |
|---|---|
| **BigWigs** | MonoUI bar layout |
| **Details** | ElvUI Frame Style skin, 4-window layout (threat / heal / damage / total) |
| **InvenRaidFrames3** | Seoyaksun raid layout |
| **MRT** | Note window, MarksBar disabled, CDs profile (per-spec cooldowns), InviteTool |
| **HidingBar** | Per-character profile |
| **Questie** | Active |
| **ShamanPower** | Active |
| **TacoTip** | Active |

## Credits / 크레딧

This addon is built on top of, and depends on, the work of these authors:

- **[ElvUI](https://github.com/tukui-org/ElvUI)** by Elv and the Tukui team
- **[ElvUI_BenikUI](https://github.com/Benik/ElvUI_BenikUI)** by Benik

The project structure (multi-client TOC layout, install wizard pattern) is inspired by ElvUI_BenikUI. No source code from those projects is included in this distribution.

## License

**All Rights Reserved.**

You may use IberisUI freely and modify it for private personal use. Redistribution or republishing of any portion of this addon outside the official GitHub repository and the official CurseForge page is not permitted.

ElvUI and ElvUI_BenikUI retain their own respective licenses.

## Links

- **GitHub:** https://github.com/Iberis6501/ElvUI_IberisUI
- **Issues / Bug reports:** https://github.com/Iberis6501/ElvUI_IberisUI/issues
