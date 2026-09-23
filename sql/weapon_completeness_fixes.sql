-- Weapon completeness pass (Namuwiki re-verification, 2026-09-23)
--
-- Source articles checked against weapon_models / weapon_named / weapon_exotic / weapon_talents:
--   - 톰 클랜시의 디비전 2/무기         (base weapon models + general talent catalog)
--   - 톰 클랜시의 디비전 2/네임드 장비   (named weapons section)
--   - 톰 클랜시의 디비전 2/특급 장비     (exotic weapons section)
--
-- Results:
--   weapon_models  (175 rows): 0 missing. Every base weapon + variant (경찰용/군용/블랙마켓/커스텀/
--     전술용/클래식/강화형/보병용/해병대용/개조형/사냥용/공수부대용/장교용 prefixes) listed on the
--     무기 article's stat tables is present. DB additionally carries "리플리카" variants that this
--     particular article doesn't document (they belong to a Conflict/Countdown-mode reskin system) -
--     that's extra data, not a gap, so nothing to add.
--   weapon_exotic  (46 rows): 0 missing. The 특급 장비 article's table of contents lists exactly
--     46 exotic weapons across ar/lmg/mmr/pistol/rifle/shotgun/smg, and every one of them already
--     has a matching row (weapon_group values also all correct).
--   weapon_talents (65 rows): 0 missing. Every general/rollable talent in the 무기 article's 8.
--     특수효과 section (and its "완벽한 X" pairing) already exists.
--   weapon_named   (107 rows): 1 missing item found (중첩 브로커 / Stack Broker), plus 1 bogus row
--     that doesn't correspond to any real item on Namuwiki and should be removed.

-- ---------------------------------------------------------------------------
-- MISSING: 중첩 브로커 (Stack Broker), a named ACS-12 shotgun added as a
-- "2025년 11월 25일 ~ 12월 6일" login/veteran-reward item (same reward track as
-- 렉싱턴). Documented at 톰 클랜시의 디비전 2/네임드 장비 § 3.1.4 산탄총, but absent
-- from weapon_named entirely. It has no rollable talent (고유 능력치 only, like
-- 렉싱턴/첫눈에 반하다/손바구니), just fixed base-stat modifiers:
--   -17% 기본 대미지, +20% 기본 발사 속도
-- item_key synthesized in the same "weapon:<slug>" style already used for other
-- manually-added rows (e.g. weapon:invisiblehand, weapon:namedsasg12).
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko)
values (
  'weapon:stackbroker',
  '중첩 브로커',
  'Stack Broker',
  'shotgun',
  'ACS-12',
  null,
  null,
  '[{"num": -17, "type": "기본 대미지", "unit": "%"}, {"num": 20, "type": "기본 발사 속도", "unit": "%"}]'::jsonb,
  '특별 이벤트 보상'
);

-- ---------------------------------------------------------------------------
-- DATA ERROR (secondary finding): "네임드 SASG-12" / "Named SASG-12" is not a
-- real item. It does not appear anywhere on the 무기, 네임드 장비, or 특급 장비
-- Namuwiki articles - "Named SASG-12" isn't an in-game item name, it reads like
-- a leftover placeholder from the original items.db import (a generic
-- SASG-12 + Preservation-talent row with variant/drop_location left null).
-- The real SASG-12-based named weapon is already correctly present as
-- 쓰나미 (Tsunami, variant 전술용 SASG-12 K, talent 완벽한 연속 타격). Removing
-- the phantom row rather than updating it, since there is nothing genuine to
-- correct it into.
delete from weapon_named where item_key = 'weapon:namedsasg12';
