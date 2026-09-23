-- ===== schema =====

create table weapon_talents (
  talent_key text primary key,
  name_ko text not null,
  name_en text not null,
  desc_ko text not null,
  desc_en text not null,
  perfect_name_ko text,
  perfect_desc_ko text,
  weapon_groups text[] not null
);

create table weapon_named (
  item_key text primary key,
  name_ko text not null,
  name_en text not null,
  weapon_group text not null,
  variant text,
  talent_name_ko text,
  talent_desc_ko text,
  attrs jsonb,
  drop_location_ko text
);

create table weapon_exotic (
  item_key text primary key,
  name_ko text not null,
  name_en text not null,
  weapon_group text not null,
  talent_name_ko text,
  talent_desc_ko text,
  exotic_mods jsonb,
  drop_location_ko text
);

alter table weapon_talents enable row level security;
alter table weapon_named enable row level security;
alter table weapon_exotic enable row level security;
create policy "public read" on weapon_talents for select using (true);
create policy "public read" on weapon_named for select using (true);
create policy "public read" on weapon_exotic for select using (true);


-- ===== seed: weapon_talents =====

insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('breadbasket', '브레드바스켓', 'Breadbasket', '바디샷을 적중시키면 10초 동안 다음 헤드샷의 헤드샷 대미지가 +55%만큼 증가합니다. 최대 3번 중첩됩니다.', 'Landing body shots adds a stack of bonus +55% headshot damage to the next headshot for 10s.
Max stack is 3.', '완벽한 브레드바스켓', '바디샷을 적중시키면 10초 동안 다음 헤드샷의 헤드샷 대미지가 +70%만큼 증가합니다. 최대 2번 중첩됩니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('killer', '킬러', 'Killer', '치명타로 적을 처치하면 10초 동안 치명타 대미지가 +70%만큼 증가합니다.', 'Killing an enemy with a critical hit grants +70% critical hit damage for 10s.', '완벽한 킬러', '치명타로 적을 처치하면 10초 동안 치명타 대미지가 +90%만큼 증가합니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('preservation', '보존', 'Preservation', '적을 처치하면 5초에 걸쳐 방어도가 10%만큼 회복됩니다. 헤드샷으로 처치하면 회복량이 추가로 10%만큼 증가합니다.', 'Killing an enemy repairs 10% armor over 5s.
Headshot kills improve the repair by an additional 10%.', '완벽한 보존', '적을 처치하면 5초에 걸쳐 방어도가 15%만큼 회복됩니다. 헤드샷으로 처치하면 회복량이 추가로 15%만큼 증가합니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('optimist', '낙천주의자', 'Optimist', '탄창의 탄약이 10%만큼 소모될 때마다 무기 대미지가 +3.5%만큼 증가합니다.', 'Weapon damage is increased by +3.5% for every 10% ammo missing from the magazine.', '완벽한 낙천주의자', '탄창의 탄약이 10%만큼 소모될 때마다 무기 대미지가 +4.5%만큼 증가합니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('strained', '중압감', 'Strained', '사격 시 0.5초마다 치명타 대미지가 +10%만큼 증가합니다. 최대 5번 중첩됩니다.', 'Gain +10% critical hit damage for every 0.5s you are firing.
Stacks up to 5 times.', '완벽한 중압감', '사격 시 0.5초마다 치명타 대미지가 +10%만큼 증가합니다. 최대 8번 중첩됩니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('closepersonal', '근접전의 대가', 'Close & Personal', '7m 내에 있는 대상을 처치하면, 10초 동안 무기 대미지가 +30%만큼 증가합니다.', 'Killing a target within 7m grants +30% weapon damage for 10s.', '완벽한 근접전의 대가', '7m 내에 있는 대상을 처치하면, 10초 동안 무기 대미지가 +38%만큼 증가합니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('fasthands', '빠른 손', 'Fast Hands', '치명타를 적중시키면 재장전 속도가 3%만큼 증가합니다. 최대 40번 중첩됩니다.', 'Critical hits add a stack of 3% reload speed bonus.
Max stack is 40.', '완벽한 빠른 손', '치명타를 적중시키면 재장전 속도가 5%만큼 증가합니다. 최대 40번 중첩됩니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('sadist', '새디스트', 'Sadist', '출혈 상태인 적에 대한 무기 대미지가 30%만큼 증가합니다.

4명의 적을 처치하면 다음에 공격을 적중시키는 적에게 출혈을 부여합니다.', 'Amplifies weapon damage by 30% to bleeding enemies.

After 4 kills, applies bleed to the next enemy you hit.', '완벽한 새디스트', '출혈 상태인 적에 대한 무기 대미지가 35%만큼 증가합니다.

3명의 적을 처치하면 다음에 공격을 적중시키는 적에게 출혈을 부여합니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('eyeless', '맹인', 'Eyeless', '시력 상실 상태인 적에 대한 무기 대미지가 30%만큼 증가합니다.

4명의 적을 처치하면 다음에 공격을 적중시키는 적에게 시력 상실을 부여합니다.', 'Amplifies weapon damage by 30% to blinded enemies.

After 4 kills, applies blind to the next enemy you hit.', '완벽한 맹인', '시력 상실 상태인 적에 대한 무기 대미지가 35%만큼 증가합니다. 3명의 적을 처치하면 다음에 공격을 적중시키는 적에게 시력 상실을 부여합니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('ignited', '점화', 'Ignited', '화상 상태인 적에 대한 무기 대미지가 25%만큼 증가합니다.

4명의 적을 처치하면 다음에 공격을 적중시키는 적에게 화상을 부여합니다.', 'Amplifies weapon damage by 25% to burning enemies.

After 4 kills, applies burn to the next enemy you hit.', '완벽한 점화', '화상 상태인 적에 대한 무기 대미지가 30%만큼 증가합니다.

3명의 적을 처치하면 다음에 공격을 적중시키는 적에게 화상을 부여합니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('vindictive', '앙심', 'Vindictive', '상태이상 효과가 적용된 적을 처치하면 20초 동안 15m 내에 있는 자신을 포함한 모든 아군의 치명타 확률을 16%만큼, 치명타 대미지를 16%만큼 증가시킵니다.', 'Killing an enemy with a status effect applied grants you and all allies within 15m 16% critical hit chance and 16% critical hit damage for 20s.', '완벽한 앙심', '상태이상 효과가 적용된 적을 처치하면 20초 동안 20m 내에 있는 자신을 포함한 모든 아군의 치명타 확률을 21%만큼, 치명타 대미지를 21%만큼 증가시킵니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('ranger', '레인저', 'Ranger', '대상과의 거리 4m 마다 무기 대미지가 2%만큼 증폭됩니다.', 'Amplifies weapon damage by 2% for every 4m you are away from your target.', '완벽한 레인저', '대상과의 거리 3m 마다 무기 대미지가 2%만큼 증폭됩니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('steadyhanded', '떨리지 않는 손', 'Steady Handed', '공격을 적중시키면 중첩 효과가 부여되어 명중률과 안정성이 +1%만큼 증가합니다. 100번 중첩되면 중첩 효과는 소모되고 탄창이 보충됩니다.', 'Hits grant a stack of +1% Accuracy and Stability.

At 100 stacks, consumes them to refill the magazine.', '완벽한 떨리지 않는 손', '공격을 적중시키면 중첩 효과가 부여되어 명중률과 안정성이 +1%만큼 증가합니다. 75번 중첩되면 중첩 효과는 소모되고 탄창이 보충됩니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('spike', '가시', 'Spike', '헤드샷을 적중시키면 15초 동안 스킬 대미지가 +20%만큼 증가합니다.', 'Headshots grant +20% skill damage for 15s.', '완벽한 가시', '헤드샷을 적중시키면 15초 동안 스킬 대미지가 +25%만큼 증가합니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('perpetuation', '영속성', 'Perpetuation', '헤드샷을 적중시키면 다음에 부여하는 상태이상 효과의 상태이상 효과 대미지와 지속 시간이 +75%만큼 증가합니다.

재사용 대기시간: 20초', 'Headshots grant +75% status effect damage and duration to the next status effect you apply.

Cooldown: 20s', '완벽한 영속성', '헤드샷을 적중시키면 다음에 부여하는 상태이상 효과의 상태이상 효과 대미지와 지속 시간이 +75%만큼 증가합니다.

재사용 대기시간: 16초', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('reformation', '혁신', 'Reformation', '헤드샷을 적중시키면 15초 동안 스킬 회복이 +60%만큼 증가합니다.', 'Headshots grant +60% skill repair for 15s.', '완벽한 혁신', '헤드샷을 적중시키면 15초 동안 스킬 회복이 +80%만큼 증가합니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('futureperfect', '미래', 'Future Perfect', '무기로 적을 처치하면 15초 동안 스킬 등급이 +1만큼 증가합니다. 최대 3번 중첩됩니다.

스킬 등급이 6 등급인 경우 무기로 적을 처치하면 15초 동안 과충전이 부여됩니다.
과충전 재사용 대기시간 90초.', 'Weapon kills grant +1 skill tier for 15s.
Stacks up to 3 times.

Weapon kills at skill tier 6 grant overcharge for 15s.

Overcharge cooldown: 90s', '완벽한 미래', '무기로 적을 처치하면 19초 동안 스킬 등급이 +1만큼 증가합니다. 최대 4번 중첩됩니다.

스킬 등급이 6 등급인 경우 무기로 적을 처치하면 15초 동안 과충전이 부여됩니다.
과충전 재사용 대기시간 90초.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('flatline', '심정지', 'Flatline', '펄스에 탐지된 적에 대한 무기 대미지가 15%만큼 증가합니다. 4명의 적을 처치하면 다음에 공격을 적중시키는 적에게 펄스를 부여합니다.', 'Amplifies weapon damage by 15% to pulsed enemies.

After 4 kills, applies pulse to the next enemy you hit.', '완벽한 심정지', '펄스에 탐지된 적에 대한 무기 대미지가 20%만큼 증가합니다. 3명의 적을 처치하면 다음에 공격을 적중시키는 적에게 펄스를 부여합니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('sledgehammer', '슬레지해머', 'Sledgehammer', '수류탄으로 대미지를 주면 대상에게 징표를 남깁니다.
징표에 걸린 대상은 방어도에 받는 대미지가 15%만큼 증가하고 이동 속도는 -20%만큼 감소합니다.
징표는 10초 후에 사라집니다.', 'Dealing damage with a grenade applies a mark on target.
Targets with mark will take 15% more damage to armor from the agent that applied the mark and have a -20% movement speed.
Mark will disappear after 10 seconds.', '완벽한 슬레지해머', '수류탄으로 대미지를 주면 대상에게 징표를 남깁니다.
징표에 걸린 대상은 방어도에 받는 대미지가 20% 만큼 증가하고 이동 속도는 -30%만큼 감소합니다.
징표는 10초 후에 사라집니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('thunderstrike', '천둥벼락', 'Thunder Strike', '충격 상태인 적에 대한 무기 대미지가 30%만큼 증가합니다.

4명의 적을 처치하면 다음에 공격을 적중시키는 적에게 충격을 부여합니다.', 'Amplifies weapon damage by 30% to shocked enemies.

After 4 kills, applies shock to the next enemy you hit.', '완벽한 천둥벼락', '충격 상태인 적에 대한 무기 대미지가 35%만큼 증가합니다. 3명의 적을 처치하면 다음에 공격을 적중시키는 적에게 충격을 부여합니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('insync', '동기화', 'In Sync', '적에게 공격을 적중시키면 5초 동안 스킬 대미지가 +15%만큼 증가합니다.

방패가 아닌 스킬을 사용하거나 스킬로 적에게 대미지를 주면 5초 동안 무기 대미지가 +15%만큼 증가합니다.

두 버프 효과가 동시에 활성화되면 대미지 증가량이 두 배가 됩니다.', 'Hitting an enemy grants +15% skill damage for 5s.

Using a non-shield skill or damaging an enemy with a skill grants +15% weapon damage for 5s.

Damage increases are doubled while both buffs are active at the same time.', '완벽한 동기화', '적에게 공격을 적중시키면 5초 동안 스킬 대미지가 +20%만큼 증가합니다.

방패가 아닌 스킬을 사용하거나 스킬로 적에게 대미지를 주면 5초 동안 무기 대미지가 +20%만큼 증가합니다.

두 버프 효과가 동시에 활성화되면 대미지 증가량이 두 배가 됩니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('pressurepoint', '압통점', 'Pressure Point', '상태이상 효과에 걸린 적에 대한 무기 대미지가 15%만큼 증폭됩니다.', 'Amplifies weapon damage by 15% to enemies under Status Effects.', '완벽한 압통점', '상태이상 효과에 걸린 적에 대한 무기 대미지가 20%만큼 증폭됩니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('streamline', '능률화', 'Streamline', '재사용 대기시간 중인 스킬이 없을 때 무기 대미지가 42% 증가합니다.', 'Increase Weapon Damage by 42% when no Skills are on cooldown.', '완벽한 능률화', '재사용 대기시간 중인 스킬이 없을 때 무기 대미지가 47% 증가합니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('immobilize', '포박', 'Immobilize', '속박 함정 상태이상이 적용된 적에게 20%의 무기 대미지 증폭을 가합니다.

4번 처치 후, 다음에 적중한 적에게 속박 함정 상태이상을 적용합니다.', 'Amplifies weapon damage by 20% to ensnared enemies.

After 4 kills, applies Ensnare to the next enemy you hit.', '완벽한 포박', '속박 함정 상태이상이 적용된 적에게 25%의 무기 대미지 증폭을 가합니다.

3번 처치 후, 다음에 적중한 적에게 속박 함정 상태이상을 적용합니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('softspot', '약점', 'Soft Spot', '약점을 파괴하면 10초 동안 무기 대미지가 27% 증가합니다.', 'Destroying a Weakpoint grants +27% Weapon Damage for 10s.', '완벽한 약점', '약점을 파괴하면 15초 동안 무기 대미지가 32% 증가합니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('rifleman', '소총수', 'Rifleman', '헤드샷을 적중시킬 때마다 5초 동안 무기 대미지가 +10%만큼 증가합니다. 최대 5번 중첩됩니다. 추가 헤드샷을 적중시키면 지속 시간이 갱신됩니다.', 'Landing headshots adds a stack of bonus +10% weapon damage for 5s.
Max stack is 5.
Additional headshots refresh the duration.', '완벽한 소총수', '헤드샷을 적중시킬 때마다 5초 동안 무기 대미지가 +11%만큼 증가합니다. 최대 6번 중첩됩니다. 추가 헤드샷을 적중시키면 지속 시간이 갱신됩니다.', array['rifle']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('boomerang', '부메랑', 'Boomerang', '치명타 적중 시 50% 확률로 탄환이 탄창에 반환됩니다. 또한, 탄환이 탄창에 반환될 경우 다음 사격의 대미지가 +40%만큼 증가합니다.', 'Critical hits have a 50% chance to return the bullet to the magazine.
If a bullet is returned to the magazine the next shot has +40% increased damage.', '완벽한 부메랑', '치명타 적중 시 75% 확률로 탄환이 탄창에 반환됩니다. 또한, 탄환이 탄창에 반환될 경우 다음 사격의 대미지가 +50%만큼 증가합니다.', array['rifle']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('luckyshot', '뜻밖의 행운', 'Lucky Shot', '탄창 휴대량이 20%만큼 증가합니다. 엄폐한 상태에서 발사한 탄환이 빗나가면 100% 확률로 탄창에 반환됩니다.', 'Magazine capacity is increased by 20%.
Missed shots from cover have a 100% chance to return to the magazine.', '완벽한 뜻밖의 행운', '탄창 휴대량이 30%만큼 증가합니다. 엄폐한 상태에서 발사한 탄환이 빗나가면 100% 확률로 탄창에 반환됩니다.', array['mmr','pistol','rifle']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('determined', '단호함', 'Determined', '헤드샷으로 적을 처치한 이후, 적에게 다음 사격을 적중시키면 무기 대미지가 반드시 치명타 헤드샷으로 적중합니다. 특수효과가 활성화된 동안에는 적을 처치해도 특수효과가 다시 활성화되지 않습니다.', 'After killing an enemy with a headshot the next shot landed on any enemy will be a guaranteed headshot.
While the talent is active killing an enemy will not retrigger the talent.', '완벽한 단호함', '헤드샷으로 적을 처치한 이후, 적에게 다음 사격을 적중시키면 무기 대미지가 반드시 치명타 헤드샷으로 적중합니다. 특수효과가 활성화된 동안에는 적을 처치해도 특수효과가 다시 활성화되지 않습니다.', array['mmr','pistol','rifle']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('behindyou', '따가운 뒤통수', 'Behind You', '자신을 조준 중이지 않은 적에 대한 무기 대미지가 +20%만큼 증폭됩니다.', 'Amplifies weapon damage by +20% to enemies that are not targeting you.', '완벽한 따가운 뒤통수', '자신을 조준 중이지 않은 적에 대한 무기 대미지가 +25%만큼 증폭됩니다.', array['mmr','rifle']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('precisionstrike', '정밀 타격', 'Precision Strike', '20m 이상 떨어진 적을 처치하면 중첩 개수가 증가합니다. 최대 중첩 개수는 3개입니다.
20m 이내의 적에게 공격을 적중시키면 중첩을 전부 사용하여 20m 이내의 적에게 5초 동안 +20% 증폭 대미지를 줍니다.', 'Killing enemies farther than 20m builds up stacks.
Max stack is 3.
Hitting an enemy within 20m will use all stacks to provide +20% Amplified Damage to enemies within 20m for 5s.', '완벽한 정밀 타격', '20m 이상 떨어진 적을 처치하면 중첩 개수가 증가합니다. 최대 중첩 개수는 2개입니다.
20m 이내의 적에게 공격을 적중시키면 중첩을 전부 사용하여 20m 이내의 적에게 5초 동안 +35% 증폭 대미지를 줍니다.', array['ar','lmg','mmr','rifle']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('nearsighted', '근시안', 'Near Sighted', '적정 사거리가 -35%만큼 감소하는 대신 안정성이 +80%만큼 증가합니다.', 'Receive +80% stability at the cost of -35% optimal range.', '완벽한 근시안', '적정 사거리가 -35%만큼 감소하는 대신 안정성이 +100%만큼 증가합니다.', array['ar']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('onempty', '텅 빈 탄창', 'On Empty', '빈 탄창을 재장전하면 10초 동안 무기 조작력이 +60%만큼 증가합니다.', 'Reloading from empty grants +60% weapon handling for 10s.', '완벽한 텅 빈 탄창', '빈 탄창을 재장전하면 10초 동안 무기 조작력이 +80%만큼 증가합니다.', array['ar']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('measured', '신중함', 'Measured', '탄창의 첫 절반을 사용하는 동안에는 발사 속도가 25%로, 무기 대미지가 -25%로 변경됩니다. 나머지 절반을 사용하는 동안에는 발사 속도가 -18%로, 종합 무기 대미지가 30%로 변경됩니다.', 'The top half of the magazine has 25% rate of fire and -25% weapon damage.
The bottom half of the magazine has -18% rate of fire and 30% total weapon damage.', '완벽한 신중함', '탄창의 첫 절반을 사용하는 동안에는 발사 속도가 25%로, 무기 대미지가 -30%로 변경됩니다. 나머지 절반을 사용하는 동안에는 발사 속도가 -18%로, 종합 무기 대미지가 38%로 변경됩니다.', array['ar','lmg','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('overflowing', '공급 과잉', 'Overflowing', '빈 탄창을 3번 재장전 할 때마다 기본 탄창 휴대량이 100%만큼 증가합니다.', 'Every 3 reloads from empty increases your base magazine capacity by 100%.', '완벽한 공급 과잉', '빈 탄창을 2번 재장전 할 때마다 기본 탄창 휴대량이 100%만큼 증가합니다.', array['ar']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('stabilize', '안정화', 'Stabilize', '무기를 사격할 때마다 무기 명중률이 1%만큼, 무기 안정성이 1%만큼 증가합니다. 최대 60%까지 증가합니다.

사격을 중단하면 4초 후에 보너스가 초기화됩니다.', 'Firing your weapon increases Weapon Accuracy by 1% and Weapon Stability by 1% per shot, up to 60%.

If you stop firing, the bonuses reset after 4 seconds.', '완벽한 안정화', '무기를 사격할 때마다 무기 명중률이 1%만큼, 무기 안정성이 1%만큼 증가합니다. 최대 75%까지 증가합니다.

사격을 중단하면 6초 후에 보너스가 초기화됩니다.', array['ar','lmg','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('naked', '벌거숭이', 'Naked', '방어도가 소진된 적에게 공격을 적중시키면 5초 동안 헤드샷 대미지가 +50%만큼 증가합니다.', 'Hitting an enemy with no armor grants +50% headshot damage for 5s.', '완벽한 벌거숭이', '방어도가 소진된 적에게 공격을 적중시키면 8초 동안 헤드샷 대미지가 +50%만큼 증가합니다.', array['mmr']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('firstblood', '선제공격', 'First Blood', '조준경을 사용할 시, 비전투 상황 또는 빈 탄창을 재장전하고 발사하는 첫 발은 어느 신체 부위에 적중하든 헤드샷 대미지를 줍니다.

필요
8배율 이상의 조준경이 필요합니다.', 'If scoped, your first shot fired from out of combat or after fully reloading from empty deals headshot damage to any part of the body hit.

REQUIRES
Requires a Scope with 8x magnification or higher', '완벽한 선제공격', '조준경을 사용할 시, 비전투 상황 또는 빈 탄창을 재장전하고 발사하는 처음 2발의 탄환은 어느 신체 부위에 적중하든 헤드샷 대미지를 줍니다.

필요
8배율 이상의 조준경이 필요합니다.', array['mmr']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('outsider', '외부인', 'Outsider', '적을 처치한 후 10초 동안 적정 사거리가 100%만큼, 명중률이 +100%만큼 증가합니다.', 'After killing an enemy, gain 100% optimal range and +100% accuracy for 10s.', '완벽한 외부인', '적을 처치한 후 10초 동안 적정 사거리가 150%만큼, 명중률이 +125%만큼 증가합니다.', array['smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('unwavering', '흔들림 방지', 'Unwavering', '해당 무기로 교체하면 5초 동안 무기 조작력이 +300%만큼 증가합니다. 적을 처치하면 버프 효과가 갱신됩니다. 다른 무기로 교체하면 5초 동안 해당 버프 효과가 모든 무기에서 비활성화됩니다.', 'Swapping to this weapon grants +300% weapon handling for 5s.
Kills refresh the buff.
Swapping away disables this from all weapons for 5s.', '완벽한 흔들림 방지', '해당 무기로 교체하면 5초 동안 무기 조작력이 +400%만큼 증가합니다. 적을 처치하면 버프 효과가 갱신됩니다. 다른 무기로 교체하면 5초 동안 해당 버프 효과가 모든 무기에서 비활성화됩니다.', array['smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('unhinged', '불안정', 'Unhinged', '안정성이 -25%만큼, 명중률이 -25%만큼 감소하는 대신 무기 대미지가 +18%만큼 증가합니다.', 'Grants +18% weapon damage at the cost of -25% Stability and -25% Accuracy.', '완벽한 불안정', '안정성이 -25%만큼, 명중률이 -25%만큼 감소하는 대신 무기 대미지가 +22%만큼 증가합니다.', array['lmg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('frenzy', '광란', 'Frenzy', '빈 탄창을 재장전할 때, 탄창 휴대량 10발당 9초 동안 발사 속도가 +3%만큼, 무기 대미지가 +3%만큼 증가합니다.', 'For every 10 bullets in the magazine capacity, gain +3% rate of fire and +3% weapon damage for 9s when reloading from empty.', '완벽한 광란', '빈 탄창을 재장전할 때, 탄창 휴대량 8발당 9초 동안 발사 속도가 +3%만큼, 무기 대미지가 +3%만큼 증가합니다.', array['lmg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('overwhelm', '압도적인 화력', 'Overwhelm', '적을 제압하면 12초 동안 무기 대미지가 +10%만큼 증가합니다. 최대 4번 중첩됩니다.', 'Suppressing an enemy, that is not currently suppressed, grants +10% weapon damage for 12 seconds.
Max stack is 4.', '완벽한 압도적인 화력', '적을 제압하면 12초 동안 무기 대미지가 +12%만큼 증가합니다. 최대 4번 중첩됩니다.', array['lmg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('pummel', '연속 타격', 'Pummel', '처치를 3번 연속으로 하면 탄창이 보충되고, 10초 동안 무기 대미지가 +40%만큼 증가합니다.', '3 consecutive kills refills the magazine and grants +40% weapon damage for 10s.', '완벽한 연속 타격', '처치를 2번 연속으로 하면 탄창이 보충되고, 10초 동안 무기 대미지가 +40%만큼 증가합니다.', array['shotgun']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('pumpedup', '의기충천', 'Pumped Up', '재장전 시 10초 동안 무기 대미지가 +1%만큼 증가합니다. 최대 25번 중첩됩니다.', 'Reloading grants +1% weapon damage for 10s.
Stacks up to 25 times.', '완벽한 의기충천', '재장전 시 10초 동안 무기 대미지가 +6%만큼 증가합니다. 최대 5번 중첩됩니다.', array['shotgun']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('brazen', '놋쇠', 'Brazen', '최소 6개 이상의 산탄을 적중시킬 경우, 대상에 적중한 산탄 한발당 해당 무기의 다음 사격 대미지가 +3.5%만큼 증폭됩니다.', 'Receive +3.5% Amplified Damage on the next shot with the weapon for each pellet that hits the target, if at least 6 pellets hit.', '완벽한 놋쇠', '최소 4개 이상의 산탄을 적중시킬 경우, 대상에 적중한 산탄 한발당 해당 무기의 다음 사격 대미지가 +3.5%만큼 증폭됩니다.', array['shotgun']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('salvage', '회수', 'Salvage', '대상 처치 시 +70% 확률로 탄약을 보충합니다.', 'Killing a target has a +70% chance to refill the magazine.', '완벽한 회수', '대상 처치 시 +85% 확률로 탄약을 보충합니다.', array['pistol']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('finisher', '확인사살', 'Finisher', '적을 처치하고 10초 내에 무기를 교체하면 15초 동안 치명타 확률이 30%만큼, 치명타 대미지가 30%만큼 증가합니다.', 'Swapping from this weapon within 10s of killing an enemy grants 30% critical hit chance and 30% critical hit damage for 15s.', '완벽한 확인사살', '적을 처치하고 10초 내에 무기를 교체하면 15초 동안 치명타 확률이 35%만큼, 치명타 대미지가 40%만큼 증가합니다.', array['pistol']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('backandforth', '왕복', 'Back and Forth', '이 무기로 교체 시 10초 동안 +10% 발사 속도 및 +9% 무기 대미지가 부여됩니다.

이 무기에서 다른 무기로 교체 시 10초 동안 +5% 발사 속도 및 +4.5% 무기 대미지가 부여됩니다.

하나의 보너스 그룹을 획득하면 활성화되어 있던 다른 보너스 그룹은 제거됩니다.

이 특수효과 두 개는 동시에 작동하지 않습니다.', 'Swapping to this weapon grants +10% Rate of Fire and +9% Weapon Damage for 10s.

Swapping from this weapon grants +5% Rate of Fire and +4.5% Weapon Damage for 10s.

Receiving one of the bonus groups will remove the other if it''s still active.

Two instances of this Talent will not function at the same time.', '완벽한 왕복', '이 무기로 교체 시 10초 동안 +13% 발사 속도 및 +12% 무기 대미지가 부여됩니다.

이 무기에서 다른 무기로 교체 시 10초 동안 +5% 발사 속도 및 +4.5% 무기 대미지가 부여됩니다.', array['ar','lmg','mmr','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('headscratcher', '헤드 스크래처', 'Head Scratcher', '혼란 상태인 적에 대한 무기 대미지가 30%만큼 증폭됩니다.

4명의 적을 처치하면 다음에 공격을 적중시키는 적에게 혼란을 부여합니다.', 'Amplifies weapon damage by 30% to confused enemies.

After 4 kills, applies Confuse to the next enemy you hit.', '완벽한 헤드 스크래처', '혼란 상태인 적에 대한 무기 대미지가 35%만큼 증폭됩니다.

3명의 적을 처치 하면 다음에 공격을 적중시키는 적에게 혼란을 부여합니다.', array['ar','lmg','mmr','pistol','rifle','shotgun','smg']);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('sportmode', '스피드 모드', 'Sport Mode', '+20% 이동 속도. 이 보너스는 다른 이동 속도 보너스와 중첩되지 않습니다.', '+20% Movement Speed.
This bonus does not stack with other Movement Speed bonuses.', null, null, array[]::text[]);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('blossomharvest', '흐드러진 수확', 'Blossom Harvest', '적의 남은 방어도 및 생명력 합계 10%당 무기 대미지가 3.3% 증폭됩니다.', 'Amplifies Weapon Damage by 3.3% for each 10% combined Armor and Health the enemy has remaining.', null, null, array[]::text[]);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('hiddenrock', '암초', 'Hidden Rock', '헤드샷을 적중시키면 혼란 상태이상 효과를 부여합니다.

재사용 대기시간: 20초
일반 필드에서 수집병자를 처치해 획득. (겨울 이벤트 한정)', 'Headshots apply confuse.

Cooldown: 20s', null, null, array[]::text[]);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('primerrounds', '뇌관 탄환', 'Primer Rounds', '적에게 대미지를 주면 5초 동안 화상 저항을 50%만큼 감소시킵니다.
전문화에서만 획득 가능. (화염방사병 특전)', 'Damaged enemies lose 50% burn resistance for 5 seconds', null, null, array[]::text[]);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('refreshing', '원기 회복', 'Refreshing', '무기가 물줄기를 발사합니다. 아군 요원에게 적중하면 중첩이 쌓입니다. 최대 5회까지 중첩됩니다. 중첩은 2초마다 고갈됩니다.
아군은 최소 중첩 1개를 지니고 있는 동안 위험 요소 방호가 50% 증가합니다.', 'The weapon fires a stream of water.
Hitting an ally agent builds stacks on them.
Max stack is 5.
Stacks deplete every 2s.
While having at least 1 stack, the ally will have +50% Hazard Protection.', null, null, array[]::text[]);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('swift', '전광석화', 'Swift', '엄폐물 간 이동 시 20초 동안 무기 대미지가 +20%만큼 증가합니다.', 'Performing a cover to cover grants +20% weapon damage for 20s.', null, null, array[]::text[]);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('twinklinglights', '반짝이는 빛', 'Twinkling Lights', '반짝이는 빛이 존재하는 밤만이 그들의 마음속에 축제의 힘을 불어넣어 줄 수 있습니다.', 'Only at night with twinkling lights can you fill their heads with festive might', null, null, array[]::text[]);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('perfectlyoptimized', '완벽한 최적화', 'Perfectly Optimized', '무기 조작력이 +40%만큼 증가합니다.', '+40% weapon handling.', null, null, array[]::text[]);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('perfectallegro', '완벽한 빠르고 경쾌하게', 'Perfect Allegro', '발사 속도가 +15%만큼 증가합니다.', '+15% rate of fire.', null, null, array[]::text[]);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('perfectlyaccurate', '완벽한 정밀사격', 'Perfectly Accurate', '명중률이 +80%만큼 증가합니다.', '+80% accuracy.', null, null, array[]::text[]);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('perfectjazzhands', '완벽한 재즈 핸드', 'Perfect Jazz Hands', '재장전 속도가 +50%만큼 증가합니다.', '+50% reload speed.', null, null, array[]::text[]);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('perfectlyextra', '완벽한 여유분', 'Perfectly Extra', '탄창 휴대량이 +50%만큼 증가합니다.', '+50% magazine capacity.', null, null, array[]::text[]);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('perfectdistance', '완벽한 사거리', 'Perfect Distance', '적정 사거리가 +100%만큼 증가합니다.', '+100% optimal range.', null, null, array[]::text[]);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('foamatthemouth', '게거품', 'Foam at the Mouth', '헤드샷으로 적을 처치한 후 다음으로 명중한 적에게 속박 함정을 적용합니다.
속박 함정 상태이상이 적용된 적에게 무기 대미지가 25%만큼 증폭됩니다.', 'After killing an enemy with a headshot, applies Ensnare to the next enemy you hit.
Amplifies Weapon Damage by 25% to ensnared enemies.', null, null, array[]::text[]);
insert into weapon_talents (talent_key, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko, weapon_groups) values ('boilingpoint', '끓는점', 'Boiling Point', '탄창의 처음 53%는 -100%의 치명타 확률이 적용됩니다. 나머지는 100%가 적용됩니다.', 'The first 53% of your magazine will have -100% Critical Hit Chance.
The rest will have 100%.', '완벽한 끓는점', '탄창의 처음 48%는 -100%의 치명타 확률이 적용됩니다. 나머지는 100%가 적용됩니다.', array['ar','lmg','smg']);


-- ===== seed: weapon_named =====

insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:invisiblehand', '보이지 않는 손', 'Invisible Hand', 'ar', 'AUG', '완벽한 빠르고 경쾌하게', '발사 속도가 +15%만큼 증가합니다.
"네놈 눈깔에는 내가 무슨 자선 사업가로 보이냐? 시장 원리대로 해. 내 상품이 탐나면 거래를 하자고."
- 캐시 멘도자, 암상인', '[]'::jsonb, '제퍼슨 플라자');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:pyromaniac', '방화광', 'Pyromaniac', 'ar', 'M4', '완벽한 점화', '화상 상태인 적에 대한 무기 대미지가 30%만큼 증가합니다.

3명의 적을 처치하면 다음에 공격을 적중시키는 적에게 화상을 부여합니다.', '[]'::jsonb, '캠프 화이트 오크');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:shieldsplinterer', '방패 분쇄기', 'Shield Splinterer', 'ar', 'F2000', '완벽한 낙천주의자', '탄창의 탄약이 10%만큼 소모될 때마다 무기 대미지가 +4.5%만큼 증가합니다.', '[]'::jsonb, '상아색 상자 획득 후 캐시 멘도자에게 고정 구매 가능');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:therailsplitter', '나무꾼', 'The Railsplitter', 'ar', 'CTAR-21', '완벽한 정밀사격', '명중률이 +80%만큼 증가합니다.', '[]'::jsonb, '다크존');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:savagewolverine', '흉포한 이리', 'Savage Wolverine', 'ar', 'Honey Badger', '완벽한 근접전의 대가', '7m 내에 있는 대상을 처치하면, 10초 동안 무기 대미지가 +38%만큼 증가합니다.', '[]'::jsonb, '파이어월 현장 연구 보상 (제작 설계도)');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('2c5191ccdb65527d', '탈진', 'Burn Out', 'ar', 'FAMAS', '완벽한 텅 빈 탄창', '빈 탄창을 재장전하면 10초 동안 무기 조작력이 +80%만큼 증가합니다.', '[]'::jsonb, '화이트 하우스(LZ)');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('8b9b555164c0db39', '영광의 섬광', 'Glory Daze', 'ar', 'P416', '완벽한 근시안', '적정 사거리가 -35%만큼 감소하는 대신 안정성이 +100%만큼 증가합니다.', '[]'::jsonb, '화이트 하우스(LZ)');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('b485080838251f06', '광증', 'Manic', 'ar', 'Black Market AK-M', '완벽한 공급 과잉', '빈 탄창을 2번 재장전 할 때마다 기본 탄창 휴대량이 100%만큼 증가합니다.', '[]'::jsonb, '다크존');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:mechanicalanimal', '기계 동물', 'Mechanical Animal', 'ar', 'SIG 556', '완벽한 미래', '무기로 적을 처치하면 19초 동안 스킬 등급이 +1만큼 증가합니다. 최대 4번 중첩됩니다.

스킬 등급이 6 등급인 경우 무기로 적을 처치하면 15초 동안 과충전이 부여됩니다.
과충전 재사용 대기시간 90초.', '[]'::jsonb, '캠프 화이트 오크');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:testsubject', '실험체', 'Test Subject', 'ar', 'PDR', '완벽한 동기화', '적에게 공격을 적중시키면 5초 동안 스킬 대미지가 +20%만큼 증가합니다.

방패가 아닌 스킬을 사용하거나 스킬로 적에게 대미지를 주면 5초 동안 무기 대미지가 +20%만큼 증가합니다.

두 버프 효과가 동시에 활성화되면 대미지 증가량이 두 배가 됩니다.', '[]'::jsonb, '제퍼슨 플라자');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:kingbreaker', '왕 분쇄자', 'Kingbreaker', 'ar', 'TKB-408', '완벽한 심정지', '펄스에 탐지된 적에 대한 무기 대미지가 20%만큼 증가합니다. 3명의 적을 처치하면 다음에 공격을 적중시키는 적에게 펄스를 부여합니다.', '[]'::jsonb, '캠프 화이트 오크');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:borngreat', '위대한 혈통', 'Born Great', 'ar', 'Military G36', '완벽한 안정화', '무기를 사격할 때마다 무기 명중률이 1%만큼, 무기 안정성이 1%만큼 증가합니다. 최대 75%까지 증가합니다.

사격을 중단하면 6초 후에 보너스가 초기화됩니다.', '[]'::jsonb, '코니 아일랜드');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:thedrill', '드릴', 'The Drill', 'ar', 'Carbine 7', '완벽한 정밀 타격', '20m 이상 떨어진 적을 처치하면 중첩 개수가 증가합니다. 최대 중첩 개수는 2개입니다.
20m 이내의 적에게 공격을 적중시키면 중첩을 전부 사용하여 20m 이내의 적에게 5초 동안 +35% 증폭 대미지를 줍니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('c4e358d9ae078c56', '렉싱턴', 'Lexington', 'ar', 'Police M4', null, null, '[{"num":1782,"unit":"","type":"기본 대미지"}]'::jsonb, '특별 이벤트 보상');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('d802e43b6061e11e', '첫눈에 반하다', 'First Sight', 'ar', 'AK-M', null, null, '[{"num":30,"unit":"%","type":"헤드샷 대미지"},{"num":50,"unit":"%","type":"재장전 속도"}]'::jsonb, '특별 이벤트 보상');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:goalie', '골키퍼', 'Goalie', 'ar', 'FAL', '완벽한 압통점', '상태이상 효과에 걸린 적에 대한 무기 대미지가 20%만큼 증폭됩니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:lud', '루드', 'Lud', 'ar', 'SOCOM MK16', '완벽한 능률화', '재사용 대기시간 중인 스킬이 없을 때 무기 대미지가 47% 증가합니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:huntsman', '헌츠맨', 'Huntsman', 'ar', 'FAMAS', '완벽한 광란', '빈 탄창을 재장전할 때, 탄창 휴대량 8발당 9초 동안 발사 속도가 +3%만큼, 무기 대미지가 +3%만큼 증가합니다.', '[]'::jsonb, '애쉬 상자 획득 후 캐시 멘도자에게 고정 구매 가능');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:caretaker', '관리자', 'Caretaker', 'ar', 'G36 Enhanced', '완벽한 킬러', '치명타로 적을 처치하면 10초 동안 치명타 대미지가 +90%만큼 증가합니다.', '[]'::jsonb, '한정 기간 목자(Shepherding) 게임패스 이벤트');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('3c8bbff3d08b9816', '첫 개화', 'First Bloom', 'ar', 'PDR', '흐드러진 수확', '적의 남은 방어도 및 생명력 합계 10%당 무기 대미지가 3.3% 증폭됩니다.', '[]'::jsonb, '벚꽃 이벤트');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:thearchivist', '기록소 관리자', 'The Archivist', 'ar', 'ACR-E', '완벽한 레인저', '대상과의 거리 3m 마다 무기 대미지가 2%만큼 증폭됩니다.', '[]'::jsonb, '기밀 과제: 의회 도서관 회수 임무 완료 보상');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:steamer', '스티머', 'Steamer', 'ar', null, '완벽한 끓는점', '탄창의 처음 48%는 -100%의 치명타 확률이 적용됩니다. 나머지는 100%가 적용됩니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:emelinesguard', '에멜린의 수호자', 'Emeline''s Guard', 'smg', 'FN P90', '완벽한 보존', '적을 처치하면 5초에 걸쳐 방어도가 15%만큼 회복됩니다. 헤드샷으로 처치하면 회복량이 추가로 15%만큼 증가합니다.', '[]'::jsonb, '국회의사당');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:safetydistance', '안전 거리', 'Safety Distance', 'smg', 'MPX', '완벽한 외부인', '적을 처치한 후 10초 동안 적정 사거리가 150%만큼, 명중률이 +125%만큼 증가합니다.', '[]'::jsonb, '국회의사당');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:swapchain', '스왑 체인', 'Swap Chain', 'smg', 'MP7', '완벽한 흔들림 방지', '해당 무기로 교체하면 5초 동안 무기 조작력이 +400%만큼 증가합니다. 적을 처치하면 버프 효과가 갱신됩니다. 다른 무기로 교체하면 5초 동안 해당 버프 효과가 모든 무기에서 비활성화됩니다.', '[]'::jsonb, '은행 본부');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:theapartment', '아파트', 'The Apartment', 'smg', 'MPX', '완벽한 신중함', '탄창의 첫 절반을 사용하는 동안에는 발사 속도가 25%로, 무기 대미지가 -30%로 변경됩니다. 나머지 절반을 사용하는 동안에는 발사 속도가 -18%로, 종합 무기 대미지가 38%로 변경됩니다.', '[]'::jsonb, '다크존');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:thesleigher', '슬레이어', 'The Sleigher', 'smg', 'Tommy Gun', '암초', '헤드샷을 적중시키면 혼란 상태이상 효과를 부여합니다.

재사용 대기시간: 20초', '[]'::jsonb, '특별 이벤트 보상');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('c76a9bb01a069dab', '냉랭한 관계', 'Cold Relations', 'smg', 'Enhanced PP-19', '완벽한 중압감', '사격 시 0.5초마다 치명타 대미지가 +10%만큼 증가합니다. 최대 8번 중첩됩니다.', '[]'::jsonb, '화이트 하우스(LZ)');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('bf5af2f065668025', '원한', 'The Grudge', 'smg', 'CMMG Banshee', '완벽한 앙심', '상태이상 효과가 적용된 적을 처치하면 20초 동안 20m 내에 있는 자신을 포함한 모든 아군의 치명타 확률을 21%만큼, 치명타 대미지를 21%만큼 증가시킵니다.', '[]'::jsonb, '뉴욕의 지배자 스토리: 아론 키너 임무');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:darkwinter', '칠흑의 겨울', 'Dark Winter', 'smg', 'Vector SBR .45 ACP', '완벽한 킬러', '치명타로 적을 처치하면 10초 동안 치명타 대미지가 +90%만큼 증가합니다.', '[]'::jsonb, '다크존');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:cabaret', '카바레', 'Cabaret', 'smg', 'MP5 ST', '완벽한 천둥벼락', '충격 상태인 적에 대한 무기 대미지가 35%만큼 증가합니다. 3명의 적을 처치하면 다음에 공격을 적중시키는 적에게 충격을 부여합니다.', '[]'::jsonb, '은행 본부');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:growngreat', '위대한 결실', 'Grown Great', 'smg', 'Tommy Gun', '완벽한 안정화', '무기를 사격할 때마다 무기 명중률이 1%만큼, 무기 안정성이 1%만큼 증가합니다. 최대 75%까지 증가합니다.

사격을 중단하면 6초 후에 보너스가 초기화됩니다.', '[]'::jsonb, '은행 본부');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:purist', '순수주의자', 'Purist', 'smg', 'Converted SMG-9 A2', '완벽한 능률화', '재사용 대기시간 중인 스킬이 없을 때 무기 대미지가 47% 증가합니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('d9c971a443b2eaf3', '슬링샷', 'Slingshot', 'smg', 'Tactical UMP-45', null, null, '[{"num":45,"unit":"","type":"적정 사거리"}]'::jsonb, '특별 이벤트 보상');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:froth', '거품', 'Froth', 'smg', 'Tactical Vector SBR 9mm', '완벽한 포박', '속박 함정 상태이상이 적용된 적에게 25%의 무기 대미지 증폭을 가합니다.

3번 처치 후, 다음에 적중한 적에게 속박 함정 상태이상을 적용합니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:interchange', '인터체인지', 'Interchange', 'ar', 'Enhanced AUG A3P', '완벽한 왕복', '이 무기로 교체 시 10초 동안 +13% 발사 속도 및 +12% 무기 대미지가 부여됩니다.

이 무기에서 다른 무기로 교체 시 10초 동안 +5% 발사 속도 및 +4.5% 무기 대미지가 부여됩니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:oldglory', '빛바랜 영광', 'Old Glory', 'smg', 'Police T821', '완벽한 근접전의 대가', '7m 내에 있는 대상을 처치하면, 10초 동안 무기 대미지가 +38%만큼 증가합니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:blackfriday', '블랙 프라이데이', 'Black Friday', 'lmg', 'M249', '완벽한 불안정', '안정성이 -25%만큼, 명중률이 -25%만큼 감소하는 대신 무기 대미지가 +22%만큼 증가합니다.', '[]'::jsonb, '다크존');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:sleipnir', '슬레이프니르', 'Sleipnir', 'lmg', 'MG5', '완벽한 광란', '빈 탄창을 재장전할 때, 탄창 휴대량 8발당 9초 동안 발사 속도가 +3%만큼, 무기 대미지가 +3%만큼 증가합니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:tabularasa', '타뷸라 라사', 'Tabula Rasa', 'lmg', 'L86', '완벽한 떨리지 않는 손', '공격을 적중시키면 중첩 효과가 부여되어 명중률과 안정성이 +1%만큼 증가합니다. 75번 중첩되면 중첩 효과는 소모되고 탄창이 보충됩니다.', '[]'::jsonb, '코니 아일랜드 야구장');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:quietroar', '소리 없는 아우성', 'Quiet Roar', 'lmg', 'Stoner LAMG', '완벽한 압도적인 화력', '적을 제압하면 12초 동안 무기 대미지가 +12%만큼 증가합니다. 최대 4번 중첩됩니다.', '[]'::jsonb, '제퍼슨 무역 센터');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:newreliable', '새로운 기준', 'New Reliable', 'lmg', 'RPK-74', '완벽한 최적화', '무기 조작력이 +40%만큼 증가합니다.', '[]'::jsonb, '펜타곤');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:goodtimes', '좋았던 시절', 'Good Times', 'lmg', 'M60', '완벽한 빠른 손', '치명타를 적중시키면 재장전 속도가 5%만큼 증가합니다. 최대 40번 중첩됩니다.', '[]'::jsonb, '다크존');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:carnage', '학살극', 'Carnage', 'lmg', 'NEGEV', '완벽한 새디스트', '출혈 상태인 적에 대한 무기 대미지가 35%만큼 증가합니다.

3명의 적을 처치하면 다음에 공격을 적중시키는 적에게 출혈을 부여합니다.', '[]'::jsonb, '코니 아일랜드 야구장');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:dare', '담력', 'Dare', 'lmg', 'HK GR9', '완벽한 심정지', '펄스에 탐지된 적에 대한 무기 대미지가 20%만큼 증가합니다. 3명의 적을 처치하면 다음에 공격을 적중시키는 적에게 펄스를 부여합니다.', '[]'::jsonb, '타이들 베이슨');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('43c8943509f40296', '스팅어', 'The Stinger', 'lmg', 'M249', '전광석화', '엄폐물 간 이동 시 20초 동안 무기 대미지가 +20%만큼 증가합니다.', '[]'::jsonb, '친구 소개 보상');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:bigshow', '빅 쇼', 'Big Show', 'lmg', 'MG5', '완벽한 천둥벼락', '충격 상태인 적에 대한 무기 대미지가 35%만큼 증가합니다. 3명의 적을 처치하면 다음에 공격을 적중시키는 적에게 충격을 부여합니다.', '[]'::jsonb, '타이들 베이슨');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:cricket', '크리켓', 'Cricket', 'lmg', 'GR9', '완벽한 정밀 타격', '20m 이상 떨어진 적을 처치하면 중첩 개수가 증가합니다. 최대 중첩 개수는 2개입니다.
20m 이내의 적에게 공격을 적중시키면 중첩을 전부 사용하여 20m 이내의 적에게 5초 동안 +35% 증폭 대미지를 줍니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:rusty', '러스티', 'Rusty', 'lmg', 'Classic RPK', '완벽한 압통점', '상태이상 효과에 걸린 적에 대한 무기 대미지가 20%만큼 증폭됩니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('cb523164b8122e9e', '벨 링어', 'Bellringer', 'lmg', 'Infantry MG5', null, null, '[]'::jsonb, '특별 이벤트 보상');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:gearshift', '보호장구 전환', 'Gear Shift', 'lmg', 'Military MK46', '완벽한 신중함', '탄창의 첫 절반을 사용하는 동안에는 발사 속도가 25%로, 무기 대미지가 -30%로 변경됩니다. 나머지 절반을 사용하는 동안에는 발사 속도가 -18%로, 종합 무기 대미지가 38%로 변경됩니다.', '[{"num":12,"unit":"%","type":"비엄폐 대상 대미지"}]'::jsonb, '네임드 아이템 상자 / 목표 전리품');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('7732a61fe01bb152', '화제의 주인공', 'The Headline-grabber', 'lmg', 'M60', '완벽한 중압감', '사격 시 0.5초마다 치명타 대미지가 +10%만큼 증가합니다. 최대 8번 중첩됩니다.', '[]'::jsonb, '기밀 과제: 캐피톨 글로브 이상현상 임무 완료 보상');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:insulttoinjury', '엎친 데 덮친 꼴', 'Insult To Injury', 'lmg', 'Custom L86 A2', '완벽한 헤드 스크래처', '혼란 상태인 적에 대한 무기 대미지가 35%만큼 증폭됩니다.

3명의 적을 처치 하면 다음에 공격을 적중시키는 적에게 혼란을 부여합니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:cuelebre', '쿠엘레브레', 'Cuélebre', 'shotgun', 'Military M870', '완벽한 재즈 핸드', '재장전 속도가 +50%만큼 증가합니다.', '[]'::jsonb, '뷰포인트 박물관');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:rocknroll', '로큰롤', 'Rock n'' Roll', 'shotgun', 'ACS-12', '완벽한 여유분', '탄창 휴대량이 +50%만큼 증가합니다.', '[]'::jsonb, '다크존');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:thesendoff', '고별사', 'The Send-Off', 'shotgun', 'KSG', '완벽한 사거리', '적정 사거리가 +100%만큼 증가합니다.', '[]'::jsonb, '기술 전문가 현장 연구 보상');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:tsunami', '쓰나미', 'Tsunami', 'shotgun', 'SASG-12', '완벽한 연속 타격', '처치를 2번 연속으로 하면 탄창이 보충되고, 10초 동안 무기 대미지가 +40%만큼 증가합니다.', '[]'::jsonb, '뷰포인트 박물관');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:enforcer', '집행자', 'Enforcer', 'shotgun', 'Super 90', '완벽한 연속 타격', '처치를 2번 연속으로 하면 탄창이 보충되고, 10초 동안 무기 대미지가 +40%만큼 증가합니다.', '[]'::jsonb, '예약 구매 보상');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:boomstick', '붐스틱', 'Boomstick', 'shotgun', 'Double Barrel', '완벽한 의기충천', '재장전 시 10초 동안 무기 대미지가 +6%만큼 증가합니다. 최대 5번 중첩됩니다.', '[]'::jsonb, '연방 비상 방공호');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('54b5f07c689903a1', '밀대', 'The Mop', 'shotgun', 'Six12', null, null, '[{"num":10,"unit":"%","type":"처치 시 방어도 회복"}]'::jsonb, '화이트 하우스(LZ)');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:lefty', '왼손잡이', 'Lefty', 'shotgun', 'ACS-12', '완벽한 슬레지해머', '수류탄으로 대미지를 주면 대상에게 징표를 남깁니다.
징표에 걸린 대상은 방어도에 받는 대미지가 20% 만큼 증가하고 이동 속도는 -30%만큼 감소합니다.
징표는 10초 후에 사라집니다.', '[]'::jsonb, 'DARPA 연구 실험실');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:thorn', '가시나무', 'Thorn', 'shotgun', 'AS-12', '완벽한 놋쇠', '최소 4개 이상의 산탄을 적중시킬 경우, 대상에 적중한 산탄 한발당 해당 무기의 다음 사격 대미지가 +3.5%만큼 증폭됩니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:likeglue', '강력한 결합', 'Like Glue', 'shotgun', 'Super 90', '완벽한 놋쇠', '최소 4개 이상의 산탄을 적중시킬 경우, 대상에 적중한 산탄 한발당 해당 무기의 다음 사격 대미지가 +3.5%만큼 증폭됩니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:namedsasg12', '네임드 SASG-12', 'Named SASG-12', 'shotgun', null, '완벽한 보존', '적을 처치하면 5초에 걸쳐 방어도가 15%만큼 회복됩니다. 헤드샷으로 처치하면 회복량이 추가로 15%만큼 증가합니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:lockdown', '봉쇄', 'Lockdown', 'shotgun', 'M870 Express', '완벽한 포박', '속박 함정 상태이상이 적용된 적에게 25%의 무기 대미지 증폭을 가합니다.

3번 처치 후, 다음에 적중한 적에게 속박 함정 상태이상을 적용합니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:commando', '코만도', 'Commando', 'mmr', 'Paratrooper SVD', '완벽한 벌거숭이', '방어도가 소진된 적에게 공격을 적중시키면 8초 동안 헤드샷 대미지가 +50%만큼 증가합니다.', '[]'::jsonb, '포토맥 이벤트 센터');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:designatedhitter', '지정 타자', 'Designated Hitter', 'mmr', 'SR-1', '완벽한 혁신', '헤드샷을 적중시키면 15초 동안 스킬 회복이 +80%만큼 증가합니다.', '[]'::jsonb, '미항공우주국 본부');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:ekimslongstick', '에킴의 장대', 'Ekim''s Long stick', 'mmr', 'Model 700', '완벽한 레인저', '대상과의 거리 3m 마다 무기 대미지가 2%만큼 증폭됩니다.', '[]'::jsonb, '미항공우주국 본부');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:pinprick', '미세침', 'Pinprick', 'mmr', 'SRS', '완벽한 선제공격', '조준경을 사용할 시, 비전투 상황 또는 빈 탄창을 재장전하고 발사하는 처음 2발의 탄환은 어느 신체 부위에 적중하든 헤드샷 대미지를 줍니다.

필요
8배율 이상의 조준경이 필요합니다.', '[]'::jsonb, '다크존');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:thedarkness', '어둠', 'The Darkness', 'mmr', 'MK20 SSR (FN SCAR-SSR)', '완벽한 맹인', '시력 상실 상태인 적에 대한 무기 대미지가 35%만큼 증가합니다. 3명의 적을 처치하면 다음에 공격을 적중시키는 적에게 시력 상실을 부여합니다.', '[]'::jsonb, '뉴욕의 지배자 스토리: 테오 파넬 임무');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('a2937861237563c3', '하얀 사신', 'The White Death', 'mmr', 'M44', null, null, '[{"num":137,"unit":"%","type":"헤드샷 대미지"}]'::jsonb, '화이트 하우스(LZ)');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:scalpel', '수술칼', 'Scalpel', 'mmr', 'Tactical .308', '완벽한 미래', '무기로 적을 처치하면 19초 동안 스킬 등급이 +1만큼 증가합니다. 최대 4번 중첩됩니다.

스킬 등급이 6 등급인 경우 무기로 적을 처치하면 15초 동안 과충전이 부여됩니다.
과충전 재사용 대기시간 90초.', '[]'::jsonb, '미항공우주국 본부');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('1260a21e241ce209', '유물', 'Relic', 'mmr', 'G28 Marksmen Rifle', '완벽한 단호함', '헤드샷으로 적을 처치한 이후, 적에게 다음 사격을 적중시키면 무기 대미지가 반드시 치명타 헤드샷으로 적중합니다. 특수효과가 활성화된 동안에는 적을 처치해도 특수효과가 다시 활성화되지 않습니다.', '[]'::jsonb, '화이트 하우스(LZ)');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:ohcarol', '오, 캐롤', 'Oh Carol', 'mmr', 'M44', '반짝이는 빛', '반짝이는 빛이 존재하는 밤만이 그들의 마음속에 축제의 힘을 불어넣어 줄 수 있습니다.', '[{"num":137,"unit":"%","type":"헤드샷 대미지"}]'::jsonb, '특별 이벤트 보상');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:brutus', '브루투스', 'Brutus', 'mmr', 'M700 Carbon', '완벽한 따가운 뒤통수', '자신을 조준 중이지 않은 적에 대한 무기 대미지가 +25%만큼 증폭됩니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('55b9c4a910487060', '손바구니', 'Handbasket', 'mmr', 'Surplus SVD', null, null, '[{"num":230326,"unit":"","type":"기본 대미지"},{"num":-200,"unit":"","type":"RPM"}]'::jsonb, '특별 이벤트 보상');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:instigator', '주모자', 'Instigator', 'mmr', 'Custom M44', '완벽한 약점', '약점을 파괴하면 15초 동안 무기 대미지가 32% 증가합니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:incendia', '인센디아', 'Incendia', 'mmr', null, '완벽한 뜻밖의 행운', '탄창 휴대량이 30%만큼 증가합니다. 엄폐한 상태에서 발사한 탄환이 빗나가면 100% 확률로 탄창에 반환됩니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:artiststool', '예술가의 도구', 'Artist''s Tool', 'rifle', 'SIG 716', '완벽한 소총수', '헤드샷을 적중시킬 때마다 5초 동안 무기 대미지가 +11%만큼 증가합니다. 최대 6번 중첩됩니다. 추가 헤드샷을 적중시키면 지속 시간이 갱신됩니다.', '[]'::jsonb, '국립 미국사 박물관');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:thevirginian', '버지니아인', 'The Virginian', 'rifle', '1886', '완벽한 부메랑', '치명타 적중 시 75% 확률로 탄환이 탄창에 반환됩니다. 또한, 탄환이 탄창에 반환될 경우 다음 사격의 대미지가 +50%만큼 증가합니다.', '[]'::jsonb, '다크존');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:everlastinggaze', '영원한 시선', 'Everlasting Gaze', 'rifle', 'Mk17 (FN SCAR-H)', '완벽한 영속성', '헤드샷을 적중시키면 다음에 부여하는 상태이상 효과의 상태이상 효과 대미지와 지속 시간이 +75%만큼 증가합니다.

재사용 대기시간: 16초', '[]'::jsonb, '다크존');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:bakersdozen', '덧거리', 'Baker''s Dozen', 'rifle', 'M1A', '완벽한 뜻밖의 행운', '탄창 휴대량이 30%만큼 증가합니다. 엄폐한 상태에서 발사한 탄환이 빗나가면 100% 확률로 탄창에 반환됩니다.', '[]'::jsonb, '디스트릭트 유니언 경기장');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:surge', '쇄도', 'Surge', 'rifle', 'LVOA-C', '완벽한 가시', '헤드샷을 적중시키면 15초 동안 스킬 대미지가 +25%만큼 증가합니다.', '[]'::jsonb, '국립 미국사 박물관');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:harmony', '화합', 'Harmony', 'rifle', 'Resolute MK47', '완벽한 동기화', '적에게 공격을 적중시키면 5초 동안 스킬 대미지가 +20%만큼 증가합니다.

방패가 아닌 스킬을 사용하거나 스킬로 적에게 대미지를 주면 5초 동안 무기 대미지가 +20%만큼 증가합니다.

두 버프 효과가 동시에 활성화되면 대미지 증가량이 두 배가 됩니다.', '[]'::jsonb, '다크존');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:stageleft', '질서정연', 'Stage Left', 'rifle', 'SOCOM M1A', '완벽한 슬레지해머', '수류탄으로 대미지를 주면 대상에게 징표를 남깁니다.
징표에 걸린 대상은 방어도에 받는 대미지가 20% 만큼 증가하고 이동 속도는 -30%만큼 감소합니다.
징표는 10초 후에 사라집니다.', '[]'::jsonb, '디스트릭트 유니언 경기장');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:whisper', '귓속말', 'Whisper', 'rifle', 'M16A2', '완벽한 따가운 뒤통수', '자신을 조준 중이지 않은 적에 대한 무기 대미지가 +25%만큼 증폭됩니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:cooler', '쿨러', 'Cooler', 'rifle', 'SOCOM M1A', '원기 회복', '무기가 물줄기를 발사합니다.
아군 요원에게 적중하면 중첩이 쌓입니다.
최대 5회까지 중첩됩니다.
중첩은 2초마다 고갈됩니다.
아군은 최소 중첩 1개를 지니고 있는 동안 위험 요소 방호가 50% 증가합니다.', '[]'::jsonb, '특별 이벤트 보상');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:achilles', '아킬레스', 'Achilles', 'rifle', 'USC .45 ACP', '완벽한 약점', '약점을 파괴하면 15초 동안 무기 대미지가 32% 증가합니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:trader', '트레이더', 'Trader', 'rifle', 'ACR SS', '완벽한 왕복', '이 무기로 교체 시 10초 동안 +13% 발사 속도 및 +12% 무기 대미지가 부여됩니다.

이 무기에서 다른 무기로 교체 시 10초 동안 +5% 발사 속도 및 +4.5% 무기 대미지가 부여됩니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:brainbreak', '뇌 파괴', 'Brain Break', 'rifle', 'Urban MDR', '완벽한 헤드 스크래처', '혼란 상태인 적에 대한 무기 대미지가 35%만큼 증폭됩니다.

3명의 적을 처치 하면 다음에 공격을 적중시키는 적에게 혼란을 부여합니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:theclaw', '발톱', 'The Claw', 'rifle', 'UIC15 MOD2', '완벽한 정밀 타격', '20m 이상 떨어진 적을 처치하면 중첩 개수가 증가합니다. 최대 중첩 개수는 2개입니다.
20m 이내의 적에게 공격을 적중시키면 중첩을 전부 사용하여 20m 이내의 적에게 5초 동안 +35% 증폭 대미지를 줍니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:teapot', '티팟', 'Teapot', 'rifle', null, '완벽한 끓는점', '탄창의 처음 48%는 -100%의 치명타 확률이 적용됩니다. 나머지는 100%가 적용됩니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('23bbded8721a3a2c', 'P320 XCompact', 'P320 XCompact', 'pistol', 'P320', '완벽한 보존', '적을 처치하면 5초에 걸쳐 방어도가 12%만큼 회복됩니다. 헤드샷으로 처치하면 회복량이 24%로 늘어납니다.', '[]'::jsonb, '기관포병 전문화');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('d44c8fcf99f46e5b', 'Maxim 9', 'Maxim 9', 'pistol', 'Maxim 9', '완벽한 가시', '헤드샷을 적중시키면 15초 동안 스킬 대미지가 +25%만큼 증가합니다.', '[]'::jsonb, '기술 전문가 전문화');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('7e1176c6df1a79d8', '디케로스 스페셜', 'Diceros Special', 'pistol', 'Rhino', '완벽한 낙천주의자', '탄창의 탄약이 10%만큼 소모될 때마다 무기 대미지가 +4%만큼 증가합니다.', '[]'::jsonb, '폭파 전문가 전문화');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('47488ea1142c3872', '명사수용 93R', 'Sharpshooter''s 93R', 'pistol', '93R', '완벽한 흔들림 방지', '해당 무기로 교체하면 5초 동안 무기 조작력이 +400%만큼 증가합니다. 적을 처치하면 버프 효과가 갱신됩니다. 다른 무기로 교체하면 5초 동안 해당 버프가 모든 무기에서 비활성화됩니다.', '[]'::jsonb, '명사수 전문화');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('646ce4dbf09fb284', '생존 전문가 D50', 'Survivalist D50', 'pistol', 'Desert Eagle', '완벽한 새디스트', '출혈 상태인 적에 대한 무기 대미지가 25%만큼 증가합니다.

3명의 적을 처치하면 다음에 공격을 적중시키는 적에게 출혈을 부여합니다.', '[]'::jsonb, '생존 전문가 전문화');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:orbit', '궤도', 'Orbit', 'pistol', '586 Magnum', '완벽한 확인사살', '적을 처치하고 10초 내에 무기를 교체하면 15초 동안 치명타 확률이 35%만큼, 치명타 대미지가 40%만큼 증가합니다.', '[]'::jsonb, '다크존');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:lightningrod', '피뢰침', 'Lightning Rod', 'pistol', 'PF45', '완벽한 회수', '대상 처치 시 +85% 확률로 탄약을 보충합니다.', '[]'::jsonb, '그랜드 워싱턴 호텔');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:mozambiquespecial', '모잠비크 스페셜', 'Mozambique Special', 'pistol', 'M45A1 (M45A1 CQBP)', '완벽한 브레드바스켓', '바디샷을 적중시키면 10초 동안 다음 헤드샷의 헤드샷 대미지가 +70%만큼 증가합니다. 최대 2번 중첩됩니다.', '[]'::jsonb, '뉴욕의 지배자 스토리: 하비에르 카지카 임무');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('cacbec4bf6f628bb', '맞춤형 TDI "Kard"', 'TDI "Kard" Custom', 'pistol', 'KARD-45', null, null, '[{"num":1,"unit":"","type":"스킬 등급"}]'::jsonb, '다크존 (상자)');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('419393dc042dae15', '선지자', 'Prophet', 'pistol', 'Police 686 Magnum', '완벽한 단호함', '헤드샷으로 적을 처치한 이후, 적에게 다음 사격을 적중시키면 무기 대미지가 반드시 치명타 헤드샷으로 적중합니다. 특수효과가 활성화된 동안에는 적을 처치해도 특수효과가 다시 활성화되지 않습니다.', '[]'::jsonb, '화이트 하우스(LZ)');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('dcd5a7db381db784', '수확', 'The Harvest', 'pistol', 'Police 686 Magnum', null, null, '[{"num":10,"unit":"%","type":"기본 대미지"},{"num":-7,"unit":"%","type":"발사 속도"}]'::jsonb, '특별 이벤트 보상');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:quickstep', '퀵스텝', 'Quickstep', 'pistol', 'M45A1 (M45A1 CQBP)', '스피드 모드', '+20% 이동 속도. 이 보너스는 다른 이동 속도 보너스와 중첩되지 않습니다.', '[]'::jsonb, '특별 이벤트 보상');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('weapon:rabidd50', '래비드 D50', 'Rabid D50', 'pistol', 'D50', '게거품', '헤드샷으로 적을 처치한 후 다음으로 명중한 적에게 속박 함정을 적용합니다.
속박 함정 상태이상이 적용된 적에게 무기 대미지가 25%만큼 증폭됩니다.', '[]'::jsonb, null);
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('2b1a73d8eb09ed70', '불씨', 'Firestarter', 'shotgun', 'Sawed Off', '뇌관 탄환', '적에게 대미지를 주면 5초 동안 화상 저항을 50%만큼 감소시킵니다.', '[]'::jsonb, '파이어월 전문화');
insert into weapon_named (item_key, name_ko, name_en, weapon_group, variant, talent_name_ko, talent_desc_ko, attrs, drop_location_ko) values ('48a00726abeb0460', '보조 붐스틱', 'Backup Boomstick', 'shotgun', 'Sawed Off', null, null, '[{"num":17,"unit":"%","type":"산탄총 대미지"}]'::jsonb, '화이트 하우스(LZ)');


-- ===== seed: weapon_exotic =====

insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('f02112941462f426', '선동가', 'Agitator', 'ar', '동요', '이 무기를 수납 중일 때, 50% 낮은 위협 수치를 생성합니다. 이 무기를 10초 동안 수납 상태로 유지하면 발사 준비 상태가 됩니다.

준비 완료 상태일 때 이 무기로 교체하면 +25% 발사 속도, +30% 무기 대미지를 획득하고, 20초 동안 사격 시 +100% 높은 위협 수치를 생성합니다.

타이머가 끝나기 전에 이 무기를 교체하면 보너스가 제거됩니다.', '[{"num":10,"unit":"%","type":"치명타 확률"},{"num":20,"unit":"","type":"탄창 용량"},{"num":50,"unit":"%","type":"교체 속도"}]'::jsonb, '''8년차 시즌 1 - 결집'' 시즌 패스 69레벨 달성 시 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('dc37d47259d585be', '카두세우스', 'Caduceus', 'ar', '카두세우스', '치명타 적중 시 적에게 입힌 대미지의 3%만큼 자신 및 아군을 회복시킵니다.', '[{"num":10,"unit":"%","type":"치명타 확률"},{"num":20,"unit":"","type":"탄약"},{"num":5,"unit":"%","type":"치명타 확률"},{"num":5,"unit":"%","type":"치명타 대미지"}]'::jsonb, '''8년차 시즌 2 - 어둠 속으로'' 시즌 패스 69레벨 달성 시 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('f5b488b22805a6f2', '축전기', 'Capacitor', 'ar', '축전', '적에게 사격을 가하면 최대 40번까지 중첩이 쌓입니다. 중첩당 스킬 대미지가 1.5%만큼 증가합니다. 5초 이후에는 매초 중첩이 1개씩 감소합니다.

스킬 등급 하나당 무기 대미지가 7.5%만큼 증가합니다.', '[{"num":10,"unit":"%","type":"치명타 확률"},{"num":11,"unit":"","type":"탄약"},{"num":30,"unit":"%","type":"치명타 대미지"},{"num":10,"unit":"%","type":"무기 조작력"}]'::jsonb, '최정상에서 챌린지 5개 완료 보상으로 최초 1회 획득. 돌격소총 타겟룻에서 낮은 확률로 획득. 특급 상자를 사용하여 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('8cf3f71f466547c3', '카멜레온', 'Chameleon', 'ar', '적응 본능', '헤드샷을 30번 적중시키면 45초 동안 치명타 확률이 +20%만큼, 치명타 대미지가 +50%만큼 증가합니다.

바디샷을 65번 적중시키면 45초 동안 무기 대미지가 +90%만큼 증가합니다.

레그샷을 20번 적중시키면 45초 동안 재장전 속도가 +150%만큼 증가합니다.

비전투 상태가 되면 버프 효과가 초기화됩니다.', '[{"num":15,"unit":"%","type":"치명타 확률"},{"num":20,"unit":"","type":"탄약"},{"num":20,"unit":"%","type":"명중률"},{"num":10,"unit":"%","type":"안정성"}]'::jsonb, '돌격소총 타겟룻에서 낮은 확률로 획득. 특급 상자를 사용하여 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('304e8816d3b8beb6', '독수리를 거느린 자', 'Eagle Bearer', 'ar', '독수리의 공격', '지속적으로 사격할수록 명중률이 증가하여 최대 +30%만큼 증가합니다.

헤드샷으로 적을 처치하면 15초 동안 집념 버프 효과를 얻습니다.

집념의 효과는 바디샷 적중시키면 1%만큼, 헤드샷을 적중시키면 5%만큼 증가합니다.

집념: 버프 효과가 만료될 때까지 받은 대미지의 40-80%만큼을 보류합니다. 버프 효과가 활성화된 동안 처치한 적의 수에 따라 대미지가 차감되며, 3명을 처치하면 받은 대미지의 100% 차감됩니다.', '[{"num":15,"unit":"%","type":"치명타 확률"},{"num":30,"unit":"","type":"탄약"},{"num":20,"unit":"%","type":"치명타 대미지"},{"num":10,"unit":"%","type":"무기 조작력"}]'::jsonb, '칠흑의 시간 작전 공격대 보스 처치 시 일정 확률로 획득. 칠흑의 시간 작전 공격대 클리어 후 상자에서 일정 확률로 획득. 다크존에서 낮은 확률로 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('1ae655dae4412b9c', '성 엘모의 엔진', 'St. Elmo''s Engine', 'ar', '악툼 에스트', '이 무기로 적을 사격하면 중첩 1개를 얻습니다.

100번 중첩되면 다음 탄창의 100%가 충격탄으로 보충됩니다.', '[{"num":15,"unit":"%","type":"치명타 대미지"},{"num":30,"unit":"","type":"탄약"},{"num":15,"unit":"%","type":"치명타 확률"},{"num":10,"unit":"%","type":"무기 조작력"}]'::jsonb, '돌격소총 타겟룻에서 낮은 확률로 획득. 특급 상자를 사용하여 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('ccaf2a13cf6e1255', '스트레가', 'Strega', 'ar', '불안', '적 처치 시 20m 내의 모든 적에게 징표를 새깁니다. 동일한 적에게 여러 개의 징표를 새길 수 있습니다. 한 명의 적에게 최대로 중첩할 수 있는 징표 개수는 5개입니다. 모든 징표는 마지막으로 부여된 지 10초 후 사라집니다. 징표가 새겨진 적의 징표 하나당 +15% 증폭 대미지를 줍니다.', '[{"num":20,"unit":"","type":"탄약"},{"num":5,"unit":"%","type":"치명타 대미지"},{"num":5,"unit":"%","type":"치명타 확률"},{"num":10,"unit":"%","type":"무기 조작력"}]'::jsonb, '돌격소총 타겟룻에서 낮은 확률로 획득. 특급 상자를 사용하여 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('556498cce3711b57', '빅혼', 'The Bighorn', 'ar', '거물 사냥꾼', '조준경으로 조준 시 반자동 사격 모드로 전환되고 각 탄환이 450%의 무기 대미지를 줍니다.

헤드샷을 적중시키면 헤드샷 대미지가 +6%만큼 증가합니다. 최대 25번 중첩됩니다.
최대 중첩에 도달하면 모든 중첩이 사라질 때까지 4초마다 중첩이 10개씩 감소합니다. 헤드샷은 중첩 감소를 지연시킵니다.', '[{"num":40,"unit":"%","type":"헤드샷 대미지"},{"num":20,"unit":"%","type":"재장전 속도"},{"num":20,"unit":"%","type":"명중률"},{"num":20,"unit":"%","type":"안정성"}]'::jsonb, '전설 난이도 미션의 보스 처치 시 낮은 확률로 획득. 최정상 전설 난이도에서 낮은 확률로 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('2c3b838abdafd896', '역화', 'Backfire', 'smg', '등가교환', '적에게 대미지를 주면 치명타 대미지가 +2%만큼 증가하는 중첩 효과를 얻습니다. 중첩 효과는 10초 동안 지속되며, 최대 100번 중첩됩니다.

재장전 시 자신에게 10초 동안 출혈 상태이상 효과를 부여해 중첩당 0.5%의 방어도 대미지를 받습니다.', '[{"num":15,"unit":"%","type":"치명타 확률"},{"num":20,"unit":"","type":"탄약"},{"num":15,"unit":"%","type":"치명타 대미지"},{"num":10,"unit":"%","type":"안정성"}]'::jsonb, '목표 전리품 기관단총 지역/미션에서 일정 확률로 획득. 주 임무 완료 또는 특급 상자에서 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('be65a412d10c8891', '죽음의 귀부인', 'Lady Death', 'smg', '안도의 호흡', '이동 시 매초 4개의 중첩을, 전력 질주 시 8개의 중첩을 얻습니다. 최대중첩은 사용 중인 무기의 탄창 용량과 동일합니다.

탄환을 발사할 때마다 중첩 하나를 소모하여 대미지가 75%만큼 증폭됩니다.

적을 처치하면 10초 동안 이동 속도가 +20%만큼 증폭됩니다.', '[{"num":15,"unit":"%","type":"치명타 확률"},{"num":10,"unit":"%","type":"재장전 속도"},{"num":10,"unit":"%","type":"치명타 대미지"},{"num":500,"unit":"%","type":"근접 대미지"}]'::jsonb, '목표 전리품 기관단총 지역/미션에서 일정 확률로 획득. 주 임무 완료 또는 특급 상자에서 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('7538f8e307f3dbd9', '우로보로스', 'Ouroboros', 'smg', '만인지상', '요원이 상태이상 효과에 걸릴 경우, 해당 요원이 사용하는 다음 탄창에 든 50%의 탄약이 대상에게 똑같은 상태이상 효과를 부여합니다.
이 효과는 전투 중에만 발동합니다.', '[{"num":10,"unit":"%","type":"치명타 대미지"},{"num":25,"unit":"%","type":"재장전 속도"},{"num":10,"unit":"%","type":"발사 속도"},{"num":10,"unit":"%","type":"치명타 확률"}]'::jsonb, '습격 ''실낙원'' 클리어 보상 상자에서 낮은 확률로 획득(10%). 습격 ''실낙원'' 보스 처치 시 낮은 확률로 획득(1%).');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('82375d5f37a0525e', '옥스페커', 'Oxpecker', 'smg', '공생', '방패 사용 시 매초 방패 생명력을 10%만큼 잃습니다.
이 무기로 입힌 대미지의 25%만큼 방패가 회복됩니다.', '[{"num":50,"unit":"%","type":"적정 사거리"},{"num":10,"unit":"","type":"탄약"},{"num":15,"unit":"%","type":"치명타 확률"}]'::jsonb, '''6년차 시즌 3 - 진실의 무게'' 시즌 패스 69레벨 달성 시 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('2889bd5d981c4f8d', '촉새', 'The Chatterbox', 'smg', '끝없는 수다', '재장전 시 15m 내에 있는 적 한 명당 발사 속도가 25%만큼 증가합니다. 재장전한 탄창을 소진할 때까지 지속됩니다.

최대중첩: 5번

적을 처치하면 탄창이 50%만큼 보충됩니다.', '[{"num":15,"unit":"%","type":"치명타 확률"},{"num":10,"unit":"","type":"탄약"},{"num":15,"unit":"%","type":"치명타 대미지"},{"num":10,"unit":"%","type":"무기 조작력"}]'::jsonb, '목표 전리품 기관단총 지역/미션에서 일정 확률로 획득. 영웅 난이도 미션의 마지막 보스 처치 시 일정 확률로 획득. 주 임무 완료 또는 특급 상자에서 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('d0b6770a1a272649', '부두목', 'Underboss', 'smg', '갱단 히트', '이 무기로 적을 사격하면 표식이 부여됩니다. 한 번에 하나의 표식만 부여할 수 있으며, 다른 적을 사격하면 표식이 옮겨갑니다.
다른 요원이 이 무기를 사용하면 같은 적에게 추가 표식을 부여할 수 있습니다. 적에게 부여할 수 있는 최대 표식 개수는 4개입니다.
이 무기는 표식이 부여된 적에게 20% 증폭된 피해를 줍니다. 이 보너스는 자신의 표식을 제외한 적에게 추가된 표식 하나당 5%씩 증가합니다.', '[{"num":15,"unit":"%","type":"치명타 확률"}]'::jsonb, '''8년차 시즌 2 - 어둠 속으로'' 시즌에서 ''클라이막스 임무: 조디악'' 추격전 임무를 마스터 난이도로 최초 완료 시 확정 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('1f556c33bdad7687', '빅 알레한드로', 'Big Alejandro', 'lmg', '엄폐 사격 특화', '엄폐 상태일 때 발사한 모든 탄환은 무기 대미지를 1%만큼 증가시켜 최대 100%까지 증가합니다. 보너스는 15초동안 지속됩니다.
엄폐 상태일 때 이 무기로 처치 시 지속 시간이 초기화됩니다.
보너스 대미지는 재장전, 무기 교체, 또는 전투 종료 시 취소됩니다.', '[]'::jsonb, '''더 디비전 10주년 기념'' 이벤트 패스 레벨 46 달성 시 획득 가능.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('e0e1a14de4d06e3c', '블루스크린', 'Bluescreen', 'lmg', '교란탄', '적에게 사격 시 해당 적에게 징표를 남기고 요원에게 최대 50번 중첩되는 효과를 부여합니다. 징표가 부여된 적을 사격하면 징표가 갱신되고 요원은 중첩을 얻습니다. 방패가 아닌 스킬을 사용하면 요원에게 부여된 모든 중첩을 제거하고 징표에 걸린 대상에게 효과를 발동시킵니다.

1-10 중첩: 5초 동안 징표에 걸린 대상을 펄스로 탐지.
11-25 중첩: 5초 동안 펄스 탐지 및 방해 상태이상 부여.
26-49 중첩: 5초 동안 펄스 탐지 및 방해·방향감각 상실 부여.
50 중첩: 5초 동안 징표에 걸린 대상과 주변 10m 내 모든 적을 펄스 탐지하고 방해·방향감각 상실 부여. 징표에 걸린 적이 사망하면 즉시 발동.', '[{"num":20,"unit":"%","type":"재장전 속도"},{"num":15,"unit":"%","type":"무기 조작력"},{"num":20,"unit":"%","type":"발사 속도"},{"num":10,"unit":"%","type":"안정성"}]'::jsonb, '''시즌 9: 숨겨진 동맹''에서 시즌 레벨 85를 달성하면 보상으로 확정 획득. 특급 장비 상자에서 일정 확률로 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('4efa2d4144f5942e', '탄환 제왕', 'Bullet King', 'lmg', '탄환 지옥', '이 무기는 재장전이 필요 없습니다.

하나의 적을 100번 적중시킬 때마다 자신 및 아군의 탄약 보유량을 일정량 보충시킵니다.', '[{"num":15,"unit":"%","type":"치명타 확률"},{"num":20,"unit":"%","type":"안정성"}]'::jsonb, '라이커 미션 보스 처치 시 일정 확률로 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('c99d9d653e6c3d51', '강철의 허파', 'Iron Lung', 'lmg', '열렬한 헌신', '사격 시 무기에 열기가 쌓여 열기 미터기가 충전됩니다. 미터기는 무기 표준 탄창 용량의 50%에 해당합니다.

미터기가 완전히 충전될 경우, 무기에서 발사되는 탄환이 적을 불태웁니다.

사격 중이지 않을 때는 미터기 충전량이 지속적으로 감소합니다. 무기 재장전 또는 교체 시 미터기가 완전히 소진됩니다.', '[{"num":10,"unit":"%","type":"치명타 대미지"},{"num":35,"unit":"","type":"탄약"},{"num":10,"unit":"%","type":"치명타 대미지"}]'::jsonb, '인형사 시즌에서 시즌 레벨 85를 달성하면 보상으로 확정 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('bfd19739385b1a79', '파칸', 'Pakhan', 'lmg', '파칸', '이 무기로 적을 처치할 때마다 다음 탄창의 탄창 용량이 75% 증가하는 중첩을 얻으며, 최대 4번까지 중첩됩니다.', '[{"num":15,"unit":"%","type":"무기 대미지"},{"num":20,"unit":"","type":"탄약"},{"num":15,"unit":"%","type":"치명타 확률"},{"num":10,"unit":"%","type":"재장전 속도"}]'::jsonb, '크로스로드 시즌에서 시즌 레벨 69를 달성하면 보상으로 확정 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('800680b96d315ecd', '역병', 'Pestilence', 'lmg', '아웃캐스트의 역병', '공격을 적중시키면 10초에 걸쳐 100%의 무기 대미지를 주는 디버프 효과를 부여합니다. 최대 50번 중첩됩니다.

적이 이 디버프 효과가 부여된 상태로 사망하면 주위 25m 내에 있는 적에게 중첩의 100%가 이전됩니다.', '[{"num":10,"unit":"%","type":"발사 속도"},{"num":10,"unit":"%","type":"명중률"},{"num":10,"unit":"%","type":"안정성"}]'::jsonb, '다크존 요충지·필드 보스, 영웅 난이도 미션 마지막 보스, 목표 전리품 경기관총 지역/미션, 칠흑의 시간 작전 공격대 보스 처치 시 일정 확률로 획득. 주 임무 완료 또는 특급 상자에서 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('88fac0c245068167', '파프니르', 'Fafnir', 'shotgun', '드래곤 브레스', '이 무기는 용의 숨결 탄환을 발사합니다.

각 사격마다 40% 확률로 적에게 화상을 부여합니다. 이미 화상 상태인 적에게는 화상을 부여할 수 없습니다.

무기 대미지는 상태이상 효과 보너스의 50%만큼 증폭됩니다.', '[{"num":10,"unit":"%","type":"재장전 속도"},{"num":10,"unit":"%","type":"치명타 확률"},{"num":10,"unit":"%","type":"무기 조작력"},{"num":10,"unit":"%","type":"안정성"}]'::jsonb, '''8년차 시즌 3 - 붉은 지평선'' 시즌 패스 69레벨 달성 시 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('6ce8e9c0ebebb8f5', '자장가', 'Lullaby', 'shotgun', '잠귀신', '근접 공격 시 정예가 아닌 적을 즉시 처치합니다.

재사용 대기시간: 15초.', '[{"num":15,"unit":"%","type":"명중률"},{"num":15,"unit":"%","type":"재장전 속도"},{"num":25,"unit":"%","type":"적정 사거리"}]'::jsonb, '예약구매자 증정 한정판.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('29e411f4fe8ef1f9', '오버로드', 'Overlord', 'shotgun', '굴복', '적을 적중시키면 5초 동안 적중한 산탄 한 발당 이동 속도 -4% 감소를 부여합니다.
해당 적을 다시 사격하면 중첩을 다시 부여합니다.', '[{"num":15,"unit":"%","type":"치명타 대미지"},{"num":15,"unit":"%","type":"재장전 속도"},{"num":20,"unit":"%","type":"안정성"}]'::jsonb, '''8년차 시즌 1: 최초의 로그''에서 시즌 레벨 90을 달성하면 보상으로 확정 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('b5ee961d5d4186ba', '스콜피오', 'Scorpio', 'shotgun', '패혈증성 쇼크', '대상에게 사격을 가하면 10초 동안 지속되는 맹독 중첩을 부여합니다. 중첩이 쌓일수록 대상의 디버프 효과는 극심해집니다.

2 중첩: 중독
4 중첩: 방향감각 상실
6 중첩: 충격
9 중첩: 대상이 받는 모든 대미지 20%만큼 증가. 이후 중첩은 증가하지 않습니다.

상태이상 효과 지속 시간은 해당 사격에서 산탄이 명중하는 비율에 기반합니다.', '[{"num":10,"unit":"%","type":"치명타 확률"},{"num":10,"unit":"%","type":"재장전 속도"},{"num":10,"unit":"%","type":"안정성"},{"num":10,"unit":"%","type":"무기 조작력"}]'::jsonb, '''시즌 4: 경계의 끝''에서 시즌 레벨 55를 달성하면 보상으로 확정 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('a4771ba18c0b4447', '보안관', 'Sheriff', 'shotgun', '오텐티코', '+35% 무기 대미지
+100% 명중률
대미지 감소 없음

이러한 보너스들은 무기의 기본 능력치에 포함되어 있습니다.', '[]'::jsonb, '''7년차 시즌 3 - 반란'' 추격전에서 ''연방 제철소: 앤더슨 장군'' 임무를 마스터 난이도로 최초 완료 시 확정 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('6b04a1545a109872', '달콤한 꿈', 'Sweet Dreams', 'shotgun', '잠귀신', '근접 공격 시 정예가 아닌 적을 즉시 처치합니다.

재사용 대기시간: 15초.', '[{"num":15,"unit":"%","type":"명중률"},{"num":15,"unit":"%","type":"재장전 속도"},{"num":25,"unit":"%","type":"적정 사거리"}]'::jsonb, '아웃캐스트 미션 보스, 영웅 난이도 마지막 보스, 칠흑의 시간 작전 공격대 보스 처치 시 일정 확률로 획득. 목표 전리품 산탄총 지역/미션. 주 임무 완료 또는 시즌 이벤트 보상 특급 상자에서 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('b83c0345f6264e95', '공포의 칙령', 'Dread Edict', 'mmr', '마침표', '적에게 사격을 가하면 중첩이 쌓이며, 최대 20번 중첩됩니다.
헤드샷은 2개의 중첩을 부여합니다.
중첩 하나당 무기 대미지는 2%만큼, 헤드샷 대미지는 5%만큼 증가합니다. 재장전 시 모든 중첩을 제거하고, 10초 동안 제거된 중첩 하나당 최대 방어도의 5%에 해당하는 임시 방어도를 얻습니다.

공포의 칙령을 사용해 헤드샷으로 적을 처치하면 탄창의 모든 탄환이 보충됩니다. 단, 해당 효과는 재장전으로 간주되지 않습니다.', '[{"num":40,"unit":"%","type":"헤드샷 대미지"},{"num":15,"unit":"%","type":"무기 조작력"},{"num":10,"unit":"%","type":"치명타 확률"},{"num":10,"unit":"%","type":"안정성"}]'::jsonb, '목표 전리품 지정사수소총 지역/미션에서 일정 확률로 획득. 주 임무 완료 또는 특급 상자에서 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('110d25b600f6e4e5', '사마귀', 'Mantis', 'mmr', '등잔 밑', '조준경으로 조준 시 플레이어를 겨냥하고 있지 않은 적에 대한 추가 정보를 표시합니다.

플레이어를 겨냥하고 있지 않은 적에 대한 헤드샷 및 약점 대미지가 50%만큼 증가합니다.

헤드샷으로 적을 처치하면 미끼 스킬의 재사용 대기시간이 초기화됩니다. 현재 미끼가 활성화되어 있으면 재사용 대기시간이 발동할 때 적용됩니다.', '[{"num":40,"unit":"%","type":"헤드샷 대미지"},{"num":10,"unit":"%","type":"재장전 속도"},{"num":5,"unit":"%","type":"치명타 확률"},{"num":10,"unit":"%","type":"안정성"}]'::jsonb, '목표 전리품 지정사수소총 지역/미션에서 일정 확률로 획득. 주 임무 완료 시 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('720a4d548dbce966', '네메시스', 'Nemesis', 'mmr', '전자기 가속기', '방아쇠를 놓기 전까지 당긴 시간에 비례하여 무기 대미지를 0-100%만큼 줍니다.', '[{"num":45,"unit":"%","type":"헤드샷 대미지"},{"num":10,"unit":"%","type":"재장전 속도"},{"num":5,"unit":"%","type":"치명타 대미지"},{"num":5,"unit":"%","type":"무기 조작력"}]'::jsonb, '목표 전리품 지정사수소총 지역/미션에서 일정 확률로 획득. 영웅 난이도 마지막 보스 처치 시 일정 확률로 획득. 주 임무 완료 또는 특급 상자에서 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('815d636ff1c9189f', '프리마돈나', 'Prima Donna', 'mmr', '보는 건 돼...', '비전투 시 10중첩을 얻습니다. 이 무기는 중첩당 무기 대미지가 +12.5%만큼 증폭됩니다.
...하지만 손댈 수는 없지: 대미지를 받을 때마다 1중첩을 소모하여 피해를 복구하며, 매 3초마다 1중첩을 회복합니다.', '[{"num":25,"unit":"%","type":"헤드샷 대미지"},{"num":7.5,"unit":"%","type":"무기 조작력"},{"num":7.5,"unit":"%","type":"무기 조작력"},{"num":20,"unit":"%","type":"헤드샷 대미지"}]'::jsonb, '습격 ''실낙원'' 클리어 보상 상자 또는 보스 처치 시 낮은 확률로 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('369cddb15c38e91d', '신성 제국', 'Sacrum Imperium', 'mmr', '덫', '조준경 내 적들을 태그합니다(최대 10명). 징표에 걸린 대상을 헤드샷으로 처치하면 다른 모든 대상은 10초 동안 이동 속도가 50%만큼 감소하고 화상 상태이상 효과가 부여됩니다.

30초의 재사용 대기시간이 적용됩니다.

또 다른 적을 헤드샷으로 처치하면 재사용 대기시간이 10초만큼 감소합니다.

대상을 1초 동안 조준선 위에 두면 대상에게 징표가 부여됩니다.', '[{"num":20,"unit":"%","type":"헤드샷 대미지"},{"num":10,"unit":"%","type":"헤드샷 대미지"},{"num":20,"unit":"%","type":"적정 사거리"},{"num":20,"unit":"%","type":"안정성"}]'::jsonb, '목표 전리품 지정사수소총 지역/미션에서 일정 확률로 획득. 주 임무 완료 또는 특급 상자에서 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('53d4bdd221599317', '슈라우드', 'Shroud', 'mmr', '최우선 표적', '등급 구조 내에서 가장 높은 랭크의 적에 대한 무기 대미지가 125% 증폭됩니다.

1등급: 헌터, 로그 요원, 리더, 장갑병, 방패병, 중화기병, 로켓병, 의무병, 조종수, 투견, 습격자
2등급: 지원병, 엔지니어, 경호원, 포박병, 폭탄광, 초소형 전차, 드론 조종사
3등급: 기타 모든 적 또는 스킬 머신', '[{"num":25,"unit":"%","type":"헤드샷 대미지"},{"num":25,"unit":"%","type":"재장전 속도"},{"num":20,"unit":"%","type":"헤드샷 대미지"},{"num":5,"unit":"%","type":"치명타 확률"}]'::jsonb, '''7년차 시즌 2 - 협정'' 시즌 패스 69레벨 달성 시 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('869de62ee2e41b76', '달콤 쌉싸름', 'Bittersweet', 'rifle', '수혈', '헤드샷 적중 시 중첩이 쌓이며, 최대 8까지 중첩됩니다. 아군 또는 스킬을 사격할 때, 각 중첩당 무기 종합 대미지의 50%만큼 수리합니다.

치유된 아군은 10초 동안 중첩당 당신의 수리 스킬 보너스의 50%를 보너스 방어도로 받습니다.

최대 중첩 상태에서 아군 또는 스킬을 치유한 후 8초 동안 모든 공격이 헤드샷으로 적중합니다.', '[{"num":5,"unit":"%","type":"헤드샷 대미지"},{"num":5,"unit":"%","type":"헤드샷 대미지"},{"num":10,"unit":"","type":"탄약"}]'::jsonb, '''7년차 시즌 3 - 반란''에서 시즌 레벨 69 달성 시 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('5fa72ac1537bfe5c', '다이아몬드백', 'Diamondback', 'rifle', '고통의 상흔', '다이아몬드백이 무작위로 20m 내의 적에게 징표를 남깁니다. 20m 내에 적이 없을 경우 가장 가까운 적에게 징표를 남깁니다.

징표가 부여된 적을 공격하면 무조건 대미지가 20%만큼 증폭한 치명타로 적중하며, 징표는 소모됩니다.

징표가 부여된 적을 적중시키면 5초 동안 모든 사격이 치명타로 적중합니다.

이후 새로운 적에게 징표를 남깁니다. 또한, 재장전해도 무작위 적에게 징표를 남깁니다.', '[{"num":10,"unit":"%","type":"명중률"},{"num":10,"unit":"%","type":"재장전 속도"},{"num":15,"unit":"%","type":"치명타 대미지"},{"num":10,"unit":"%","type":"안정성"}]'::jsonb, '켄리 대학 원정 미션 클리어 후 예배당에서 확정 획득. 영웅 난이도 마지막 보스 처치, 목표 전리품 소총 지역/미션. 주 임무 완료 또는 시즌 이벤트 특급 상자에서 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('2c21b9bc530c94a8', '주치의', 'Doctor Home', 'rifle', '주치의', '이 무기로 적을 사격하면 5초 동안 징표를 남깁니다.
징표에 걸린 대상이 사망하면 10%의 방어도 회복 키트를 떨어뜨립니다.
키트는 자동으로 획득되며, 파티 전체에 효과가 부여됩니다. 키트는 보너스 방어도를 제공하지 않습니다.', '[{"num":10,"unit":"%","type":"명중률"},{"num":10,"unit":"%","type":"재장전 속도"},{"num":10,"unit":"%","type":"안정성"},{"num":10,"unit":"%","type":"무기 조작력"}]'::jsonb, '''시즌 10: 힘의 대가'' 추격전을 완료하면 보상으로 확정 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('775863fe25a62e6e', '무자비', 'Merciless', 'rifle', '이중 방아쇠', '이 무기는 방아쇠를 당길 때, 놓을 때 발사됩니다.

두 탄환을 같은 적에게 적중시키면 중첩을 얻습니다.

7번 중첩 시 적을 사격하면 +500%만큼 증폭한 대미지를 주고 반경 7m 규모의 폭발을 일으켜 500%의 무기 대미지를 줍니다. 이 과정에서 중첩은 소모됩니다.', '[{"num":15,"unit":"%","type":"명중률"},{"num":10,"unit":"%","type":"재장전 속도"},{"num":15,"unit":"%","type":"안정성"},{"num":15,"unit":"%","type":"무기 조작력"}]'::jsonb, '소총 타겟룻에서 낮은 확률로 획득. 특급 상자를 사용하여 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('9eb9dd83029296e3', '냉혈한', 'Ruthless', 'rifle', '이중 방아쇠', '이 무기는 방아쇠를 당길 때, 놓을 때 발사됩니다.

두 탄환을 같은 적에게 적중시키면 중첩을 얻습니다.

7번 중첩 시 적을 사격하면 +500%만큼 증폭한 대미지를 주고 반경 7m 규모의 폭발을 일으켜 500%의 무기 대미지를 줍니다. 이 과정에서 중첩은 소모됩니다.', '[{"num":15,"unit":"%","type":"명중률"},{"num":10,"unit":"%","type":"재장전 속도"},{"num":15,"unit":"%","type":"안정성"},{"num":15,"unit":"%","type":"무기 조작력"}]'::jsonb, '얼티밋 에디션 예약 구매 시 지급되는 엘리트 요원 팩에 포함된 특전 소총. 무자비 획득 시 외형 변경 설계도로도 얻을 수 있음.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('c9ebfc74bf49b727', '스틸 앤 선즈 ACR', 'Steel & Sons ACR', 'rifle', '확인과 실행', '바디샷 적중 시 적에게 10초 동안 중첩 1개를 부여합니다. 최대 4까지 중첩됩니다. 다른 적을 명중하면 모든 중첩이 제거됩니다.

이 무기는 중첩당 +4% 증폭된 대미지를 줍니다.

중첩을 가진 적에게 헤드샷 적중 시 모든 중첩을 소모하여 중첩당 +11% 증폭된 대미지를 줍니다.

적의 약점을 파괴할 시 해당 적은 5초 동안 당신에게 받는 대미지가 +30% 증폭됩니다.', '[{"num":15,"unit":"%","type":"치명타 확률"},{"num":10,"unit":"","type":"탄약"},{"num":10,"unit":"%","type":"무기 조작력"},{"num":10,"unit":"%","type":"재장전 속도"}]'::jsonb, '습격 ''브로큰 레인'' 클리어 보상 상자 또는 보스 처치 시 낮은 확률로 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('0ac25601c15968a8', '탐식자', 'The Ravenous', 'rifle', '게리와 프레키', '방아쇠를 당기면 양쪽 총열에서 발포합니다.

오른쪽 견착 상태에서 적중시키면 공격 뇌관을 부여합니다. 왼쪽 견착 상태에서 적중시키면 방어 뇌관을 부여합니다.

어느 한 견착 상태에서 적중시키면 부여되어 있는 반대쪽 견착 뇌관을 폭파합니다.

폭파 시 공격 뇌관은 각각 100%의 무기 대미지를 주는 한편 방어 뇌관은 각각 5초동안 보너스 방어도를 +4%만큼 부여하고 장갑판에 주는 대미지를 +10%만큼 증가시킵니다.

10번 중첩 시 뇌관 효율이 두 배로 증가합니다.', '[{"num":5,"unit":"%","type":"치명타 확률"},{"num":10,"unit":"%","type":"재장전 속도"},{"num":10,"unit":"%","type":"안정성"},{"num":5,"unit":"%","type":"치명타 대미지"}]'::jsonb, '철마 작전 공격대 보스 처치 또는 클리어 후 상자에서 일정 확률로 획득. 다크존에서 낮은 확률로 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('3d05bc02ec2fc39a', '빈디케이터', 'Vindicator', 'rifle', '오티즈 강습 인터페이스', '무기 조준경 조준 시 각 적의 무작위 신체 부위를 강조 표시합니다.
강조 표시된 신체 부위에 대한 무기 대미지가 +60%만큼 증폭됩니다.', '[{"num":15,"unit":"%","type":"명중률"},{"num":5,"unit":"","type":"탄약"},{"num":10,"unit":"%","type":"적정 사거리"},{"num":15,"unit":"%","type":"안정성"}]'::jsonb, 'NSA 기술 상점에서 구매(350 기술).');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('d7c71f4bca2ba0d4', '바쁜 꼬마 벌', 'Busy Little Bee', 'pistol', '바쁜 꼬마 벌', '서로 다른 적을 사격할 때마다 1중첩을 얻습니다. 최대 10번 중첩됩니다. 각 중첩은 무기 대미지를 20%만큼 증가합니다.

중첩은 요원이 무기를 교체할 때 활성화되며 10초 동안 지속됩니다.', '[{"num":25,"unit":"%","type":"적정 사거리"},{"num":10,"unit":"%","type":"재장전 속도"},{"num":10,"unit":"%","type":"안정성"},{"num":5,"unit":"%","type":"치명타 확률"}]'::jsonb, '''시즌 10: 힘의 대가''에서 시즌 레벨 85를 달성하면 보상으로 확정 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('deeafe032b788ffb', '자유', 'Liberty', 'pistol', '자유가 아니면 죽음을', '공격을 적중시키면 무기 대미지가 +2%만큼 증가합니다. 최대 30번 중첩됩니다.

헤드샷을 적중시키면 모든 중첩을 소모하여 중첩당 3%만큼 방패를 회복합니다.', '[{"num":5,"unit":"%","type":"헤드샷 대미지"},{"num":15,"unit":"%","type":"무기 조작력"},{"num":5,"unit":"%","type":"치명타 확률"},{"num":15,"unit":"%","type":"발사 속도"}]'::jsonb, '목표 전리품 권총 지역/미션에서 일정 확률로 획득. 영웅 난이도 마지막 보스 처치 시 일정 확률로 획득. 주 임무 완료 또는 시즌 이벤트 특급 상자에서 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('0a3fdc33ffe6eff9', '모스키토', 'Mosquito', 'pistol', '모스키토의 노래', '적을 맞히면 중첩이 부여됩니다. 중첩은 플레이어 간에 공유됩니다. 5중첩이 되면 해당 적은 5초 동안 마지막으로 중첩을 부여한 플레이어를 강제로 조준하며, 방어도에 주는 대미지가 25%만큼 증가합니다. 중첩은 5초마다 소멸합니다. 적에게 이 효과가 발동되면 다른 적에게 걸린 모든 중첩이 제거됩니다.', '[{"num":15,"unit":"%","type":"재장전 속도"},{"num":15,"unit":"%","type":"명중률"}]'::jsonb, null);
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('95d5e0f0d30aab66', '레굴루스', 'Regulus', 'pistol', '국왕 시해', '헤드샷 처치 시 5m 규모의 폭발을 일으켜 적중당한 모든 적에게 400%의 무기 대미지를 주고 출혈 상태이상 효과를 부여합니다.', '[{"num":10,"unit":"%","type":"재장전 속도"},{"num":20,"unit":"%","type":"명중률"}]'::jsonb, '철마 작전 공격대에서 드랍하는 재료를 모두 기부하는 프로젝트 완료 후 제작 설계도 획득.');
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('4abef652942d3657', '템페스트', 'Tempest', 'pistol', '자제심', '방패가 파괴된 후 20초 동안 대미지가 25%만큼 증폭됩니다.', '[{"num":50,"unit":"%","type":"안정성"},{"num":15,"unit":"%","type":"치명타 확률"}]'::jsonb, null);
insert into weapon_exotic (item_key, name_ko, name_en, weapon_group, talent_name_ko, talent_desc_ko, exotic_mods, drop_location_ko) values ('2783dd5e0bd2deb5', '위플래쉬', 'Whiplash', 'pistol', '재장전보다 빠르게', '이 무기를 5초 동안 수납 상태로 유지하면 재장전되며 발사 준비 상태가 됩니다.

준비 완료 상태일 때 이 무기로 교체하면 주 무기와 보조 무기가 재장전되고, 탄창이 소진될 때까지 발사 속도 +20%, 무기 대미지 +50%를 얻습니다.

탄창이 소진되기 전에 재장전하거나 이 무기에서 다른 무기로 교체하면 능력치 보너스가 사라집니다.', '[{"num":10,"unit":"%","type":"치명타 대미지"},{"num":10,"unit":"%","type":"치명타 확률"},{"num":50,"unit":"%","type":"교체 속도"}]'::jsonb, null);
