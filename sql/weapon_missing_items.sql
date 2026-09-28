-- 나무위키에는 있으나 DB에 없던 무기 2개 추가 + 인터체인지 분류 수정 (Raigulus Build Maker와 대조).
-- 출처: 나무위키 "톰 클랜시의 디비전 2/특급 장비" (버티고 3.3.7절, 아드레스티아 SR-1 언급), "/무기" 4.5.4 SR-1절
-- 확인일: 2026-09-26
--
-- * 버티고(Vertigo): 특급 경기관총(GR9 기반). 핵심속성 경기관총 대미지 + 비엄폐 대상 대미지.
--   부착물(나무위키 원문): 버티고 조준경 +15% 치명타 확률 / 버티고 탄창 +50 탄약 / 버티고 총열 하단부 +15% 재장전 속도 / 버티고 총구 +10% 발사 속도.
-- * 아드레스티아 SR-1: 나무위키에는 전용 절이 없고, 특급 장비 문서(네메시스 습득 방법)에 "아드레스티아 SR-1 지정사수소총"으로만 나온다.
--   Raigulus에는 Adrestia(일반 지정사수소총, SR-1과 같은 기본 스펙 409.4k/60RPM/5발/50m)로 있어 SR-1 계열 일반 무기로 넣는다.
-- * 인터체인지: 사용자 확인으로 기관단총(ar → smg).

update weapon_named set weapon_group = 'smg' where item_key = 'weapon:interchange';

insert into weapon_models (item_key, name_key, name_ko, name_en, weapon_group, family, rarity_tier, rpm, base_mag_size, base_damage, optimal_range) values
('weapon:adrestia', 'adrestia', '아드레스티아 SR-1', 'Adrestia', 'dmr', 'SR-1', 'highend', null, null, null, null);

insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values
('7cb0fb2be94ea5a6', '버티고', 'Vertigo', 'lmg', '대경실색',
 '이 무기로 인하여 적이 제압되면 해당 적에게 혼란 상태이상이 부여되며 자신을 포함한 아군이 15초 동안 +30% 비엄폐 대상 대미지 효과를 받습니다.',
 '[{"num": 15, "type": "치명타 확률", "unit": "%"}, {"num": 50, "type": "탄약", "unit": ""}, {"num": 15, "type": "재장전 속도", "unit": "%"}, {"num": 10, "type": "발사 속도", "unit": "%"}]'::jsonb,
 '특별 이벤트 ''레드 문 라이징''에서 네임드 쿼드콥터 ''피비'' 격추 시 일정 확률로 획득.');

insert into weapon_fixed_mods (weapon_name_ko, weapon_name_en, slot, name_ko, effect_ko) values
('버티고', 'Vertigo', 'optic', '버티고 조준경', '+15% 치명타 확률'),
('버티고', 'Vertigo', 'magazine', '버티고 탄창', '+50 탄약'),
('버티고', 'Vertigo', 'underbarrel', '버티고 총열 하단부', '+15% 재장전 속도'),
('버티고', 'Vertigo', 'muzzle', '버티고 총구', '+10% 발사 속도');
