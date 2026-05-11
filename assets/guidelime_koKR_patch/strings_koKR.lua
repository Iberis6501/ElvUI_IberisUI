-- IberisUI: Guidelime koKR translations
-- 이 파일은 Apply-GuidelimeKorean 패처가 Guidelime/Localization.lua의 koKR 블록으로 주입합니다.
-- 키별로 검토하여 자유롭게 수정하세요. 수정 후 패처를 다시 실행하면 게임에 반영됩니다.
-- 주석(--로 시작) 및 빈 줄도 그대로 주입됩니다.

L.TITLE = addonName

-- ===== 메인 창 / 윈도우 =====
L["GUIDE_WINDOW"] = "가이드 창"
L["SHOW_MAINFRAME"] = "창 열기"
L["HIDE_MAINFRAME"] = "창 숨기기"
L["LOCK_MAINFRAME"] = "창 고정"
L["LOAD_MESSAGE"] = "Guidelime: \"%s\" 가이드를 불러오는 중"
L["SHOW_GUIDE_TITLE"] = "가이드 제목 표시"
L["SHOW_COMPLETED_STEPS"] = "완료된 단계 표시"
L["SHOW_UNAVAILABLE_STEPS"] = "건너뛴 단계 표시"
L["CURRENT_GUIDE"] = "현재 가이드"
L["AVAILABLE_GUIDES"] = "사용 가능한 가이드"
L["DETAILS"] = "세부 정보"
L["MAIN_FRAME_WIDTH"] = "창 너비"
L["MAIN_FRAME_HEIGHT"] = "창 높이"
L["MAIN_FRAME_ALPHA"] = "창 투명도"
L["MAIN_FRAME_FONT_SIZE"] = "글꼴 크기"
L["MAIN_FRAME_SHOW_SCROLLBAR"] = "스크롤바 표시"
L["RESET_POSITION"] = "위치 초기화"
L["SELECT_COLORS"] = "색상 선택"
L["MAX_NUM_OF_STEPS"] = "표시할 단계 수\n(0 = 무제한)"
L["MAX_NUM_OF_MARKERS"] = "표시할 표식 수\n(0 = 무제한)"

-- ===== 화살표 =====
L["ARROW"] = "화살표"
L["SHOW_ARROW"] = "화살표 표시"
L["SHOW_DISTANCE"] = "거리 표시"
L["YARDS"] = "야드"
L["ARROW_ALPHA"] = "화살표 투명도"
L["ARROW_STYLE"] = "화살표 스타일"
L["ARROW_SIZE"] = "화살표 크기"
L["ARROW_FONT_SIZE"] = "화살표 글꼴 크기"
L["ARROW_STYLE1"] = "라임" -- 가이드라임 기본 스타일
L["ARROW_STYLE2"] = "화살표"
L["LOCK_ARROW"] = "화살표 고정"
L["ARROW_TOOLTIP_CORPSE"] = "시신으로 이동"
L["ARROW_GO_TO_INSTANCE"] = "%s(으)로 이동"
L["ARROW_POSITION_REACHED"] = "위치 도달"
L["ARROW_CURRENT_STEP"] = "현재 단계를 따라가기"

-- ===== 지도 표식 =====
L["MAP_MARKERS_GOTO"] = "경로 지점 표식 (%s)"
L["MAP_MARKERS_LOC"] = "추가 표식 (%s)"
L["MAP_MARKER_STYLE"] = "지도 표식 스타일"
L["MAP_MARKER_SIZE"] = "지도 표식 크기"
L["MAP_MARKER_ALPHA"] = "지도 표식 투명도"
L["SHOW_MARKERS_ON"] = "표식 표시 위치"
L["HIDE_MARKERS_ON"] = "표식 숨김 위치"
L["MAP"] = "지도"
L["MINIMAP"] = "미니맵"

-- ===== 옵션 / 디버깅 =====
L["GENERAL_OPTIONS"] = "일반 설정"
L["DEBUGGING_OPTIONS"] = "편집 / 디버깅 설정"
L["DEBUGGING"] = "디버깅 모드 활성화"
L["SHOW_LINE_NUMBERS"] = "줄 번호 표시"
L["SHOW_QUEST_IDS"] = "퀘스트 ID 표시"
L["DISPLAY_DEMO_GUIDES"] = "데모 가이드 표시"

