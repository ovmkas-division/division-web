-- ===== schema =====

create table item_slots (
  code text primary key,
  name_ko text not null,
  name_en text not null,
  category text not null check (category in ('무기','부위'))
);

create table missions (
  id bigint generated always as identity primary key,
  name_en text not null unique,
  alt_names text[] not null default '{}',
  name_ko text not null
);

create table gear_sets (
  id bigint generated always as identity primary key,
  name_en text not null unique,
  alt_names text[] not null default '{}',
  name_ko text not null,
  core_attributes text[] not null,
  note text
);

create table gear_set_bonuses (
  id bigint generated always as identity primary key,
  gear_set_id bigint not null references gear_sets(id) on delete cascade,
  piece_count text not null check (piece_count in ('2','3','4','chest','pack')),
  effect_name text,
  effect_text text not null
);

create table brand_sets (
  id bigint generated always as identity primary key,
  name_en text not null unique,
  alt_names text[] not null default '{}',
  name_ko text not null,
  core_attributes text[] not null,
  note text
);

create table brand_set_bonuses (
  id bigint generated always as identity primary key,
  brand_set_id bigint not null references brand_sets(id) on delete cascade,
  piece_count int not null check (piece_count in (1,2,3)),
  effect_text text not null
);

alter table item_slots enable row level security;
alter table missions enable row level security;
alter table gear_sets enable row level security;
alter table gear_set_bonuses enable row level security;
alter table brand_sets enable row level security;
alter table brand_set_bonuses enable row level security;

create policy "public read" on item_slots for select using (true);
create policy "public read" on missions for select using (true);
create policy "public read" on gear_sets for select using (true);
create policy "public read" on gear_set_bonuses for select using (true);
create policy "public read" on brand_sets for select using (true);
create policy "public read" on brand_set_bonuses for select using (true);


-- ===== seed: item_slots =====

insert into item_slots (code, name_ko, name_en, category) values ('ar', '돌격소총', 'Assault Rifle', '무기');

insert into item_slots (code, name_ko, name_en, category) values ('lmg', '경기관총', 'LMG', '무기');

insert into item_slots (code, name_ko, name_en, category) values ('mmr', '지정사수소총', 'Marksman Rifle', '무기');

insert into item_slots (code, name_ko, name_en, category) values ('pistol', '권총', 'Pistol', '무기');

insert into item_slots (code, name_ko, name_en, category) values ('rifle', '소총', 'Rifle', '무기');

insert into item_slots (code, name_ko, name_en, category) values ('shotgun', '산탄총', 'Shotgun', '무기');

insert into item_slots (code, name_ko, name_en, category) values ('smg', '기관단총', 'SMG', '무기');

insert into item_slots (code, name_ko, name_en, category) values ('mask', '마스크', 'Mask', '부위');

insert into item_slots (code, name_ko, name_en, category) values ('backpack', '배낭', 'Backpack', '부위');

insert into item_slots (code, name_ko, name_en, category) values ('chest', '조끼', 'Body Armor', '부위');

insert into item_slots (code, name_ko, name_en, category) values ('gloves', '장갑', 'Gloves', '부위');

insert into item_slots (code, name_ko, name_en, category) values ('holster', '권총집', 'Holster', '부위');

insert into item_slots (code, name_ko, name_en, category) values ('kneepads', '무릎 보호대', 'Kneepads', '부위');


-- ===== seed: missions =====

insert into missions (name_en, alt_names, name_ko) values ('Grand Washington Hotel', '{}', '그랜드 워싱턴 호텔');

insert into missions (name_en, alt_names, name_ko) values ('Jefferson Trade Center', '{}', '제퍼슨 무역 센터');

insert into missions (name_en, alt_names, name_ko) values ('ViewPoint Museum', '{}', '뷰포인트 박물관');

insert into missions (name_en, alt_names, name_ko) values ('American History Museum', array['National Museum of American History','Museum of American History'], '국립 미국사 박물관');

insert into missions (name_en, alt_names, name_ko) values ('Air & Space Museum', array['Air and Space Museum','National Air and Space Museum'], '항공우주 박물관');

insert into missions (name_en, alt_names, name_ko) values ('Space Administration HQ', array['Space Administration Headquarters','NOA Headquarters','NASA HQ'], '미항공우주국 본부');

insert into missions (name_en, alt_names, name_ko) values ('Jefferson Plaza', '{}', '제퍼슨 플라자');

insert into missions (name_en, alt_names, name_ko) values ('Bank Headquarters', array['Bank HQ'], '은행 본부');

insert into missions (name_en, alt_names, name_ko) values ('DCD Headquarters', array['DCD HQ'], '질병통제본부');

insert into missions (name_en, alt_names, name_ko) values ('Potomac Event Center', '{}', '포토맥 이벤트 센터');

insert into missions (name_en, alt_names, name_ko) values ('Lincoln Memorial', '{}', '링컨 기념관');

insert into missions (name_en, alt_names, name_ko) values ('Federal Emergency Bunker', array['Federal Bunker'], '연방 비상 방공호');

insert into missions (name_en, alt_names, name_ko) values ('Camp White Oak', '{}', '캠프 화이트 오크');

