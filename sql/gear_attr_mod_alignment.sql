-- 방어구 보조속성/개조를 Raigulus Build Maker와 항목 맞춤.
-- 확인일: 2026-09-26
-- 출처: Raigulus(div2hub/game-data, Y8S3) 항목 목록. 나무위키에는 개조 목록이 없다(gear_mods_catalog.sql 참고).
--
-- 1) 방어구 보조속성에 "받는 치유 효과"(Incoming Repairs) 추가 — 방어도(파랑) 분류.
-- 2) 개조에 "시력/청력 상실 저항"(Blind/Deaf Resistance) 추가 — 사용자가 알려준 한국어 표기.
-- 3) 개조 분류 이름을 공격/방어/스킬로 맞춘다 (기존: 무기/방어도/스킬).

insert into gear_secondary_attrs (category_ko, color, name_ko) values
('방어도', 'blue', '받는 치유 효과');

insert into gear_mods (category_ko, name_ko) values
('방어', '시력/청력 상실 저항');

update gear_mods set category_ko = '공격' where category_ko = '무기';
update gear_mods set category_ko = '방어' where category_ko = '방어도';