-- ===== 단계 메시지 =====
L["SKIPPING_QUEST"] = "이 퀘스트를 건너뛰는 중입니다."
L["MISSING_PREQUEST"] = "다음 퀘스트의 완료가 필요합니다:"
L["MISSING_PREQUESTS"] = "다음 퀘스트들의 완료가 필요합니다:"
L["OTHER_GUIDES"] = "다른 가이드"
L["LOAD_GUIDE"] = "가이드 불러오기"
L["RESET_GUIDE"] = "가이드 초기화"
L["EDIT_GUIDE"] = "가이드 편집"
L["URL"] = "URL"
L["QUEST_REQUIRED_LEVEL"] = "%s의 요구 레벨은 %s입니다"
L["STEP_MANUAL"] = "이 단계를 완료했다면 여기를 클릭하세요"
L["STEP_SKIP"] = "이 단계를 건너뛰려면 여기를 클릭하세요"
L["STEP_FOLLOWUP_QUEST"] = "%s을(를) 건너뛰면 후속 퀘스트를 놓치게 됩니다"
L["STEP_FOLLOWUP_QUESTS"] = "%s을(를) 건너뛰면 후속 퀘스트들을 놓치게 됩니다"
L["STEP_FOLLOWUP_QUEST_CONT"] = "나중에 %s을(를) 수행하면 이 퀘스트가 다시 활성화됩니다."
L["STEP_FOLLOWUP_QUESTS_CONT"] = "나중에 %s을(를) 수행하면 이 퀘스트들이 다시 활성화됩니다."
L["SHOW_SUGGESTED_QUEST_LEVELS"] = "퀘스트의 권장 레벨 표시"
L["SHOW_MINIMUM_QUEST_LEVELS"] = "퀘스트의 최소 레벨 표시"
L["SHOW_TOOLTIPS"] = "툴팁 표시"
L["ESTIMATE"] = "추정 위치입니다."
L["NO_GUIDE_LOADED"] = "아직 가이드를 선택하지 않았습니다. 여기를 클릭하여 가이드를 불러와 시작하세요."
L["GUIDE_FINISHED"] = "현재 가이드를 완료했습니다. 여기를 클릭하여 다른 가이드를 불러오세요."
L["GUIDE_FINISHED_NEXT"] = "현재 가이드를 완료했습니다. 여기를 클릭하여 %s(으)로 이어 가세요."
L["GUIDE_FINISHED_NEXT_ALT"] = "또는 여기를 클릭하여 %s(으)로 이어 갈 수 있습니다."
L["DOWNLOAD_FULL_GUIDE"] = "이것은 데모입니다. %s-%s 전체 가이드를 사용하려면 가이드 애드온 모듈 %s을(를) 설치해야 합니다. 다음 주소에서 무료로 다운로드할 수 있습니다: %s"
L["GUIDE_LIST"] = "더 많은 가이드는 다음에서 확인할 수 있습니다: %s"

-- ===== 자동화 =====
L["AUTO_ACCEPT_QUESTS"] = "퀘스트 자동 수락"
L["AUTO_TURNIN_QUESTS"] = "퀘스트 자동 완료"
L["CURRENT_QUESTS"] = "현재 단계의 퀘스트"
L["GUIDE_QUESTS"] = "현재 가이드의 퀘스트"
L["ALL_QUESTS"] = "전체"
L["AUTO_SELECT_FLIGHT"] = "비행 경로 자동 선택"
L["AUTO_TRAIN"] = "현재 가이드가 요구할 때 주문/기술 자동 구매"

-- ===== 가이드 편집기 =====
L["EDITOR"] = "편집기"
L["SAVE_GUIDE"] = "가이드 저장"
L["CUSTOM_GUIDES"] = "사용자 정의 가이드"
L["SAVE_MSG"] = "\"%s\"(으)로 저장할까요?"
L["OVERWRITE_MSG"] = "기존 가이드 \"%s\"을(를) 덮어쓸까요?"
L["DELETE_GUIDE"] = "가이드 삭제"
L["DELETE_MSG"] = "가이드 \"%s\"이(가) 사용자 정의 가이드에서 삭제됩니다."

