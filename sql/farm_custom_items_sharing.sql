alter table farm_custom_items add column shared boolean not null default false;

drop policy "own items only" on farm_custom_items;

create policy "select own or shared" on farm_custom_items
  for select using (auth.uid() = user_id or shared = true);

create policy "insert own" on farm_custom_items
  for insert with check (auth.uid() = user_id);

create policy "update own" on farm_custom_items
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "delete own" on farm_custom_items
  for delete using (auth.uid() = user_id);
