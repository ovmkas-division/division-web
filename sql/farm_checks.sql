drop table if exists farm_checks;

create table farm_item_checks (
  item_key text primary key,
  checked_at timestamptz not null default now()
);

alter table farm_item_checks enable row level security;

create policy "logged in users can access" on farm_item_checks
  for all using (auth.role() = 'authenticated');