-- ===== 편집기 툴팁 =====
L["EDITOR_TOOLTIP_NAME"] = "가이드의 이름과 레벨 범위를 설정\n예: \"[N1-6Coldridge Valley]\""
L["EDITOR_TOOLTIP_NEXT"] = "현재 가이드 이후 이어질 다음 가이드의 이름과 레벨 범위를 설정\n예: \"[NX6-12Dun Morogh]\""
L["EDITOR_TOOLTIP_DETAILS"] = "가이드 상세 설명 입력\n예: \"[D 노움/드워프 시작 지역 개인 가이드]\""
L["EDITOR_TOOLTIP_GUIDE_APPLIES"] = "이 가이드가 적용되는 진영/종족/직업 설정\n예: \"[GA Dwarf,Gnome]\""
L["EDITOR_TOOLTIP_APPLIES"] = "현재 단계가 적용되는 진영/종족/직업 설정\n예: \"[A Dwarf,Rogue]\""
L["EDITOR_TOOLTIP_OPTIONAL"] = "현재 단계를 선택 사항으로 표시\n예: \"[O]\""
L["EDITOR_TOOLTIP_OPTIONAL_COMPLETE_WITH_NEXT"] = "다음 단계가 완료되면 현재 단계도 자동으로 완료되도록 표시\n예: \"[OC]\""
L["EDITOR_TOOLTIP_QUEST"] = "퀘스트 추가\n예: \"[QA179]\" 또는 \"[QC3361,2 A Refugee's Quandary]\""
L["EDITOR_TOOLTIP_GOTO"] = "목표 좌표 추가\n예: \"[G 29.93,71.2 Dun Morogh]\""
L["EDITOR_TOOLTIP_LEARN"] = "플레이어가 주문을 배워야 함\n예: \"[LE Arcane Missiles]\""
L["EDITOR_TOOLTIP_LOC"] = "추가 위치의 좌표 추가\n예: \"[L 29.93,71.2 Dun Morogh]\""
L["EDITOR_TOOLTIP_XP"] = "현재 레벨에서 특정 레벨/경험치에 도달해야 진행되는 단계\n예: \"[XP8.5 half way to 9]\""
L["EDITOR_TOOLTIP_HEARTH"] = "플레이어가 화로돌을 사용해야 함\n예: \"[H]\""
L["EDITOR_TOOLTIP_FLY"] = "플레이어가 비행을 이용해야 함\n예: \"[F Thelsamar]\""
L["EDITOR_TOOLTIP_TRAIN"] = "플레이어가 훈련사를 방문해야 함\n예: \"[T]\""
L["EDITOR_TOOLTIP_SET_HEARTH"] = "플레이어가 여관에서 화로돌을 설정해야 함\n예: \"[S]\""
L["EDITOR_TOOLTIP_GET_FLIGHT_POINT"] = "플레이어가 새 비행 지점을 등록해야 함\n예: \"[P Thelsamar]\""
L["EDITOR_TOOLTIP_VENDOR"] = "플레이어가 상인을 이용/물품을 재보급해야 함\n예: \"[V]\""
L["EDITOR_TOOLTIP_REPAIR"] = "플레이어가 수리해야 함\n예: \"[R]\""
L["EDITOR_TOOLTIP_ZONE"] = "첫 좌표 외에는 필수 아님. 생략 시 이전 좌표와 같은 지역으로 간주합니다."

-- ===== 일반 라벨 =====
L["NAME"] = "이름"
L["MINIMUM_LEVEL"] = "최소 레벨"
L["MAXIMUM_LEVEL"] = "최대 레벨"

