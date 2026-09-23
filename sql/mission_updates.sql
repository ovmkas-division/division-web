-- Battle for Brooklyn main missions found via Namuwiki (톰 클랜시의 디비전 2/임무)
-- that are not yet present in the missions table. Namuwiki: 브루클린 섹션 (4.4).
-- English names cross-checked against thedivision.fandom.com/wiki/Missions_in_Tom_Clancy's_The_Division_2
-- ("Battle for Brooklyn" > Main Missions). "The Art Museum" already exists (see mission_fixes.sql).

insert into missions (name_en, alt_names, name_ko) values ('CERA Clinic', '{}', 'CERA 진료소');
insert into missions (name_en, alt_names, name_ko) values ('DUMBO Skate Park', '{}', '덤보 스케이트 공원');
insert into missions (name_en, alt_names, name_ko) values ('H5 Refinery', '{}', 'H5 정유소');
insert into missions (name_en, alt_names, name_ko) values ('Clarke Street Hotel', array['Clark Street'], '클라크 스트리트');
insert into missions (name_en, alt_names, name_ko) values ('Bridge Park Pier', array['Bridge Park Docks'], '브리지 파크 부두');
insert into missions (name_en, alt_names, name_ko) values ('Army Terminal', '{}', '아미 터미널');
