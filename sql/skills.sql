-- skills: SHD 스킬 카테고리 및 세부 변형(모드) 목록, 나무위키 기준.
-- 출처: 나무위키 "톰 클랜시의 디비전 2/스킬" (https://namu.wiki/w/톰 클랜시의 디비전 2/스킬)
--   해당 문서 최근 수정 시각: 2026-08-26 09:15:49
-- 확인일: 2026-09-24
--
-- 문서의 목차(2. 스킬)는 실제 게임에 현재 존재하는 12개 스킬 카테고리와 그 아래의
-- 세부 변형 소제목을 그대로 반영한다(자동 생성된 헤더 기반 목차이므로 편집자가 문서에서
-- 지운 변형은 애초에 나타나지 않는다). 문서 본문 전체를 확인한 결과 "이 변형은 게임에서
-- 제거되었다"는 서술은 없었고, 미끼(Decoy) 카테고리는 "미끼는 변형스킬이 없다"고 명시되어
-- 있어 세부 변형 없이 스킬 자체가 하나뿐인 카테고리로 처리했다(홀로그램 교란 1건만 등록).
--
-- 카테고리 12개, 세부 변형 43개.

create table skills (
  id bigint generated always as identity primary key,
  category_key text not null,   -- 영문 slug, 예: 'turret'
  category_ko text not null,    -- 카테고리 한국어명, 예: '터렛'
  name_ko text not null         -- 세부 변형 한국어명, 예: '기관총 터렛'
);
alter table skills enable row level security;
create policy "public read" on skills for select using (true);

insert into skills (category_key, category_ko, name_ko) values
-- 1. 펄스
('pulse', '펄스', '스캐너'),
('pulse', '펄스', '원격 장치'),
('pulse', '펄스', '교란기'),
('pulse', '펄스', '밴시'),
('pulse', '펄스', '아킬레우스'),
-- 2. 터렛
('turret', '터렛', '기본'),
('turret', '터렛', '소각'),
('turret', '터렛', '저격'),
('turret', '터렛', '포격'),
-- 3. 하이브
('hive', '하이브', '복원'),
('hive', '하이브', '말벌'),
('hive', '하이브', '소생'),
('hive', '하이브', '부스터'),
('hive', '하이브', '기능장'),
-- 4. 화학물질 발사기
('chem_launcher', '화학물질 발사기', '보강'),
('chem_launcher', '화학물질 발사기', '가연성 가스탄'),
('chem_launcher', '화학물질 발사기', '진압용 포말'),
('chem_launcher', '화학물질 발사기', '산화제'),
-- 5. 파이어플라이
('firefly', '파이어플라이', '시력 상실'),
('firefly', '파이어플라이', '파열'),
('firefly', '파이어플라이', '철거'),
-- 6. 대인 유도 지뢰
('seeker_mine', '대인 유도 지뢰', '폭발성'),
('seeker_mine', '대인 유도 지뢰', '공중 폭발'),
('seeker_mine', '대인 유도 지뢰', '집속탄'),
('seeker_mine', '대인 유도 지뢰', '수리 장치'),
-- 7. 드론
('drone', '드론', '타격기'),
('drone', '드론', '방어기'),
('drone', '드론', '폭격기'),
('drone', '드론', '수리기'),
('drone', '드론', '전술기'),
-- 8. 방패
('shield', '방패', '보루'),
('shield', '방패', '성전사'),
('shield', '방패', '반사'),
('shield', '방패', '강습'),
-- 9. 점착 폭탄
('sticky_bomb', '점착 폭탄', '폭발성'),
('sticky_bomb', '점착 폭탄', '화상'),
('sticky_bomb', '점착 폭탄', 'EMP'),
-- 10. 덫
('trap', '덫', '충격'),
('trap', '덫', '수리'),
('trap', '덫', '파편화'),
-- 11. 미끼 (변형 없음, 스킬 자체 1종)
('decoy', '미끼', '홀로그램 교란'),
-- 12. 스마트 엄폐물
('smart_cover', '스마트 엄폐물', '정밀화'),
('smart_cover', '스마트 엄폐물', '요새화')
;
