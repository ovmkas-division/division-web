-- Gear completeness audit (2026-09-23)
-- Scope: cross-checked every gear_sets / gear_set_pieces / gear_set_bonuses / brand_sets /
-- brand_set_bonuses / gear_talents / gear_named / gear_exotic row against Namuwiki's live pages:
--   - 톰 클랜시의 디비전 2/보호장구 세트 (28 gear sets + piece names + set bonuses)
--   - 톰 클랜시의 디비전 2/보호장구 (38 brand sets incl. Improvised, and the general talent catalog)
--   - 톰 클랜시의 디비전 2/네임드 장비 (69 named gear items)
--   - 톰 클랜시의 디비전 2/특급 장비 (33 exotic gear items)
--
-- RESULT: 0 missing items in every table. Namuwiki documents exactly 28 gear sets, 38 brand
-- sets, 111 brand bonuses (37 brands x 3, Improvised has none), 49 gear talents, 69 named gear
-- pieces and 33 exotic gear pieces -- matching this project's row counts one-for-one. No insert
-- statements were needed.
--
-- gear_set_pieces 6-set-exclusion re-verified: Namuwiki's page was re-read in full for all 6
-- previously-excluded sets (Striker's Battlegear/기동타격대, Umbra Initiative/움브라
-- 이니셔티브, Hotshot/핫샷, Cavalier/카발리에, Ortiz: Exuro/오티즈: 엑수로, Aegis/아이기스).
-- Confirmed: all 6 genuinely only use generic "[Set name] + slot" piece names on Namuwiki
-- (e.g. "기동타격대 마스크", "카발리에 가슴 보호대", "엑수로 백팩") with no distinct flavor
-- names, same as the other 22 sets have. The prior conclusion holds; no changes needed. The 22
-- included sets' piece names were also diffed character-for-character against the current page
-- and all match exactly.
--
-- WHAT WAS ACTUALLY WRONG: not missing rows, but stale Korean translations. 37 of 69 gear_named
-- rows and 17 of 33 gear_exotic rows carry a name_ko that no longer matches Namuwiki's current
-- translation for that item (matched unambiguously via each item's English name / brand, which
-- did not change). This is far more than "a small number" of naming nuances -- entire words
-- differ (e.g. transliterated "마타도르" vs the current "투우사", or "컬렉터" vs "수집가"),
-- consistent with an in-game Korean localization pass that re-translated many item names after
-- this table was originally seeded/cross-translated. Fixed below via item_key (stable, unique).
-- A couple of items were skipped as genuine nuance-only diffs (e.g. "아코스타의 비상가방" vs
-- "아코스타의 비상 가방" -- spacing only) and were left untouched.
--
-- gear_set_bonuses / brand_set_bonuses were spot-checked against the wiki's effect text for
-- coverage (every 2/3/4-piece and chest/pack bonus text is present for every set; every brand's
-- 1/2/3-piece bonus is present) and no gaps were found; exact bonus wording was not re-audited
-- word-for-word since the task's completeness question is about missing items, not phrasing.

