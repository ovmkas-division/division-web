create table farm_builds (
  id bigint generated always as identity primary key,
  user_id uuid not null default auth.uid() references auth.users(id),
  name text not null,
  skill1 text,
  skill2 text,
  weapon1_id bigint references farm_custom_items(id) on delete set null,
  weapon2_id bigint references farm_custom_items(id) on delete set null,
  weapon3_id bigint references farm_custom_items(id) on delete set null,
  mask_id bigint references farm_custom_items(id) on delete set null,
  backpack_id bigint references farm_custom_items(id) on delete set null,
  chest_id bigint references farm_custom_items(id) on delete set null,
  gloves_id bigint references farm_custom_items(id) on delete set null,
  holster_id bigint references farm_custom_items(id) on delete set null,
  kneepads_id bigint references farm_custom_items(id) on delete set null,
  shared boolean not null default false,
  created_at timestamptz not null default now()
);

alter table farm_builds enable row level security;

create policy "select own or shared" on farm_builds
  for select using (auth.uid() = user_id or shared = true);

create policy "insert own" on farm_builds
  for insert with check (auth.uid() = user_id);

create policy "update own" on farm_builds
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "delete own" on farm_builds
  for delete using (auth.uid() = user_id);
