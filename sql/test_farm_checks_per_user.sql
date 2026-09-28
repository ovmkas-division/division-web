-- 체크가 사용자별로 분리됐는지 확인하는 테스트. farm_checks_per_user.sql을 실행한 뒤에 실행한다.
-- 임시 사용자 2명을 만들어 A/B로 번갈아 체크하고, 마지막에 일부러 예외를 내서 전부 취소한다(흔적이 남지 않는다).
-- 결과는 오류 메시지 안에 나온다. 기대값과 다르면 분리가 안 된 것이다.

do $$
declare
  a uuid := gen_random_uuid();
  b uuid := gen_random_uuid();
  a_sees int; b_sees_before int; b_sees_after int; a_sees_after_b_delete int;
begin
  insert into auth.users (id, instance_id, aud, role, email) values
    (a, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'test-a@example.invalid'),
    (b, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', 'test-b@example.invalid');

  set local role authenticated;

  -- A가 체크
  perform set_config('request.jwt.claims', json_build_object('sub', a, 'role', 'authenticated')::text, true);
  insert into farm_item_checks (item_key) values ('__test__|1');
  select count(*) into a_sees from farm_item_checks where item_key = '__test__|1';

  -- B로 전환: A의 체크가 안 보여야 한다
  perform set_config('request.jwt.claims', json_build_object('sub', b, 'role', 'authenticated')::text, true);
  select count(*) into b_sees_before from farm_item_checks where item_key = '__test__|1';

  -- B도 같은 항목을 체크할 수 있어야 한다
  insert into farm_item_checks (item_key) values ('__test__|1');
  select count(*) into b_sees_after from farm_item_checks where item_key = '__test__|1';

  -- B가 해제해도 A의 체크는 남아야 한다
  delete from farm_item_checks where item_key = '__test__|1';
  perform set_config('request.jwt.claims', json_build_object('sub', a, 'role', 'authenticated')::text, true);
  select count(*) into a_sees_after_b_delete from farm_item_checks where item_key = '__test__|1';

  reset role;
  raise exception '테스트 결과 (기대값과 같으면 성공) — A가 체크 후 A가 보는 수=% (기대 1) / B가 보는 수=% (기대 0) / B가 체크 후 B가 보는 수=% (기대 1) / B가 해제한 뒤 A가 보는 수=% (기대 1)',
    a_sees, b_sees_before, b_sees_after, a_sees_after_b_delete;
end $$;
