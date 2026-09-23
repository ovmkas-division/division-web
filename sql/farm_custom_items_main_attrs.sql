alter table farm_custom_items add column main_attrs text[] not null default '{}';

update farm_custom_items
set main_attrs = array[main_attr]
where main_attr is not null and main_attr <> '';

alter table farm_custom_items drop column main_attr;
