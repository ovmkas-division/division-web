-- 파밍 체크(획득 여부)를 사용자별로 분리한다. 지금까지는 로그인한 모두가 같은 체크 목록을 공유했다.
-- 기존 체크 기록은 아래 이메일 계정의 것으로 옮긴다. 이메일이 다르면 바꿔서 실행할 것.
-- 소유자를 못 찾으면 예외를 내고 전체가 취소된다(기존 기록은 지워지지 않는다).
-- 코드(index.html)는 수정할 필요 없다: user_id 기본값이 auth.uid()이고, 읽기/삭제는 RLS가 본인 것만 걸러준다.

begin;

alter table farm_item_checks add column user_id uuid references auth.users(id) default auth.uid();

update farm_item_checks
set user_id = (
  select id from auth.users
  where email in ('alspalsp5475@gmail.com', 'alspalsp5475@naver.com')
  order by created_at
  limit 1
)
where user_id is null;

do $$
begin
  if exists (select 1 from farm_item_checks where user_id is null) then
    raise exception '기존 체크의 소유자 계정을 찾지 못했습니다. 위 이메일을 로그인 계정 이메일로 바꿔서 다시 실행하세요.';
  end if;
end $$;

alter table farm_item_checks alter column user_id set not null;
alter table farm_item_checks drop constraint farm_item_checks_pkey;
alter table farm_item_checks add primary key (user_id, item_key);

drop policy "logged in users can access" on farm_item_checks;
create policy "own checks only" on farm_item_checks
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

commit;
