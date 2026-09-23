-- gear_set_pieces: per-slot piece names for each of the 28 gear sets, sourced from
-- Namuwiki (톰 클랜시의 디비전 2/보호장구 세트, https://namu.wiki/w/...).
--
-- IMPORTANT correction to the original premise: "투자자"(Investor)/"버디"(Birdie) are NOT
-- Eclipse Protocol set-piece variants. They are two unrelated EXOTIC (특급) items -- 투자자
-- is an exotic mask, 버디의 긴급 수리 팩 (Birdie's Quick Fix Pack) is an exotic backpack --
-- documented on a separate Namuwiki page (톰 클랜시의 디비전 2/특급 장비, section 4).
-- Namuwiki does NOT document any set, including Eclipse Protocol, as having multiple
-- named variants for the same slot tied to a "build route" choice. Every gear set slot
-- maps to exactly one fixed piece name.
--
-- What Namuwiki DOES document: most sets (22 of the 28) give each of the 6 slots its own
-- distinct flavor name (e.g. Eclipse Protocol's mask is "생물 재해 마스크", not "이클립스
-- 프로토콜 마스크"). The remaining 6 sets just use "[Set Name] + Slot" generically, with no
-- distinct naming, and are intentionally omitted below:
--   Striker's Battlegear, Umbra Initiative, Hotshot, Cavalier, Aegis, Ortiz: Exuro.
--
-- name_en is left NULL throughout: Namuwiki's set-item table is Korean-only and does not
-- give an official English piece name, so nothing is guessed/translated.

create table gear_set_pieces (
  id bigint generated always as identity primary key,
  gear_set_id bigint not null references gear_sets(id),
  slot text not null,
  name_ko text not null,
  name_en text,
  note text
);
alter table gear_set_pieces enable row level security;
create policy "public read" on gear_set_pieces for select using (true);

-- 1. Ongoing Directive (긴급 지휘명령)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(1, 'mask', '수집가 마스크', null, null),
(1, 'chest', '자원 고정대', null, null),
(1, 'backpack', '로드아웃 프레임', null, null),
(1, 'gloves', 'CQB 주먹 보호대', null, null),
(1, 'holster', '특수 탄약 권총집', null, null),
(1, 'kneepads', '무릎 받이', null, null);

-- 2. True Patriot (진정한 애국자)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(2, 'mask', '헤프트 A등급 마스크', null, null),
(2, 'chest', '애플턴 방탄복', null, null),
(2, 'backpack', '운전사 원정 팩', null, null),
(2, 'gloves', '로스 손 보호대', null, null),
(2, 'holster', '저마찰 권총집', null, null),
(2, 'kneepads', '셰리던 무릎 보호대', null, null);

-- 3. Hard Wired (하드 와이어드)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(3, 'mask', '"로즈우드" AR 마스크', null, null),
(3, 'chest', '"서펜타인" 배열 조끼', null, null),
(3, 'backpack', '"애버튼" 다이나모 캐리어', null, null),
(3, 'gloves', '"몰지" ESD 장갑', null, null),
(3, 'holster', '"울스워터" 프록시 장비', null, null),
(3, 'kneepads', '"스트라인" 안정화 패드', null, null);

-- 4. Aces & Eights (에이스 & 에이트)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(4, 'mask', '류드밀라 저격수 마스크', null, null),
(4, 'chest', '타니아 저소음 조끼', null, null),
(4, 'backpack', '지바 잠입용 팩', null, null),
(4, 'gloves', '로자 안정성 장갑', null, null),
(4, 'holster', '클라브디야 보조 무기 홀더', null, null),
(4, 'kneepads', '니나 포복 패드', null, null);

-- 5. Tip of the Spear (창끝) -- each piece is named after a character from the
-- miniseries Generation Kill, per Namuwiki footnote.
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(5, 'mask', '레이 얼굴 마스크', null, '제너레이션 킬 등장인물 ''레이'' 퍼슨에서 따온 이름'),
(5, 'chest', '라이트 전투 조끼', null, '제너레이션 킬 등장인물 에반 ''라이트''에서 따온 이름'),
(5, 'backpack', '브래드 전술 팩', null, '제너레이션 킬 등장인물 ''브래드'' 콜버트에서 따온 이름'),
(5, 'gloves', '리예스 전투 장갑', null, '제너레이션 킬 등장인물 루디 ''레예즈''에서 따온 이름'),
(5, 'holster', '릴리 권총집 시스템', null, '제너레이션 킬 등장인물 제이슨 ''릴리''에서 따온 이름'),
(5, 'kneepads', '트롬블리 무릎 보호대', null, '제너레이션 킬 등장인물 제임스 ''트롬블리''에서 따온 이름');

-- 6. Negotiator's Dilemma (협상가의 딜레마)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(6, 'mask', '간계 마스크', null, null),
(6, 'chest', '하이볼 방어구', null, null),
(6, 'backpack', '니블 백팩', null, null),
(6, 'gloves', '거울 장갑', null, null),
(6, 'holster', '유령 허벅지 부착형 장비', null, null),
(6, 'kneepads', '로우볼 무릎 보호대', null, null);

-- (Striker's Battlegear, id 7, skipped -- generic "기동타격대 + slot" naming only)

-- 8. System Corruption (시스템 손상)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(8, 'mask', '공격 벡터 마스크', null, null),
(8, 'chest', '복합 위협 방어구', null, null),
(8, 'backpack', '스택 오버플로우 보관함', null, null),
(8, 'gloves', '촉각 우회 장갑', null, null),
(8, 'holster', '프레임 주입 권총집', null, null),
(8, 'kneepads', '제로 데이 무릎 보호대', null, null);

-- 9. Eclipse Protocol (이클립스 프로토콜)
-- Note: "투자자"(Investor)/"버디"(Birdie) are NOT among these -- see header comment.
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(9, 'mask', '생물 재해 마스크', null, null),
(9, 'chest', '밀폐 가슴 보호대', null, null),
(9, 'backpack', '격리 가방', null, null),
(9, 'gloves', '의료용 전술 장갑', null, null),
(9, 'holster', 'PPE 적응 허벅지 부착형 장비', null, null),
(9, 'kneepads', '열상 방지 관절 차폐체', null, null);

-- 10. Future Initiative (미래 계획)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(10, 'mask', '전장의 안개 마스크', null, null),
(10, 'chest', '테라핀 방어 장구', null, null),
(10, 'backpack', '2k-RTS 라디오 캐리어', null, null),
(10, 'gloves', 'APM 조종사 장갑', null, null),
(10, 'holster', '돌진 전술기동 권총집', null, null),
(10, 'kneepads', '결속 무릎 보호대', null, null);

-- 11. Foundry Bulwark (주조소의 방패)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(11, 'mask', '내열성 마스크', null, null),
(11, 'chest', '단조 철판 방어구', null, null),
(11, 'backpack', '방탄판 캐리어', null, null),
(11, 'gloves', '용광로의 건틀릿', null, null),
(11, 'holster', '모루 공구 허리띠', null, null),
(11, 'kneepads', '망치 보호대', null, null);

-- 12. Hunter's Fury (사냥꾼의 격노)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(12, 'mask', '사냥꾼의 총구', null, null),
(12, 'chest', '사냥꾼의 우리', null, null),
(12, 'backpack', '사냥꾼의 키트', null, null),
(12, 'gloves', '사냥꾼의 발톱', null, null),
(12, 'holster', '사냥꾼의 화살통', null, null),
(12, 'kneepads', '사냥꾼의 걸음', null, null);

-- 13. Rigger (리거)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(13, 'mask', '리거 방진 마스크', null, null),
(13, 'chest', '리거 퀵액세스 하네스', null, null),
(13, 'backpack', '리거 기어백', null, null),
(13, 'gloves', '리거 미끄럼 방지 장갑', null, null),
(13, 'holster', '리거 다용도 파우치', null, null),
(13, 'kneepads', '리거 충돌 방지대', null, null);

-- 14. Heartbreaker (하트브레이커)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(14, 'mask', '호흡 은폐 마스크', null, null),
(14, 'chest', '불굴 조끼', null, null),
(14, 'backpack', '무하중 팩', null, null),
(14, 'gloves', '가벼운 손길 장갑', null, null),
(14, 'holster', '만반의 태세 권총집', null, null),
(14, 'kneepads', '강습병 무릎 보호대', null, null);

-- (Umbra Initiative id 15, Hotshot id 16, Cavalier id 17, Aegis id 19, Ortiz: Exuro id 18
--  skipped -- all use generic "[Set Name] + slot" naming only, no distinct piece names.)

-- 20. Breaking Point (한계점)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(20, 'mask', '길잡이의 마스크', null, null),
(20, 'chest', '포어프론트 방어구', null, null),
(20, 'backpack', '포인터의 백팩', null, null),
(20, 'gloves', '나이프포인트 장갑', null, null),
(20, 'holster', '데드아이 권총집', null, null),
(20, 'kneepads', '차저의 무릎 보호대', null, null);

-- 21. Virtuoso (거장)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(21, 'mask', '페르마타 마스크', null, null),
(21, 'chest', '브라부라 보호대', null, null),
(21, 'backpack', '메들리 백팩', null, null),
(21, 'gloves', '샤프 장갑', null, null),
(21, 'holster', '그레이브 권총집', null, null),
(21, 'kneepads', '살탄도 무릎 보호대', null, null);

-- 22. Refactor (리팩터)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(22, 'mask', '리폼한 마스크', null, null),
(22, 'chest', '개량된 조끼', null, null),
(22, 'backpack', '재구성한 백팩', null, null),
(22, 'gloves', '개편된 장갑', null, null),
(22, 'holster', '조정한 권총집', null, null),
(22, 'kneepads', '리모델링한 무릎 보호대', null, null);

-- 23. Measured Assembly (메저드 어셈블리)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(23, 'mask', '최종 마스크', null, null),
(23, 'chest', '최종 방어구', null, null),
(23, 'backpack', '계량 백팩', null, null),
(23, 'gloves', '계량 전술 장갑', null, null),
(23, 'holster', '최종 권총집', null, null),
(23, 'kneepads', '계량 무릎 보호대', null, null);

-- 24. Tipping Scales (기울어진 저울)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(24, 'mask', '지속 가능 마스크', null, null),
(24, 'chest', '파열 방지 플레이트', null, null),
(24, 'backpack', '지구력 백팩', null, null),
(24, 'gloves', '접착 장갑', null, null),
(24, 'holster', '닥 권총집', null, null),
(24, 'kneepads', '투지 무릎 보호대', null, null);

-- 25. Concentrated Company (집중된 중대)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(25, 'mask', '집중 마스크', null, null),
(25, 'chest', '고정 플레이트', null, null),
(25, 'backpack', '지향 배낭', null, null),
(25, 'gloves', '포인터 장갑', null, null),
(25, 'holster', '조준 권총집', null, null),
(25, 'kneepads', '추적 무릎 보호대', null, null);

-- 26. Core Strength (코어 근력)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(26, 'mask', '훈련 마스크', null, null),
(26, 'chest', '중량 조끼', null, null),
(26, 'backpack', '헬스장 백팩', null, null),
(26, 'gloves', '섀도우 복싱 장갑', null, null),
(26, 'holster', '마라톤 권총집', null, null),
(26, 'kneepads', '하체 운동 무릎 보호대', null, null);

-- 27. Ortiz: Reficere (오티즈: 레피세레)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(27, 'mask', '아크 마스크', null, null),
(27, 'chest', '테크 플레이트', null, null),
(27, 'backpack', '나노머신 캐리어', null, null),
(27, 'gloves', '고열 작업 장갑', null, null),
(27, 'holster', '열가소성 권총집', null, null),
(27, 'kneepads', '작업장 무릎 보호대', null, null);

-- 28. Ember Engine (엠버 엔진)
insert into gear_set_pieces (gear_set_id, slot, name_ko, name_en, note) values
(28, 'mask', 'SCBA 마스크', null, null),
(28, 'chest', '폭발 방지 플레이트', null, null),
(28, 'backpack', '탱크 캐리어', null, null),
(28, 'gloves', '방화 장갑', null, null),
(28, 'holster', '핫 핸드 권총집', null, null),
(28, 'kneepads', '방화 무릎 보호대', null, null);
