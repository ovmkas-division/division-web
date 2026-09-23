-- 기존에 테스트로 만든 항목은 누가 만들었는지 구분할 방법이 없어서 정리합니다.
delete from farm_custom_items;

alter table farm_custom_items
  add column user_id uuid not null default auth.uid() references auth.users(id);

drop policy "logged in users can access" on farm_custom_items;

create policy "own items only" on farm_custom_items
  for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
