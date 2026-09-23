create table farm_custom_items (
  id bigint generated always as identity primary key,
  category text not null,
  kind text not null check (kind in ('일반', '네임드', '특급')),
  name text not null,
  main_attr text,
  sub_attrs text[] not null default '{}',
  special_effect text,
  created_at timestamptz not null default now()
);

alter table farm_custom_items enable row level security;

create policy "logged in users can access" on farm_custom_items
  for all using (auth.role() = 'authenticated');
