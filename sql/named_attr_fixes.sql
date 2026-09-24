-- 네임드 talent 검증(named_talent_fixes.sql) 중 발견된 별개의 attrs 오류 수정.
-- 출처: 나무위키 "톰 클랜시의 디비전 2/네임드 장비" (확인일: 2026-09-24)

-- 날카로운 발톱 (Claws Out, holster) — 나무위키는 "+500% 근접 대미지, +11% 권총 대미지"
-- 2개 속성인데 DB에는 근접 대미지만 저장되어 있어 권총 대미지를 추가한다.
update gear_named
set attrs = '[{"num": 500.0, "type": "근접 대미지", "unit": "%"}, {"num": 11, "type": "권총 대미지", "unit": "%"}]'::jsonb
where item_key = 'f71fcfef6da0de3e';

-- 수확 (The Harvest, pistol) — 나무위키 기본 발사 속도 -7.4%인데 DB는 -7%로 반올림되어 있어 수정한다.
update weapon_named
set attrs = '[{"num": 10, "type": "기본 대미지", "unit": "%"}, {"num": -7.4, "type": "발사 속도", "unit": "%"}]'::jsonb
where item_key = 'dcd5a7db381db784';