insert into missions (name_en, alt_names, name_ko) values ('Pentagon', '{}', '펜타곤');

insert into missions (name_en, alt_names, name_ko) values ('DARPA Research Labs', array['DARPA Research Lab','DARPA Labs'], 'DARPA 연구 실험실');

insert into missions (name_en, alt_names, name_ko) values ('Coney Island Ballpark', '{}', '코니 아일랜드 야구장');

insert into missions (name_en, alt_names, name_ko) values ('Coney Island Amusement Park', '{}', '코니 아일랜드 놀이공원');

insert into missions (name_en, alt_names, name_ko) values ('District Union Arena', '{}', '디스트릭트 유니언 경기장');

insert into missions (name_en, alt_names, name_ko) values ('Roosevelt Island', '{}', '루스벨트 아일랜드');

insert into missions (name_en, alt_names, name_ko) values ('Capitol Building', array['Capitol','US Capitol'], '국회의사당');

insert into missions (name_en, alt_names, name_ko) values ('Tidal Basin', '{}', '타이들 베이슨');

insert into missions (name_en, alt_names, name_ko) values ('Manning National Zoo', '{}', '매닝 국립 동물원');

insert into missions (name_en, alt_names, name_ko) values ('Stranded Tanker', '{}', '좌초된 유조선');

insert into missions (name_en, alt_names, name_ko) values ('Wall Street', '{}', '월 스트리트');

insert into missions (name_en, alt_names, name_ko) values ('Pathway Park', array['Pathway'], '패스웨이 공원');

insert into missions (name_en, alt_names, name_ko) values ('The Tombs', array['Tombs'], '무덤');

insert into missions (name_en, alt_names, name_ko) values ('Liberty Island', '{}', '리버티 아일랜드');

insert into missions (name_en, alt_names, name_ko) values ('National Bond Armory', '{}', '국립 채권 은행 병기고');