-- ===== 퀘스트 액션 =====
L["QUEST_ACCEPT"] = "수락"
L["QUEST_TURNIN"] = "완료"
L["QUEST_COMPLETE"] = "수행"
L["QUEST_SKIP"] = "건너뛰기"
L["QUEST_S_TOOLTIP"] = "플레이어에게 특정 퀘스트를 수락하지 않도록 안내할 때만 사용"
L["QUEST_NAME"] = "퀘스트 이름"
L["QUEST_NAME_TOOLTIP"] = "표시할 텍스트. 생략 시 퀘스트 이름이 표시됩니다. \"-\"이면 텍스트가 표시되지 않습니다."
L["QUEST_ID"] = "퀘스트 ID"
L["QUEST_ID_TOOLTIP"] = "퀘스트 ID. 생략 시 입력한 이름으로 검색합니다. 이름이 중복될 수 있으므로 ID 입력이 필요할 수 있습니다."
L["QUEST_OBJECTIVE"] = "퀘스트 목표"
L["QUEST_OBJECTIVE_TOOLTIP"] = "완료해야 하는 목표의 번호 (1 = 첫 번째, 2 = 두 번째 ...). 단일 목표만 추적할 때 지정 가능. 생략 시 모든 목표가 필요합니다."
L["QUEST_ADD_COORDINATES"] = "좌표 추가"
L["QUEST_ADD_COORDINATES_TOOLTIP"] = "퀘스트 데이터베이스에 좌표가 있을 경우 이동 단계가 추가됩니다"

-- ===== XP 단계 =====
L["XP_LEVEL"] = "레벨만"
L["XP_LEVEL+"] = "획득한 경험치"
L["XP_LEVEL-"] = "남은 경험치"
L["XP_LEVEL%"] = "백분율"
L["XP_LEVEL+_TOOLTIP"] = "지정한 레벨에 도달했고 지정한 양의 경험치를 획득했어야 함"
L["XP_LEVEL-_TOOLTIP"] = "다음 레벨까지 지정한 경험치 이하가 남았어야 함"
L["XP_LEVEL%_TOOLTIP"] = "지정한 레벨에 도달했고 다음 레벨까지 지정한 백분율의 경험치를 획득했어야 함"
L["XP_TEXT"] = "텍스트"
L["XP_TEXT_TOOLTIP"] = "표시할 텍스트. 생략 시 \"%s\"(으)로 표시됩니다."

-- ===== 정보 패널 =====
L["SHOW_MAP"] = "지도에 표시"
L["QUEST_INFO"] = "퀘스트 정보"
L["SUGGESTED_LEVEL"] = "권장 레벨"
L["TYPE"] = "유형"
L["GOTO_INFO"] = "좌표 정보"
L["QUEST_ACCEPT_POS"] = "수락 위치"
L["QUEST_COMPLETE_POS"] = "수행 위치"
L["QUEST_TURNIN_POS"] = "완료 위치"
L["AT"] = "위치:"
L["MORE_POSITIONS"] = "더 많은 위치"

-- ===== 오류 메시지 =====
L["ERROR_CODE_NOT_RECOGNIZED"] = "가이드 \"%s\" 파싱 중: \"%s\" 줄의 [%s] 코드를 인식할 수 없습니다"
L["ERROR_GUIDE_HAS_NO_NAME"] = "가이드에 이름이 없습니다"
L["ERROR_CODE_ZONE_NOT_FOUND"] = "가이드 \"%s\" 파싱 중: \"%s\" 줄의 [%s] 코드에서 지역을 찾을 수 없습니다"
L["ERROR_NOT_A_NUMBER"] = "%s은(는) 숫자가 아닙니다"
L["ERROR_NPC_NOT_FOUND"] = "NPC \"%s\"을(를) 찾을 수 없습니다"
L["ERROR_QUEST_NOT_FOUND"] = "퀘스트 \"%s\"을(를) 찾을 수 없습니다"
L["ERROR_QUEST_NOT_UNIQUE"] = "이름이 \"%s\"인 퀘스트가 여러 개 있습니다. 다음 ID 중 하나를 입력하세요: "
L["ERROR_ZONE_NOT_FOUND"] = "\"%s\"은(는) 지역이 아닙니다. 다음 지역 이름 중 하나를 입력하세요: "
L["ERROR_OUT_OF_RANGE"] = "%s은(는) %s에서 %s 사이가 아닙니다"
L["ERROR_QUEST_RACE_ONLY"] = "이 퀘스트는 다음 종족 전용입니다: "
L["ERROR_QUEST_CLASS_ONLY"] = "이 퀘스트는 다음 직업 전용입니다: "
L["ERROR_FLIGHT_POINT_NOT_FOUND"] = "비행 지점 \"%s\"을(를) 찾을 수 없습니다"

