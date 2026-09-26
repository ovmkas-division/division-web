# division-web

디비전2 한국어 동반 사이트. 정적 HTML(빌드 없음) + Supabase. GitHub Pages(division.ovmkas.co.kr)로 배포.

## 사용자와 작업하는 규칙

- 답변은 항상 한국어로만.
- 커밋은 내가, 푸시는 사용자가 한다. (샌드박스에서 `git push`는 인증 문제로 실패함) `git push`는 사용자에게 안내만 한다.
- SQL은 사용자가 Supabase SQL Editor에서 직접 실행한다. 나는 `sql/`에 파일만 쓰고, 실행 후 REST로 반영 여부를 확인한다. 새 SQL이 필요하면 마지막에 "어떤 파일을 어떤 순서로 실행할지" 알려준다.
- 게임 데이터(이름/속성/효과)는 나무위키 기준으로 정확성이 최우선. 추측 금지, 불확실하면 "확인 불가"로 남긴다. 대량 조사는 백그라운드 Agent에 시키고 결과 파일을 직접 검증한다.
- UI는 모바일 우선. 사용자는 스크린샷으로 피드백한다. 시키지 않은 것까지 손대지 않는다("그것만 해").

## 구조

- `index.html` — 메인 앱(확전 타겟 루트 탭 + 파밍 체크리스트 탭). CSS/JS 전부 인라인.
- `login.html` — 로그인만. 이미 로그인돼 있으면 `index.html`로 리다이렉트.
- `sql/` — 마이그레이션·시드 (날짜 순 누적). 카탈로그 테이블은 public read RLS, 사용자 데이터는 `auth.uid() = user_id`.
- Supabase publishable 키가 클라이언트에 하드코딩된 건 의도된 것(RLS가 보안 경계).

## 파밍 체크리스트 핵심 개념

- `farm_custom_items`: 사용자가 만든 항목. `shared=true`면 친구에게 보임(수정/삭제는 소유자만). 컬럼: `main_attrs[]`, `sub_attrs[]`, `special_effect`, `gear_mod`.
- 등록 흐름(`renderCreatePanel`): 종류(무기/보호장구/세트/빌드) → 부위 → 모델/브랜드/세트부위(네임드·특급·세트 섹션 포함) → 폼.
- 무기와 방어구는 속성 체계가 다르다: 방어구=핵심속성 3택1+비핵심 12종(+마스크/방탄복/백팩만 개조), 무기=무기군별 핵심속성 1~2개+비핵심 13종. 목록은 전부 DB(`gear_core_attrs`, `gear_secondary_attrs`, `weapon_core_attrs`, `weapon_secondary_attrs`, `gear_mods`)에서 로드.
- 빌드(`farm_builds`): 무기3+방어구6+스킬2. 슬롯을 채울 땐 DB에 쓰지 않고 메모리(`buildDraft`)에만 들고 있다가 "빌드 저장" 때 `saveBuild()`가 실제 항목을 생성한다. 빌드 삭제 시 연결된 항목도 같이 삭제. 스킬은 `skills` 테이블(카테고리→세부종류 2단계 피커).
- 네임드 무기/방어구 중 `talent_name_ko`가 비어있는 건 정상(고유 속성만 있는 아이템).

## 자주 밟은 함정

- `display`를 준 클래스에 `hidden` 속성을 쓰면 안 숨겨진다. `.foo[hidden] { display: none; }`를 꼭 같이 쓴다. (`.tabs`, `.flist`, `.fbulk`에서 반복됨)
- 모듈 스크립트에서 `const x = createClient(...)` 뒤 세미콜론 빠지면 다음 줄 `(async ...)`과 붙어 파싱된다.
- 파일 이름 바꿀 땐 JS 안의 동적 링크(`authLink.href` 등)까지 grep.

## 로컬 검증 방법

1. `index.html`을 `.test-farm.html`로 복사하고 `const session = ...getSession()...` 줄을 `{ user: { id: "fake-user-id" } }`로 교체(`true`는 안 됨).
2. `node -e`로 간단한 정적 서버(포트 89xx)를 띄우고 브라우저 도구로 확인. 필요하면 `loadCustomItems` 등을 가짜 데이터로 스텁.
3. fake 세션은 RLS 때문에 insert/delete가 실패한다 — UI 동작만 확인 가능.
4. 끝나면 `.test-farm.html` 삭제, 서버 종료. 문법 검사는 `<script>` 추출 후 `node --check`.
