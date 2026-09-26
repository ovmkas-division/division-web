-- 무기 핵심속성의 공용 "무기 대미지"를 실제 게임 표기인 무기군별 이름("산탄총 대미지" 등)으로 바꾼다.
-- 나무위키 무기 문서의 핵심속성 표는 이를 "무기군 대미지"(무기군 공용)라고 적는다.
-- 방어구의 핵심속성 "무기 대미지"(gear_core_attrs)는 그대로 둔다 — 방어구 쪽 표기가 맞다.
-- 확인일: 2026-09-26 (사용자 확인: 산탄총 핵심속성 = 산탄총 대미지 + 방어도 대상 대미지)
--
-- 권총(pistol)은 나무위키에 고유 핵심속성이 없어 "권총 대미지" 하나만 둔다(weapon_gear_attr_catalogs.sql 참고).

update weapon_core_attrs set name_ko = case weapon_group
  when 'ar' then '돌격소총 대미지'
  when 'rifle' then '소총 대미지'
  when 'dmr' then '지정사수소총 대미지'
  when 'smg' then '기관단총 대미지'
  when 'lmg' then '경기관총 대미지'
  when 'sg' then '산탄총 대미지'
  when 'pistol' then '권총 대미지'
end
where name_ko = '무기 대미지';

-- 이미 저장된 무기 항목의 핵심속성도 같이 바꾼다 (방어구 항목은 category가 달라 영향 없음).
update farm_custom_items set main_attrs = array_replace(main_attrs, '무기 대미지', case category
  when 'ar' then '돌격소총 대미지'
  when 'rifle' then '소총 대미지'
  when 'dmr' then '지정사수소총 대미지'
  when 'smg' then '기관단총 대미지'
  when 'lmg' then '경기관총 대미지'
  when 'sg' then '산탄총 대미지'
  when 'pistol' then '권총 대미지'
end)
where category in ('ar', 'rifle', 'dmr', 'smg', 'lmg', 'sg', 'pistol') and '무기 대미지' = any(main_attrs);