-- ===== seed: gear_sets + bonuses =====

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Ongoing Directive', '{}', '긴급 지휘명령', array['무기 대미지'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+15% 상태이상 효과' from gs
union all
select id, '3', null, '+30% 재장전 속도' from gs
union all
select id, '4', '교전 수칙', '상태이상에 걸린 적을 사격하면 10초간 징표를 남깁니다. 징표가 걸린 적을 처치하면 사용 중인 무기에 할로 포인트 탄약 한 탄창이 지급되고, 파티원에게는 그 절반 탄창이 지급됩니다. 할로 포인트 탄약은 무기 대미지 +40%와 출혈을 부여합니다.' from gs
union all
select id, 'chest', '파라벨룸 탄환', '할로 포인트 탄약의 무기 대미지 증폭이 60%로 늘어납니다. 파티원에게는 적용되지 않습니다.' from gs
union all
select id, 'pack', '외상 전문가', '출혈 지속 시간 +50%, 모든 출혈 대미지 +100%.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('True Patriot', '{}', '진정한 애국자', array['방어도'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+15% 무기 조작력' from gs
union all
select id, '3', null, '+30% 탄창 용량' from gs
union all
select id, '4', '성 조 기', '2초마다 적에게 사격하면 중첩되는 디버프를 붙입니다. 빨강: 그 적이 받는 대미지 +15%. 하양: 그 적을 사격하면 내 방어도가 초당 1번 2% 회복. 파랑: 그 적의 대미지 -10%. 세 디버프가 모두 걸린 적이 죽으면 반경 5m 폭발이 일어나 그 적의 생명력과 방어도 합만큼 대미지를 줍니다(네임드는 감소).' from gs
union all
select id, 'chest', '깃발 휘날리며', '''성 조 기'' 순환 속도가 1초로 빨라집니다.' from gs
union all
select id, 'pack', '애국심 증폭', '디버프 수치 증가: 빨강 15% → 30%, 하양 2% → 5%, 파랑 10% → 20%.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Hard Wired', array['Hardwired'], '하드 와이어드', array['스킬 등급'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+15% 스킬 가속' from gs
union all
select id, '3', null, '+15% 스킬 대미지' from gs
union all
select id, '3', null, '+30% 스킬 회복' from gs
union all
select id, '4', '피드백 루프', '스킬을 사용하거나 취소하면 다른 스킬의 재사용 대기시간이 30초 줄고, 20초 동안 종합 스킬 대미지·회복 +10%. 10초에 한 번만 발동합니다.' from gs
union all
select id, 'chest', '긍정적 강화', '스킬 대미지·회복 보너스 +10% → +25%.' from gs
union all
select id, 'pack', '단락 회로', '피드백 루프 재사용 대기시간 10초 → 5초.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Aces & Eights', '{}', '에이스 & 에이트', array['무기 대미지'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+30% 지정사수소총 대미지' from gs
union all
select id, '2', null, '+30% 소총 대미지' from gs
union all
select id, '3', null, '+30% 헤드샷 대미지' from gs
union all
select id, '3', null, '+30% 무기 조작력' from gs
union all
select id, '4', '망자의 손패', '소총·지정사수소총이 적중할 때마다 카드를 한 장 뒤집고(헤드샷은 한 장 더), 5장이 뒤집히면 다음 사격 대미지 +75%. 패에 따라 강화되는 사격 횟수가 달라집니다: 포카드 4회, 풀 하우스 3회, 에이스 & 에이트 2회.' from gs
union all
select id, 'chest', '무제한', '망자의 손패 대미지 보너스 75% → 100%.' from gs
union all
select id, 'pack', '비장의 패', '패를 공개할 때 강화되는 사격이 1회 늘어납니다.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Tip of the Spear', '{}', '창끝', array['무기 대미지'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+20% 시그니처 무기 대미지' from gs
union all
select id, '3', null, '+10% 무기 대미지' from gs
union all
select id, '4', '공격 정찰', '시그니처 무기로 처치하면 10초간 시그니처 무기 대미지 +15%, 다음 재장전 속도 +25%(중첩 안 됨). 60초마다 시그니처 무기 탄약이 자동으로 생성됩니다.' from gs
union all
select id, 'chest', '파괴 전문가', '공격 정찰의 시그니처 무기 대미지 보너스 15% → 30%. 시그니처 무기로 3번 처치할 때마다 시그니처 탄약이 생성됩니다.' from gs
union all
select id, 'pack', '전매특허', '시그니처 탄약을 전부 쓰면 15초간 무기 대미지 +50%. 공격 정찰로 생성되는 탄약이 두 배가 됩니다.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Negotiator''s Dilemma', '{}', '협상가의 딜레마', array['무기 대미지'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+15% 치명타 확률' from gs
union all
select id, '3', null, '+20% 치명타 대미지' from gs
union all
select id, '4', '적대적 교섭', '치명타를 맞히면 최대 3명에게 20초간 징표를 남깁니다. 징표가 걸린 적에게 치명타를 맞히면 준 대미지의 60%가 징표가 걸린 다른 모든 적에게도 들어갑니다. 징표가 걸린 적이 죽으면 전투가 끝날 때까지 치명타 대미지 +10%(최대 10중첩).' from gs
union all
select id, 'chest', '물 반 고기 반', '징표 개수 3 → 5.' from gs
union all
select id, 'pack', '임계 수치', '징표가 걸린 다른 적에게 들어가는 대미지 60% → 112%.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Striker''s Battlegear', '{}', '기동타격대', array['무기 대미지'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+15% 무기 조작력' from gs
union all
select id, '3', null, '+15% 발사 속도' from gs
union all
select id, '4', '기동타격대의 도박', '무기가 적중할 때마다 종합 무기 대미지 +0.65%, 최대 100중첩. 중첩은 0~50 구간에서는 초당 1개, 50~100 구간에서는 초당 2개씩 사라집니다.' from gs
union all
select id, 'chest', '여세 몰이', '최대 중첩 100 → 200. 100~200 구간에서는 초당 3개씩 사라집니다.' from gs
union all
select id, 'pack', '위기 관리', '중첩당 무기 대미지 0.65% → 0.90%.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('System Corruption', '{}', '시스템 손상', array['무기 대미지: 마스크·장갑·권총집','방어도: 방탄복·백팩·무릎 보호대'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+15% 적 처치 시 방어도 회복' from gs
union all
select id, '3', null, '+40% 방해 저항' from gs
union all
select id, '3', null, '+40% 펄스 저항' from gs
union all
select id, '4', '핵스텝 프로토콜', '방어구 키트가 재사용 대기 20초의 무제한 즉시 사용 능력으로 바뀝니다. 사용하면 방어도 20% 회복과 보너스 방어도 50%를 얻고, 5초간 이름표가 숨겨집니다. 보너스 방어도 5%당 종합 무기 대미지 +2%(최대 +20%).' from gs
union all
select id, 'chest', '컴파일러 최적화', '핵스텝 프로토콜 재사용 대기시간 20초 → 15초.' from gs
union all
select id, 'pack', '다중 스레드 실행', '핵스텝 프로토콜의 보너스 방어도 50% → 100%.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Eclipse Protocol', '{}', '이클립스 프로토콜', array['스킬 등급'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+15% 상태이상 효과' from gs
union all
select id, '3', null, '+15% 스킬 가속' from gs
union all
select id, '3', null, '+30% 상태이상 저항' from gs
union all
select id, '4', '간접 전파', '적을 처치하면 내가 건 상태이상 효과가 10m 안의 모든 적에게 전이되고, 지속 시간이 50% 갱신됩니다.' from gs
union all
select id, 'chest', '바이러스 촉진제', '사거리 10m → 15m, 갱신 비율 50% → 75%.' from gs
union all
select id, 'pack', '증상 악화 인자', '상태이상에 걸린 적에게 주는 모든 대미지 +30%.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Future Initiative', '{}', '미래 계획', array['스킬 등급'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+30% 스킬 회복' from gs
union all
select id, '3', null, '+15% 스킬 가속' from gs
union all
select id, '3', null, '+30% 스킬 지속 시간' from gs
union all
select id, '4', '지역 통제', '방어도가 가득 차 있으면 나와 아군의 종합 무기·스킬 대미지 +15%. 아군을 회복시키면 5m 안의 나와 모든 아군도 회복량의 60%를 회복합니다.' from gs
union all
select id, 'chest', '전술적 우위', '대미지 보너스 +15% → +25%.' from gs
union all
select id, 'pack', '전략적 전투 지원', '근접 회복 효과 60% → 120%.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Foundry Bulwark', '{}', '주조소의 방패', array['방어도'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+10% 전체 방어도' from gs
union all
select id, '3', null, '+1% 방어도 재생' from gs
union all
select id, '3', null, '+50% 방패 생명력' from gs
union all
select id, '4', '현장 수리', '나 또는 방패가 대미지를 받으면, 받은 대미지의 25%만큼 10초에 걸쳐 나와 방패가 함께 회복됩니다.' from gs
union all
select id, 'chest', '개선된 재료', '현장 수리 회복량 25% → 35%.' from gs
union all
select id, 'pack', '정제 공정', '현장 수리 회복 시간 10초 → 5초.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Hunter''s Fury', '{}', '사냥꾼의 격노', array['무기 대미지'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+15% 산탄총 대미지' from gs
union all
select id, '2', null, '+15% 기관단총 대미지' from gs
union all
select id, '3', null, '+20% 처치 시 방어도 회복' from gs
union all
select id, '3', null, '+50% 처치 시 생명력 회복' from gs
union all
select id, '4', '최상위 포식자', '15m 안의 적에게 디버프를 붙여 그 적에 대한 무기 대미지 +20%. 디버프가 걸린 적을 무기로 처치하면 5m 안의 다른 적에게 방향감각 상실을 걸고, 10초간 무기 대미지 +5%(최대 5중첩)를 얻습니다.' from gs
union all
select id, 'chest', '무한한 허기', '최상위 포식자 중첩 지속 시간 10초 → 30초.' from gs
union all
select id, 'pack', '압도적인 힘', '방향감각 상실 반경 5m → 10m.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Rigger', '{}', '리거', array['스킬 등급'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+15% 스킬 가속' from gs
union all
select id, '3', null, '+15% 스킬 지속 시간' from gs
union all
select id, '4', '돌봄 친화', '내가 설치한 스킬과 상호작용(사용·설치, 대상 변경, 스킬 회복)하면 10초간 그 스킬의 대미지 +25%. 갱신되지 않습니다.' from gs
union all
select id, 'chest', '최고의 친구', '대미지 버프 25% → 50%.' from gs
union all
select id, 'pack', '완전 가동', '스킬을 취소하면 그 스킬의 재사용 대기시간이 초기화됩니다.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Heartbreaker', array['Heart Breaker'], '하트브레이커', array['방어도'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+15% 돌격소총 대미지' from gs
union all
select id, '2', null, '+15% 경기관총 대미지' from gs
union all
select id, '3', null, '+15% 무기 조작력' from gs
union all
select id, '4', '경악', '헤드샷을 맞히면 5초간 적에게 펄스를 붙입니다. 펄스에 탐지된 적을 공격하면 보너스 방어도 +1%, 그 적에 대한 대미지 +1.1%가 중첩됩니다(최대 50). 초당 2중첩씩 사라집니다.' from gs
union all
select id, 'chest', '최대 BPM', '최대 중첩 50 → 100.' from gs
union all
select id, 'pack', '추위', '중첩당 보너스 방어도 1% → 2%.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Umbra Initiative', '{}', '움브라 이니셔티브', array['무기 대미지'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+15% 치명타 확률' from gs
union all
select id, '3', null, '+30% 재장전 속도' from gs
union all
select id, '4', '어둠을 벗어나', '엄폐 중에 초당 10중첩(최대 50). 중첩당 치명타 대미지 +1.2%, RPM +0.4%. 엄폐를 벗어나면 걸을 때 초당 2개, 달릴 때 초당 1개씩 사라집니다. 엄폐한 채 사격하는 동안에는 버프가 붙지 않습니다.' from gs
union all
select id, '4', '빛의 품으로', '엄폐를 벗어나 전투 중일 때 초당 10중첩(최대 50). 엄폐하면 초당 10중첩씩 소모되고, 소모한 중첩당 방어도 재생 +0.8%.' from gs
union all
select id, 'chest', '어둠을 벗어나', '최대 중첩 50 → 100, 중첩 획득량 10 → 20.' from gs
union all
select id, 'pack', '빛의 품으로', '최대 중첩 50 → 100, 획득량 10 → 20, 소모량 10 → 20.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Hotshot', '{}', '핫샷', array['무기 대미지'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+30% 지정사수소총 대미지' from gs
union all
select id, '3', null, '+30% 헤드샷 대미지' from gs
union all
select id, '3', null, '+30% 무기 조작력' from gs
union all
select id, '4', '두통', '지정사수소총으로 헤드샷을 맞히면 다음 헤드샷 대미지 +80%. 연속 두 번째 헤드샷은 방어도 10% 회복(방어도가 가득이면 현재 방어도의 최대 50%를 보너스 방어도로), 세 번째는 탄창 보충. 네 번째부터는 헤드샷 처치마다 세 보너스가 모두 붙습니다. 헤드샷을 놓치면 초기화됩니다.' from gs
union all
select id, 'chest', '위풍당당', '보너스 방어도 50% → 100%.' from gs
union all
select id, 'pack', '행운아', '헤드샷을 놓쳐도 1회는 효과가 초기화되지 않습니다.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Cavalier', '{}', '카발리에', array['방어도'], '게임 안 설명은 ''모든 피해 감소''이지만 실제로는 스킬 대미지에만 적용된다고 위키에 적혀 있습니다.')
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+30% 상태이상 저항' from gs
union all
select id, '3', null, '+40% 스킬 회복' from gs
union all
select id, '4', '충전', '전투 중 엄폐를 벗어나 있으면 1초마다 받는 대미지 -5%, 최대 -50%.' from gs
union all
select id, '4', '충전완료', '충전이 최대가 되면 이동 속도 디버프에 면역이 되고, 내 상태이상 저항과 받는 대미지 감소를 모든 아군에게 10초간 공유합니다.' from gs
union all
select id, 'chest', '과충전', '충전의 받는 대미지 감소 최대치 70%.' from gs
union all
select id, 'pack', '안전 충전', '충전이 1초마다 10%의 방호를 부여합니다.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Ortiz: Exuro', '{}', '오티즈: 엑수로', array['스킬 등급'], '게임 안 설명에는 ''무기 대미지 증가''로 적혀 있지만, 공식 문서에 따르면 실제로는 증폭(별도로 곱해지는) 효과입니다.')
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+20% 화상 지속 시간' from gs
union all
select id, '2', null, '+15% 스킬 생명력' from gs
union all
select id, '3', null, '+40% 화상 대미지' from gs
union all
select id, '4', '오티즈 소각 터렛 프로토타입', '소각 터렛이 360° 회전하고, 내 소각 터렛의 불길에 면역이 되며, 소각 터렛이 비활성화될 때 폭발합니다.' from gs
union all
select id, 'chest', '연쇄 발화', '프로토타입 터렛의 공격으로 불타는 적이 10m 안의 다른 적을 불태웁니다.' from gs
union all
select id, 'pack', '열사병', '소각 터렛 공격으로 불타는 적에게 주는 대미지가 40% 증폭되고, 소각 터렛 사거리가 25% 늘어납니다.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Aegis', '{}', '아이기스', array['방어도'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+70% 생명력' from gs
union all
select id, '3', null, '+15% 전체 방어도' from gs
union all
select id, '4', '극기', '나를 조준 중인 적 하나당 대미지 저항 +4%(최대 3중첩). 그룹 인원이 X명이면 이 보너스가 1.X배가 됩니다.' from gs
union all
select id, 'chest', '기만', '내 미끼를 조준 중인 적도 극기 계산에 포함됩니다.' from gs
union all
select id, 'pack', '폴리에틸렌 장갑판', '극기의 대미지 저항 4% → 5%.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Breaking Point', '{}', '한계점', array['무기 대미지'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+30% 소총 대미지' from gs
union all
select id, '2', null, '+30% 지정사수소총 대미지' from gs
union all
select id, '3', null, '+30% 헤드샷 대미지' from gs
union all
select id, '3', null, '+30% 무기 조작력' from gs
union all
select id, '4', '정곡', '소총·지정사수소총이 적중할 때마다 중첩됩니다(최대 = 탄창 용량). 재장전하면 20초간 중첩당 무기 조작력 +2%, 무기 대미지 +4%. 보너스가 켜져 있는 동안에는 중첩이 쌓이지 않고, 끝나면 탄창이 다시 채워집니다. 무기를 교체하면 효과가 끝나거나 중첩이 사라지고 탄창이 채워집니다.' from gs
union all
select id, 'chest', '귀환 불가', '정곡 보너스 지속 시간 20초 → 40초.' from gs
union all
select id, 'pack', '체면', '중첩당 무기 대미지 4% → 9%.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Virtuoso', '{}', '거장', array['무기 대미지'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+15% 무기 조작력' from gs
union all
select id, '2', null, '+15% 탄창 용량' from gs
union all
select id, '3', null, '+15% 무기 대미지' from gs
union all
select id, '4', '심포니', '25m 이상 떨어진 적을 처치하면 15초간 산탄총·기관단총·권총 무기 대미지 +40%, 돌격소총·경기관총 +20%, 보너스 방어도 25%. 25m 안의 적을 처치하면 15초간 지정사수소총·소총 무기 대미지 +40%, 돌격소총·경기관총 +20%, 헤드샷 대미지 +30%. 처치가 쌓여 4중첩이 되면 모든 보너스가 2배로 15초간 동시에 발동합니다.' from gs
union all
select id, 'chest', '포르티시모', '심포니의 무기 대미지가 2배가 됩니다.' from gs
union all
select id, 'pack', '아첼레란도', '2배 발동에 필요한 중첩 4 → 3.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Refactor', '{}', '리팩터', array['스킬 등급: 마스크·방탄복·권총집','방어도: 백팩·장갑·무릎 보호대'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+15% 상태이상 효과' from gs
union all
select id, '3', null, '+25% 스킬 대미지' from gs
union all
select id, '4', '수취인 불명', '스킬로 입힌 대미지의 10%만큼 내가 회복하고, 20%만큼 아군이 회복합니다.' from gs
union all
select id, 'chest', '관심 증대', '회복 비율 10% → 25%(나), 20% → 35%(아군).' from gs
union all
select id, 'pack', '과잉 설계', '방어도가 가득 찬 상태에서 회복 효과를 받으면 보너스 방어도를 얻습니다(전체 방어도의 최대 80%, 아군에게는 적용 안 됨).' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Measured Assembly', '{}', '메저드 어셈블리', array['스킬 등급'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+15% 스킬 가속' from gs
union all
select id, '3', null, '+60% 스킬 회복' from gs
union all
select id, '3', null, '+40% 폭발물 저항' from gs
union all
select id, '4', '집합', '하이브·스마트 엄폐물 범위 안의 아군 요원 한 명당 스킬 등급 +1. 스킬 등급이 6일 때 범위 안에 아군이 4초 이상 있으면 15초간 과충전이 발동합니다(재사용 40초). 범위 안에 들어온 박격포와 적 스킬을 파괴하며(재사용 10초), 범위 안 아군 한 명당 이 재사용 대기시간이 20% 줄어듭니다.' from gs
union all
select id, 'chest', '하이브마인드', '과충전 재사용 대기시간 40초 → 25초.' from gs
union all
select id, 'pack', '스마트 협력', '박격포·적 스킬 파괴 재사용 대기시간 10초 → 1초.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Tipping Scales', '{}', '기울어진 저울', array['무기 대미지'], '중첩은 발당이 아니라 사격을 1초 유지할 때마다 5개씩 쌓인다고 위키에 적혀 있습니다.')
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+30% 탄창 용량' from gs
union all
select id, '3', null, '+30% 경기관총 대미지' from gs
union all
select id, '4', '출력 제어', '사격하면 중첩됩니다(최대 50). 중첩당 무기 조작력 +0.5%, 치명타 대미지 +5%. 사격하지 않으면 초당 6중첩씩 줄어들고, 적이 제압 상태이면 줄어들지 않습니다.' from gs
union all
select id, 'chest', '지속성', '최대 중첩 50 → 75.' from gs
union all
select id, 'pack', '눈덩이', '중첩당 치명타 대미지 5% → 8%.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Concentrated Company', '{}', '집중된 중대', array['무기 대미지'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+10% 무기 대미지' from gs
union all
select id, '3', null, '+30% 무기 조작력' from gs
union all
select id, '4', '동료애', '적을 사격하면 10초간 표시됩니다(최대 4명). 표시된 적이 죽으면 그 적을 처치하는 데 기여한 나·아군·스킬 하나당 무기 대미지 +3%, 치명타 대미지 +3%가 중첩됩니다(최대 35, 10초마다 감소).' from gs
union all
select id, 'chest', '모두를 위한 하나', '표시할 수 있는 적 4명 → 8명.' from gs
union all
select id, 'pack', '하나를 위한 모두', '중첩당 무기 대미지 3% → 6%.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Core Strength', '{}', '코어 근력', array['무작위 (백팩은 세 가지 핵심 속성 모두)'], '백팩을 뺀 모든 부위가 무작위 핵심 속성을 가집니다.')
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+10% 무기 조작력' from gs
union all
select id, '3', null, '+5% 무기 대미지' from gs
union all
select id, '3', null, '+5% 전체 방어도' from gs
union all
select id, '3', null, '+5% 스킬 효율' from gs
union all
select id, '4', '코어 운동', '각 부위의 핵심 속성마다, 나머지 두 핵심 속성 보너스의 40%를 추가로 받습니다. 스킬 등급은 스킬 효율 15%로 계산합니다.' from gs
union all
select id, 'chest', '내부 코어', '다른 코어에서 받는 비율 40% → 75%.' from gs
union all
select id, 'pack', '외부 코어', '코어 운동에는 영향이 없습니다. 이 백팩은 세 가지 핵심 속성을 모두 가집니다.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Ortiz: Reficere', '{}', '오티즈: 레피세레', array['스킬 등급'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+8% 스킬 효율' from gs
union all
select id, '3', null, '+60% 스킬 회복' from gs
union all
select id, '4', '오티즈 신속 투여 나노머신 프로토타입', '치유 스킬의 지속 시간과 사거리가 90% 줄지만 치유 효율이 150% 늘어납니다. 스킬로 아군을 치유하면 그 아군에게 10초간 상태이상 저항 30%를 줍니다(아군당 재사용 10초).' from gs
union all
select id, 'chest', '과충전 나노머신', '치유 효율 보너스 150% → 225%.' from gs
union all
select id, 'pack', '개선된 완충 장치', '사거리·지속 시간 감소량 90% → 25%.' from gs;

with gs as (
  insert into gear_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Ember Engine', '{}', '엠버 엔진', array['스킬 등급'], null)
  returning id
)

insert into gear_set_bonuses (gear_set_id, piece_count, effect_name, effect_text)
select id, '2', null, '+8% 스킬 효율' from gs
union all
select id, '3', null, '+30% 상태이상 효과' from gs
union all
select id, '4', '자연 발화', '내가 적용하는 모든 상태이상 효과가 40% 확률로 화상을 추가로 붙입니다. 처음 적용한 효과가 화상이었다면, 화상 지속 시간 동안 그 적이 받는 화상 대미지 +25%.' from gs
union all
select id, 'chest', '발화점', '자연 발화의 화상 적용 확률 40% → 60%.' from gs
union all
select id, 'pack', '백열', '자연 발화의 화상 대미지 디버프 지속 시간 +50%.' from gs;


-- ===== seed: brand_sets + bonuses =====

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('5.11 Tactical', '{}', '5.11 택티컬', array['방어도'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+12% 정예 대상 방호도' from bs
union all
select id, 2, '+100% 위협 수준 증가' from bs
union all
select id, 3, '+30% 상태이상 저항' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Gila Guard', '{}', '길라 가드', array['방어도'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+5% 전체 방어도' from bs
union all
select id, 2, '+20% 상태이상 저항' from bs
union all
select id, 3, '+2% 방어도 재생' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Douglas & Harding', '{}', '더글라스 & 하딩', array['무기 대미지'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+24% 권총 대미지' from bs
union all
select id, 2, '+20% 스킬 생명력' from bs
union all
select id, 3, '+50% 명중률' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Richter & Kaiser GmbH', '{}', '리히터 & 카이저 유한회사', array['스킬 등급'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+10% 스킬 가속' from bs
union all
select id, 2, '+40% 폭발물 저항' from bs
union all
select id, 3, '+52% 스킬 회복' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Murakami Industries', '{}', '무라카미 산업', array['스킬 등급'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+15% 스킬 지속 시간' from bs
union all
select id, 2, '+35% 스킬 회복' from bs
union all
select id, 3, '+18% 스킬 대미지' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Badger Tuff', '{}', '배저 터프', array['방어도'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+12% 산탄총 대미지' from bs
union all
select id, 2, '+10% 적 처치 시 방어도' from bs
union all
select id, 3, '+15% 전체 방어도' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Sokolov Concern', '{}', '소콜로프 상사', array['무기 대미지'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+12% 기관단총 대미지' from bs
union all
select id, 2, '+13% 치명타 대미지' from bs
union all
select id, 3, '+8% 치명타 확률' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Airaldi Holdings', '{}', '아이랄디 홀딩', array['무기 대미지'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+12% 지정사수소총 대미지' from bs
union all
select id, 2, '+26% 헤드샷 대미지' from bs
union all
select id, 3, '+5% 방어도 대상 대미지' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Alps Summit Armaments', array['Alps Summit Armament'], '알프스 정상 군수산업', array['스킬 등급'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+18% 스킬 회복' from bs
union all
select id, 2, '+30% 스킬 지속 시간' from bs
union all
select id, 3, '+30% 스킬 가속' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Yaahl Gear', '{}', '얄 기어', array['방어도'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+10% 상태이상 저항' from bs
union all
select id, 2, '+12% 무기 대미지' from bs
union all
select id, 3, '+40% 펄스 저항' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Overlord Armaments', '{}', '오버로드 군수산업', array['무기 대미지'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+12% 소총 대미지' from bs
union all
select id, 2, '+30% 명중률' from bs
union all
select id, 3, '+30% 무기 조작력' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Wyvern Wear', '{}', '와이번 웨어', array['스킬 등급'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+8% 스킬 대미지' from bs
union all
select id, 2, '+20% 상태이상 효과' from bs
union all
select id, 3, '+45% 스킬 지속 시간' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('China Light Industries', array['China Light Industries Corporation'], '차이나 경공업', array['스킬 등급'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+15% 폭발물 대미지' from bs
union all
select id, 2, '+20% 상태이상 효과' from bs
union all
select id, 3, '+30% 스킬 가속' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Petrov Defense Group', '{}', '페트로프 방위 그룹', array['무기 대미지'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+12% 경기관총 대미지' from bs
union all
select id, 2, '+15% 무기 조작력' from bs
union all
select id, 3, '+50% 탄약 휴대량' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Fenris Group AB', '{}', '펜리르 그룹 AB', array['무기 대미지'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+12% 돌격소총 대미지' from bs
union all
select id, 2, '+32% 탄창 용량' from bs
union all
select id, 3, '+50% 안정성' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Providence Defense', '{}', '프로비던스 방위산업', array['무기 대미지'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+13% 헤드샷 대미지' from bs
union all
select id, 2, '+8% 치명타 확률' from bs
union all
select id, 3, '+13% 치명타 대미지' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Ceska Vyroba s.r.o.', '{}', '체코 중공업 유한회사', array['무기 대미지'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+8% 치명타 확률' from bs
union all
select id, 2, '+24% 산탄총 대미지' from bs
union all
select id, 3, '+30% 상태이상 저항' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Grupo Sombra S.A.', '{}', '그루포 솜브라 주식회사', array['무기 대미지'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+13% 치명타 대미지' from bs
union all
select id, 2, '+20% 폭발물 대미지' from bs
union all
select id, 3, '+39% 헤드샷 대미지' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Golan Gear Ltd', '{}', '골란 기어 유한회사', array['방어도'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+20% 폭발물 저항' from bs
union all
select id, 2, '+1.5% 방어도 재생' from bs
union all
select id, 3, '+150% 위협 수준 증가' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Hana-U Corporation', '{}', '하나-U 기업', array['스킬 등급'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+10% 스킬 가속' from bs
union all
select id, 2, '+13% 스킬 대미지' from bs
union all
select id, 3, '+18% 무기 대미지' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Walker, Harris & Co.', '{}', '워커 해리스', array['무기 대미지'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+6% 무기 대미지' from bs
union all
select id, 2, '+5% 방어도 대상 대미지' from bs
union all
select id, 3, '+10% 생명력 대상 대미지' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Belstone Armory', '{}', '벨스톤 무기고', array['방어도'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+1% 방어도 재생' from bs
union all
select id, 2, '+100% 위협 수준 증가' from bs
union all
select id, 3, '+36% 정예 대상 방호도' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Empress International', '{}', '엠프리스 인터내셔널', array['스킬 등급'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+10% 스킬 생명력' from bs
union all
select id, 2, '+13% 스킬 대미지' from bs
union all
select id, 3, '+8% 스킬 효율' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Uzina Getica', '{}', '우지나 게티카', array['방어도'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+5% 전체 방어도' from bs
union all
select id, 2, '+10% 적 처치 시 방어도 회복' from bs
union all
select id, 3, '+30% 상태이상 저항' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Brazos de Arcabuz', '{}', '브라조스 데 아쿼버스', array['방어도'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+10% 스킬 가속' from bs
union all
select id, 2, '+1 스킬 등급' from bs
union all
select id, 3, '+50% 탄창 용량' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Habsburg Guard', '{}', '합스부르크 가드', array['방어도'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+13% 헤드샷 대미지' from bs
union all
select id, 2, '+24% 지정사수소총 대미지' from bs
union all
select id, 3, '+25% 상태이상 효과' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Electrique', '{}', '전격', array['스킬 등급'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+10% 상태이상 효과' from bs
union all
select id, 2, '+20% 상태이상 저항' from bs
union all
select id, 3, '+8% 스킬 효율' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Lengmo', '{}', '렝모', array['방어도'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+15% 재장전 속도' from bs
union all
select id, 2, '+24% 경기관총 대미지' from bs
union all
select id, 3, '+30% 무기 조작력' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Palisade Steelworks', '{}', '팰리세이드 제강소', array['방어도'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+10% 적 처치 시 방어도 회복' from bs
union all
select id, 2, '+24% 정예 대상 방호도' from bs
union all
select id, 3, '+1 스킬 등급' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Zwiadowka Sp. z o.o.', '{}', '즈비아도프카 Sp. z o.o.', array['무기 대미지'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+15% 탄창 용량' from bs
union all
select id, 2, '+24% 소총 대미지' from bs
union all
select id, 3, '+30% 무기 조작력' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Legatus S.p.A.', '{}', '레가투스 S.p.A.', array['무기 대미지'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+15% 탄창 용량' from bs
union all
select id, 2, '+24% 기관단총 대미지' from bs
union all
select id, 3, '+105% 적정 사거리' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Shiny Monkey Gear', array['Shiny Monkey'], '샤이니 멍키 보호장구', array['스킬 등급'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+15% 스킬 지속 시간' from bs
union all
select id, 2, '+5% 스킬 효율' from bs
union all
select id, 3, '+52% 스킬 회복' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Imminence Armaments', '{}', '이미넌스 군수산업', array['무기 대미지'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+6% 무기 대미지' from bs
union all
select id, 2, '+48% 권총 대미지' from bs
union all
select id, 3, '+30% 스킬 생명력' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Urban Lookout', '{}', '도시 감시병', array['무기 대미지'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+5% 무기 조작력' from bs
union all
select id, 2, '+24% 지정사수소총 대미지' from bs
union all
select id, 3, '+45% 스킬 지속 시간' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Unit Alloys', '{}', '유닛 합금', array['무기 대미지'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+5% 발사 속도' from bs
union all
select id, 2, '+24% 돌격소총 대미지' from bs
union all
select id, 3, '+50% 탄창 용량' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Royal Works', '{}', '로열 워크스', array['무기 대미지'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+5% 무기 조작력' from bs
union all
select id, 2, '+24% 경기관총 대미지' from bs
union all
select id, 3, '+50% 명중률' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Edelweiss GPz', '{}', '에델바이스 GPz', array['스킬 등급'], null)
  returning id
)

insert into brand_set_bonuses (brand_set_id, piece_count, effect_text)
select id, 1, '+18% 스킬 회복' from bs
union all
select id, 2, '+20% 스킬 가속' from bs
union all
select id, 3, '+8% 스킬 효율' from bs;

with bs as (
  insert into brand_sets (name_en, alt_names, name_ko, core_attributes, note)
  values ('Improvised', '{}', '급조한 보호장구', array['무작위'], '제작대에서만 만들 수 있고 핵심·비핵심 속성이 모두 무작위입니다. 브랜드 세트 효과는 없습니다.')
  returning id
)

select 1; -- Improvised: no brand bonuses (Improvised)