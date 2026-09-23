alter table farm_custom_items drop constraint farm_custom_items_kind_check;

alter table farm_custom_items
  add constraint farm_custom_items_kind_check
  check (kind in ('일반', '네임드', '특급', '세트'));
