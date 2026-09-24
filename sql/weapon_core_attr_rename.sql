-- weapon_core_attrs에 나무위키 원문 그대로 "무기군 대미지"로 넣었던 걸
-- 실제 게임 UI 표기에 맞춰 "무기 대미지"로 통일한다.
update weapon_core_attrs set name_ko = '무기 대미지' where name_ko = '무기군 대미지';