-- ===========================================================================================
-- gear_named: Korean names updated to match current Namuwiki (톰 클랜시의 디비전 2/네임드 장비).
-- ===========================================================================================
update gear_named set name_ko = '터모일' where item_key = '3e33ea38e65e32fa'; -- was '격동' (Turmoil)
update gear_named set name_ko = '청부업자의 장갑' where item_key = 'aca56bb06cf5665b'; -- was '계약자의 장갑' (Contractor’s Gloves)
update gear_named set name_ko = '그리즈' where item_key = '6ac272fde3af410a'; -- was '그리스' (Grease)
update gear_named set name_ko = '용광로' where item_key = '620bfa21d6536109'; -- was '대장간' (Forge)
update gear_named set name_ko = '이글의 손아귀' where item_key = '2e4198b749c899f7'; -- was '독수리의 손아귀' (Eagles Grasp)
update gear_named set name_ko = '투우사' where item_key = '22f7a09fa2238b1b'; -- was '마타도르' (Matador)
update gear_named set name_ko = '무정부주의자의 비결' where item_key = '8c779a93be934518'; -- was '무정부주의자의 요리책' (Anarchist's Cookbook)
update gear_named set name_ko = '날카로운 발톱' where item_key = 'f71fcfef6da0de3e'; -- was '발톱 세우기' (Claws Out)
update gear_named set name_ko = '철야' where item_key = 'a032a9403b42a938'; -- was '불침번' (Vigil)
update gear_named set name_ko = '은총' where item_key = '8f243457f6c18de7'; -- was '선물' (The Gift)
update gear_named set name_ko = '캡틴' where item_key = '3f87301a05ec0457'; -- was '선장' (Cap'n)
update gear_named set name_ko = '철저한 준비' where item_key = '7984e148a459949c'; -- was '설계' (The Setup)
update gear_named set name_ko = '신성' where item_key = '197adbbbb9e6526d'; -- was '소중한 것' (Cherished)
update gear_named set name_ko = '교묘함' where item_key = '21b71848ed6495f8'; -- was '손재주' (Sleight)
update gear_named set name_ko = '탐탁찮은 인정' where item_key = '5129a828a58e6832'; -- was '악마의 몫' (Devil's Due)
update gear_named set name_ko = '액체 엔지니어' where item_key = '876226a1927477e0'; -- was '액체 기술자' (Liquid Engineer)
update gear_named set name_ko = '마마 배저' where item_key = '76d0a2ca005edf53'; -- was '엄마 오소리' (Momma Badger)
update gear_named set name_ko = '학살자' where item_key = 'aa8de5d4758faf5b'; -- was '연쇄 학살자' (Chainkiller)
update gear_named set name_ko = '평등한 자' where item_key = '4f9059a8cc99468b'; -- was '이퀄라이저' (Equalizer)
update gear_named set name_ko = '일상 필수품' where item_key = 'bfcf0237e81224b3'; -- was '일상 휴대품' (Everyday Carrier)
update gear_named set name_ko = '탄두' where item_key = 'faad15e3e7c8564a'; -- was '일제 사격' (Salvo)
update gear_named set name_ko = '전략적 조정' where item_key = '875eedced86898de'; -- was '전략적 제휴' (Strategic Alignment)
update gear_named set name_ko = '충격량 증폭기' where item_key = 'd66a8d7eb330cd1b'; -- was '전력 승수' (Force Multiplier)
update gear_named set name_ko = '정확한 타격' where item_key = '0c3409d2c1cf575d'; -- was '정확무비' (Spot-On)
update gear_named set name_ko = '스노우 머신' where item_key = '3eb4caddb61b38e2'; -- was '제설기' (Snow Machine)
update gear_named set name_ko = '근본' where item_key = '6e8307af2fa71a15'; -- was '중추' (Backbone)
update gear_named set name_ko = '러시다운' where item_key = 'f684027745ce4439'; -- was '총공세' (Rushdown)
update gear_named set name_ko = '임피터스' where item_key = '16451ff33461ae63'; -- was '추진력' (Impetus)
update gear_named set name_ko = '밀착점' where item_key = '947e8fe07bb3b4c9'; -- was '클로저' (Closer)
update gear_named set name_ko = '망토' where item_key = '2ca31c92780c3d5b'; -- was '클로크' (Cloak)
update gear_named set name_ko = '수호자' where item_key = 'cf0d59702064b327'; -- was '키퍼' (Keeper)
update gear_named set name_ko = '물리식 기계 수리기' where item_key = '95dc7aac00eacaff'; -- was '타격식 정비' (Percussive Maintenance)
update gear_named set name_ko = '배달부' where item_key = '58cdede9979d0b1e'; -- was '특사' (The Courier)
update gear_named set name_ko = '피사로의 권총집' where item_key = '9def00487fda32bd'; -- was '피카로스 권총집' (Picaros Holster)
update gear_named set name_ko = '굳은 악수' where item_key = '4acbfd99d9e2cb95'; -- was '확고한 악수' (Firm Handshake)
update gear_named set name_ko = '황제의 근위병' where item_key = '7b9c4ab5a54adbac'; -- was '황제의 근위대' (Emperor’s Guard)
update gear_named set name_ko = '후견인' where item_key = '4b0a696822cc81e7'; -- was '후원자' (Benefactor)

-- ===========================================================================================
-- gear_exotic: same issue, checked against 톰 클랜시의 디비전 2/특급 장비.
-- ===========================================================================================
update gear_exotic set name_ko = 'BTSU 데이터 장갑' where item_key = '262faaf6112f792a'; -- was 'BTSU 데이터글러브' (BTSU Datagloves)
update gear_exotic set name_ko = '민첩 권총집' where item_key = '43c13444a8bc98f0'; -- was '날쌘 권총집' (Nimble Holster)
update gear_exotic set name_ko = '카탈리스트' where item_key = '5535971511d2cb70'; -- was '더 캐털리스트' (The Catalyst)
update gear_exotic set name_ko = '닷지 시티의 총잡이 권총집' where item_key = '31a85110a5eb6664'; -- was '도지 시티 건슬링어의 권총집' (Dodge City Gunslinger's Holster)
update gear_exotic set name_ko = '리지웨이의 자부심' where item_key = 'feb88476d5a4fa85'; -- was '리지웨이의 자랑' (Ridgeway's Pride)
update gear_exotic set name_ko = '불쾌' where item_key = '7a58d7d84502ba35'; -- was '바일' (Vile)
update gear_exotic set name_ko = '버디의 긴급 수리 팩' where item_key = '598c2bce51b8d176'; -- was '버디의 응급처치 팩' (Birdie's Quick Fix Pack)
update gear_exotic set name_ko = '신호기' where item_key = '7ef8b8ec715ecedd'; -- was '비컨' (Beacon)
update gear_exotic set name_ko = '강철의 의지' where item_key = '4277767f0ee0f590'; -- was '아이언 윌' (Iron Will)
update gear_exotic set name_ko = '러기드 건틀릿' where item_key = '363fa1529da1840f'; -- was '억센 건틀릿' (Rugged Gauntlets)
update gear_exotic set name_ko = '엑소더스 장갑' where item_key = '034157313d53cd8e'; -- was '엑소더스 글러브' (Exodus Gloves)
update gear_exotic set name_ko = '투자자' where item_key = '1fd27df1dc23c84e'; -- was '인베스터' (Investor)
update gear_exotic set name_ko = '수집가' where item_key = 'ac65d693dc79c197'; -- was '컬렉터' (Collector)
update gear_exotic set name_ko = '선동가' where item_key = 'cf2420059eab8230'; -- was '프로보케이터' (Provocator)
update gear_exotic set name_ko = '핏빛 너클' where item_key = '87bbe7feca396ff7'; -- was '피투성이 주먹' (Bloody Knuckles)
update gear_exotic set name_ko = '해리어 자부심' where item_key = 'c81c6ec1ce9b6a76'; -- was '해리어 프라이드' (Harrier Pride)
update gear_exotic set name_ko = '제국의 왕가' where item_key = '6de9bd26d7db7298'; -- was '황실 왕조' (Imperial Dynasty)
