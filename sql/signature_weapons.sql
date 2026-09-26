-- signature_weapons: 전문화별 시그니처 무기 카탈로그 + 빌드에 선택한 시그니처 무기 컬럼, 나무위키 기준.
-- 출처: 나무위키 "톰 클랜시의 디비전 2/전문화" (https://namu.wiki/w/톰 클랜시의 디비전 2/전문화)
--   해당 문서 최근 수정 시각: 2026-08-11 19:16:20
-- 확인일: 2026-09-26
-- 전문화 6개(기본 3 + 잠금 해제 3), 각 전문화당 시그니처 무기 1개.

create table signature_weapons (
  id bigint generated always as identity primary key,
  specialization_ko text not null,  -- 전문화 한국어명, 예: '폭파 전문가'
  name_ko text not null             -- 시그니처 무기 한국어명, 예: 'M32A1 다연발 유탄 발사기'
);
alter table signature_weapons enable row level security;
create policy "public read" on signature_weapons for select using (true);

insert into signature_weapons (specialization_ko, name_ko) values
('폭파 전문가', 'M32A1 다연발 유탄 발사기'),
('생존 전문가', '석궁'),
('명사수', 'TAC-50 C 소총'),
('기관포병', '미니건'),
('기술 전문가', 'P-017 미사일 발사기'),
('화염방사병', 'K8-제트스트림 화염방사기');

alter table farm_builds add column signature text;