-- ===== 분류 라벨 =====
L["ZONE"] = "지역"
L["LEVEL"] = "레벨"
L["PART"] = "부분" -- 퀘스트 연작에서 "외교관의 실종 17부" 같은 표현용
L["CATEGORY"] = "분류"
L["QUEST_CHAIN"] = "퀘스트 연작"
L["NEXT"] = "다음"
L["PREVIOUS"] = "이전"
L["OBJECTIVE"] = "목표"
L["ENGLISH_NAME"] = "영문 이름"
L["SKIP_CUTSCENES"] = "컷신 건너뛰기"

-- ===== 데이터 소스 =====
L["DATA_SOURCE_QUESTIE"] = "'Questie'를 데이터 소스로 사용"
L["DATA_SOURCE_TOOLTIP_QUESTIE"] = "'Questie' 애드온이 설치되어 있으면 퀘스트 좌표 데이터 소스로 사용할 수 있습니다.\n내부 퀘스트 데이터베이스와 다른 정보(예: 퀘스트 몬스터 생성 위치)를 가질 수 있습니다."
L["DATA_SOURCE_CLASSIC_CODEX"] = "'ClassicCodex'를 데이터 소스로 사용"
L["DATA_SOURCE_TOOLTIP_CLASSIC_CODEX"] = "'ClassicCodex' 애드온이 설치되어 있으면 퀘스트 좌표 데이터 소스로 사용할 수 있습니다.\n내부 퀘스트 데이터베이스와 다른 정보(예: 퀘스트 몬스터 생성 위치)를 가질 수 있습니다."
L["DATA_SOURCE_DB"] = "내부 데이터 소스 사용"
L["DATA_SOURCE_TOOLTIP_DB"] = "퀘스트 좌표 등의 정보로 Guidelime에 내장된 내부 데이터베이스만 사용합니다.\n최신 퀘스트가 누락되어 있을 수 있습니다."

-- ===== 가이드 좌표 관리 =====
L["ADD_QUEST_COORDINATES"] = "퀘스트 좌표 추가"
L["ADD_QUEST_COORDINATES_MESSAGE"] = [=[퀘스트 데이터베이스에 정보가 있을 경우 모든 퀘스트 단계에 퀘스트 좌표를 추가합니다.
이미 존재하는 퀘스트 좌표는 교체됩니다.]=]
L["ADDED_QUEST_COORDINATES_MESSAGE"] = "%s 퀘스트 좌표가 추가되었습니다."
L["REMOVE_ALL_COORDINATES"] = "모든 좌표 제거"
L["REMOVE_ALL_COORDINATES_MESSAGE"] = "모든 좌표 단계([G...])가 제거됩니다."
L["REMOVED_COORDINATES_MESSAGE"] = "%s개 좌표가 제거되었습니다."
L["DISCARD_CHANGES"] = "변경 사항 취소"

-- ===== 가이드 가져오기 =====
L["IMPORT_GUIDE"] = "가이드 가져오기"
L["IMPORT_GUIDE_MESSAGE"] = "일반 텍스트로 작성된 가이드를 가져옵니다. 퀘스트 이름은 따옴표(\"\")로 감싸야 합니다. 경우에 따라 올바른 퀘스트 ID를 수동으로 추가해야 할 수 있습니다. ID가 없거나 오류가 있는 줄은 표시됩니다. 오류를 수정하고 다시 가져오면 표시가 제거됩니다."

-- ===== 진영 =====
L["Alliance"] = "얼라이언스"
L["Horde"] = "호드"

-- ===== 퀘스트 검사 / 일관성 =====
L["CHECK_QUESTS_COMPLETED"] = "%s개 퀘스트 완료"
L["CHECK_QUESTS_NO_INCONSISTENCIES"] = "불일치 항목이 발견되지 않았습니다"
L["CHECK_QUESTS"] = "당신의 퀘스트 진행 상황과 Guidelime 퀘스트 데이터베이스 간 불일치가 발견되었습니다. 이 텍스트를 디스코드의 %s에게 (또는 CurseForge의 %s, Reddit의 %s에게) 비공개 메시지로 보내주시면 애드온 개선에 도움이 됩니다. 감사합니다!"
L["QUEST_CONTAINED_IN_GUIDE"] = "이 퀘스트는 현재 가이드에 포함되어 있습니다:"
L["QUEST_NOT_CONTAINED_IN_GUIDE"] = "이 퀘스트는 현재 가이드에 포함되어 있지 않습니다"

