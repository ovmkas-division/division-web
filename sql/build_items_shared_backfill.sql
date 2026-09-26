-- 공유 중인 빌드 안의 항목이 비공개라 친구에게 "삭제된 항목"으로 보이던 것을 고친다.
-- 앞으로는 빌드를 저장할 때 코드가 항목의 공유 설정을 빌드에 맞추고, 이 SQL은 이미 만들어진 빌드용이다.

update farm_custom_items i
set shared = true
where i.shared = false
  and exists (
    select 1 from farm_builds b
    where b.shared
      and i.id in (b.weapon1_id, b.weapon2_id, b.weapon3_id, b.mask_id, b.backpack_id,
                   b.chest_id, b.gloves_id, b.holster_id, b.kneepads_id)
  );
