# TUGs 가이드 한글 패치 (IberisUI)

`GuideLime_TUGs_TBC` 애드온의 가이드 파일을 한국어 번역본으로 교체합니다.

## 현재 번역 범위

- **얼라이언스 60-70 (불성 외각)**: Hellfire Peninsula, Zangarmarsh, Terokkar Forest, Nagrand, Blade's Edge Mountains, Netherstorm, Shadowmoon Valley
- 호드 및 1-60 구간은 번역되어 있지 않습니다 (원본 영어 유지).

## 사용법

1. **`Apply-TUGsKorean.bat`** 더블클릭
2. 콘솔에서 패치된 파일 목록 확인
3. WoW에서 `/reload` (또는 재접속) 후 가이드를 다시 불러오기

## 동작 원리

- `guides/Alliance/`, `guides/Horde/`, `guides/Professions/` 폴더 구조가 TUGs 애드온 구조를 그대로 미러링
- 번역 파일이 존재하는 항목만 덮어씀 (원본 폴더 구조의 다른 파일은 건드리지 않음)
- 최초 1회 `<원본>.iberis.bak` 백업 생성
- UTF-8 (BOM 없음)으로 저장
- 재실행 안전 (idempotent)

## TUGs 업데이트 후

작성자가 TUGs를 업데이트하면 원본 파일이 덮어쓰여집니다. 그때마다 `Apply-TUGsKorean.bat`을 다시 실행하세요.

`.iberis.bak`은 최초 한 번만 만들어지므로 업데이트 후의 새 원본이 필요하면 패치 전에 `.iberis.bak`을 삭제하고 패처를 다시 실행하세요.

## 번역 수정

`guides/Alliance/<파일명>.lua`를 직접 편집한 뒤 패처를 재실행하면 변경이 반영됩니다.

번역 시 주의 사항:
- `[QA123]`, `[QT123]`, `[QC123]`, `[XP...]`, `[H]`, `[F ...]` 등 대괄호 코드는 **절대 수정하지 마세요** — Guidelime이 파싱합니다.
- `Accept:`, `TurnIn:`, `Do:`, `Grind:` 같은 줄머리 라벨은 그대로 두는 것을 권장 (Guidelime이 인식하는 패턴이 enUS 기준).
- `Guidelime.registerGuide([[` 와 `]], "...")` 구조도 유지하세요.

## 문제 발생 시

- 백업 복구: `<파일>.lua.iberis.bak`을 `<파일>.lua`로 이름 변경
- 패처 오류는 어느 파일에서 실패했는지 표시됩니다.