-- ===== TBC 데이터 소스 오류 =====
L["ERROR_TBC_DATA_SOURCE"] = "이 가이드를 불러오려면 퀘스트 데이터 소스로 추가 애드온이 필요합니다. 설정에서 'Questie' 또는 'ClassicCodex'를 데이터 소스로 선택하세요."
L["ERROR_TBC_DATA_SOURCE_INSTALL"] = "이 가이드를 불러오려면 퀘스트 데이터 소스로 추가 애드온이 필요합니다. 'Questie' 또는 'ClassicCodex'를 설치하세요."

-- ===== 아이템/대상 버튼 =====
L["SHOW_USE_ITEM_BUTTONS"] = "퀘스트 아이템 사용 버튼 표시"
L["MAX_NUM_OF_ITEM_BUTTONS"] = "표시할 아이템 버튼 수\n(0 = 무제한)"
L["SHOW_TARGET_BUTTONS"] = "NPC 타게팅 버튼 표시"
L["MAX_NUM_OF_TARGET_BUTTONS"] = "표시할 대상 버튼 수\n(0 = 무제한)"
L["BUTTONS_LEFT"] = "가이드 창 왼쪽"
L["BUTTONS_RIGHT"] = "가이드 창 오른쪽"
L["TARGET_RAID_MARKERS"] = "타게팅한 NPC에 %s 표시"
L["USE_ITEM_X"] = "아이템 사용 (또는 주문 시전) %d"
L["TARGET_TOOLTIP"] = "%s 타게팅"
L["TARGET_X"] = "NPC 타게팅 %d"
L["TARGET_1"] = "NPC 타게팅 1 (지정된 NPC 중 아무나 타게팅에도 사용)"

-- ===== Wowhead 연결 =====
L["WOWHEAD_OPEN_QUEST"] = "'Wowhead'에서 퀘스트 보기"
L["WOWHEAD_URL_CLASSIC"] = "https://ko.classic.wowhead.com"
L["WOWHEAD_URL_WOTLK"] = "https://www.wowhead.com/wotlk/ko"
L["WOWHEAD_URL_CATA"] = "https://www.wowhead.com/cata/ko"
L["WOWHEAD_URL_MOP"] = "https://www.wowhead.com/mop-classic/ko"

-- ===== 설정 가져오기 / 키 바인딩 =====
L["IMPORT_SETTINGS"] = "캐릭터 설정 가져오기"
L["DEFAULT_SETTINGS"] = "이 설정을 신규 캐릭터 기본값으로 저장"
L["EDIT_KEYBINDINGS"] = "단축키 편집"
L["TOOLTIP_HINT_KEY_BIND_BUTTON"] = "팁: 이 버튼에 단축키를 지정할 수 있습니다"
L["LEFT_CLICK"] = "좌클릭"
L["RIGHT_CLICK"] = "우클릭"
L["SHIFT_LEFT_CLICK"] = "Shift + 좌클릭"
L["SHIFT_RIGHT_CLICK"] = "Shift + 우클릭"

-- ===== 미니맵 / 기타 =====
L["SHOW_MINIMAP_BUTTON"] = "미니맵 버튼 표시"
L["ONLY_WHEN_MAINFRAME_HIDDEN"] = "가이드 창이 숨겨졌을 때만"
L["PLEASE_WAIT"] = "잠시만 기다려주세요..."
L["AUTO_SELECT_START_GUIDE"] = "새 레벨 1 캐릭터에서 자동으로 가이드 선택"
L["INACTIVE"] = "비활성"
L["FLIGHT_POINT"] = "비행 지점"
L["NPC_ID"] = "NPC ID"
L["NPC_NAME"] = "NPC 이름"
L["SPELL_ID"] = "주문 ID"
L["SPELL_NAME"] = "주문 이름"
