-- 무기/방어구 속성 카탈로그 정규화.
-- 출처: 나무위키 "톰 클랜시의 디비전 2/무기" 3장(무기 속성 테이블), "톰 클랜시의 디비전 2/보호장구" 3장(보호장구 속성 테이블).
-- 확인일: 2026-09-24
--
-- 무기와 방어구는 속성 체계 자체가 다르다:
--   방어구: 핵심속성 3종 중 1개 택1 + 카테고리별(무기/방어도/스킬) 비핵심속성 12종
--   무기:   무기군마다 정해진 핵심속성 1~2개(전 무기군 공용 "무기 대미지" + 무기군별 고유 스탯) + 공용 비핵심속성 13종
--   (나무위키 원문 표기는 "무기군 대미지"이나 실제 게임 UI 표기에 맞춰 "무기 대미지"로 통일)
--
-- 권총(pistol)의 고유 핵심속성은 나무위키 문서 자체에 누락되어 있어("핵심 속성" 표에
-- 권총 행이 없음, 5.1 권총 섹션에도 서술 없음) 확인된 "무기 대미지" 하나만 넣는다.
-- 추후 정확한 값이 확인되면 weapon_core_attrs에 행을 추가하면 된다.

create table gear_core_attrs (
  id bigint generated always as identity primary key,
  name_ko text not null,
  color text not null
);
alter table gear_core_attrs enable row level security;
create policy "public read" on gear_core_attrs for select using (true);

insert into gear_core_attrs (name_ko, color) values
('무기 대미지', 'red'),
('방어도', 'blue'),
('스킬 등급', 'yellow');

create table gear_secondary_attrs (
  id bigint generated always as identity primary key,
  category_ko text not null,
  color text not null,
  name_ko text not null
);
alter table gear_secondary_attrs enable row level security;
create policy "public read" on gear_secondary_attrs for select using (true);

insert into gear_secondary_attrs (category_ko, color, name_ko) values
('무기', 'red', '무기 조작력'),
('무기', 'red', '치명타 확률'),
('무기', 'red', '치명타 대미지'),
('무기', 'red', '헤드샷 대미지'),
('방어도', 'blue', '방어도 재생'),
('방어도', 'blue', '상태이상 저항'),
('방어도', 'blue', '생명력'),
('방어도', 'blue', '폭발물 저항'),
('스킬', 'yellow', '스킬 대미지'),
('스킬', 'yellow', '스킬 회복'),
('스킬', 'yellow', '스킬 가속'),
('스킬', 'yellow', '상태이상 효과');

create table weapon_core_attrs (
  id bigint generated always as identity primary key,
  weapon_group text not null,
  name_ko text not null
);
alter table weapon_core_attrs enable row level security;
create policy "public read" on weapon_core_attrs for select using (true);

insert into weapon_core_attrs (weapon_group, name_ko) values
('ar', '무기 대미지'), ('ar', '생명력 대미지'),
('rifle', '무기 대미지'), ('rifle', '치명타 대미지'),
('dmr', '무기 대미지'), ('dmr', '헤드샷 대미지'),
('smg', '무기 대미지'), ('smg', '치명타 확률'),
('lmg', '무기 대미지'), ('lmg', '비엄폐 대상 대미지'),
('sg', '무기 대미지'), ('sg', '방어도 대상 대미지'),
('pistol', '무기 대미지');

create table weapon_secondary_attrs (
  id bigint generated always as identity primary key,
  name_ko text not null
);
alter table weapon_secondary_attrs enable row level security;
create policy "public read" on weapon_secondary_attrs for select using (true);

insert into weapon_secondary_attrs (name_ko) values
('재장전 속도'), ('안정성'), ('명중률'), ('적정 사거리'), ('탄창 용량'),
('발사 속도'), ('교체 속도'), ('치명타 확률'), ('치명타 대미지'),
('헤드샷 대미지'), ('생명력 대미지'), ('비엄폐 대상 대미지'), ('방어도 대상 대미지');

-- 방어구 개조("모듈") — 마스크/방탄복/백팩에만 존재. 나무위키에 전체 종류 목록이
-- 정리되어 있지 않아("정예 대상 방호도" 하나만 명시적으로 확인됨) 고정 선택지 대신
-- 자동완성용 참고 목록으로만 쓴다(사이트에서는 자유 입력 + 이 목록 자동완성).
create table gear_mods (
  id bigint generated always as identity primary key,
  name_ko text not null
);
alter table gear_mods enable row level security;
create policy "public read" on gear_mods for select using (true);

insert into gear_mods (name_ko) values
('정예 대상 방호도');

alter table farm_custom_items add column gear_mod text;
