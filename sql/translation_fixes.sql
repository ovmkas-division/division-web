-- Translation audit fixes (2026-09-22)
-- Scope: only the rows found broken during a QA pass over gear_items.sql / weapon_items.sql
-- (already-seeded tables). See audit notes below each statement.

-- 1) gear_exotic: "Acosta's Go-Bag" name_ko was "아코스타의 고백" ("confession"),
--    a mistranslation of "Go-Bag". Community/Namuwiki convention is "아코스타의 비상가방"
--    (confirmed via Namuwiki 특급 장비 + multiple DCInside/Ruliweb threads).
update gear_exotic
set name_ko = '아코스타의 비상가방'
where item_key = '000c233b242c3824';

-- 2) gear_exotic: "Tardigrade Armor System" name_ko was "타디그레이드 방어체계".
--    Community/official convention (Namuwiki, Ubisoft KR help article, Ruliweb) is
--    "타디그레이드 방탄복 시스템".
update gear_exotic
set name_ko = '타디그레이드 방탄복 시스템'
where item_key = '2f8af61b6340fa6f';

-- 3) weapon_named: "Handbasket" (Surplus SVD) attrs were garbled/untranslated:
--    {"num":230326,"unit":"","type":"기본 대미지"},{"num":-200,"unit":"","type":"RPM"}
--    Namuwiki confirms the real stat line is "+147% 기본 대미지" / "-77% 기본 발사 속도".
--    "RPM" was also left untranslated (English leftover in a Korean-only field).
update weapon_named
set attrs = '[{"num":147,"unit":"%","type":"기본 대미지"},{"num":-77,"unit":"%","type":"기본 발사 속도"}]'::jsonb
where item_key = '55b9c4a910487060';
