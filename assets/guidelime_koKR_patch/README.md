# Guidelime 한글 패치 (IberisUI)

Guidelime 애드온의 UI 한글화를 자동으로 적용/재적용하는 패처입니다.

## 사용법

1. **`Apply-GuidelimeKorean.bat`** 더블클릭
2. 콘솔에서 패치된 클라이언트 목록 확인
3. WoW에서 `/reload` 또는 재접속

설치된 모든 클라이언트 (`_retail_`, `_classic_`, `_classic_era_`, `_anniversary_` 등)에 일괄 적용됩니다.

## 동작 원리

- 각 클라이언트의 `Interface\AddOns\Guidelime\Localization.lua` 자동 탐색
- 최초 1회 `.iberis.bak` 백업 생성
- `elseif locale == "koKR" then` 블록을 `strings_koKR.lua` 내용으로 교체
- UTF-8 (BOM 없음)으로 저장
- 재실행 안전 (idempotent)

## Guidelime 업데이트 후

CurseForge/Discord에서 Guidelime이 업데이트되면 `Localization.lua`가 덮어쓰입니다. 그때마다 `Apply-GuidelimeKorean.bat`을 다시 실행하세요.

`.iberis.bak`은 최초 한 번만 만들어지므로 업데이트 후의 새 원본은 보존되지 않습니다. 새 버전의 원본이 필요하면 패치 전에 `.iberis.bak`을 삭제하고 패처를 다시 실행하세요.

## 번역 수정

`strings_koKR.lua`를 직접 편집한 뒤 패처를 재실행하면 변경이 반영됩니다.

## 번역되지 않는 부분

다음은 의도적으로 번역하지 않았습니다:

- `WORD_LIST_*` — 영어 텍스트 가이드 import 시 사용되는 정규식 패턴. 한국어 가이드 import는 별도 작업이 필요합니다.
- **가이드 내용 자체** — `[N1-6Coldridge Valley]` 같이 가이드 모듈 애드온에 박혀있는 퀘스트/지역명. 가이드 데이터 파일을 직접 한글화해야 합니다.

## 문제 발생 시

- 백업 복구: `Localization.lua.iberis.bak`을 `Localization.lua`로 이름 변경
- 패처 오류 메시지를 그대로 보고 (어느 클라이언트에서 실패했는지 표시됩니다)
