create table gear_talents (
  talent_key text primary key,
  talent_slot text,
  name_ko text not null,
  name_en text not null,
  desc_ko text not null,
  desc_en text not null,
  perfect_name_ko text,
  perfect_desc_ko text
);

create table gear_named (
  item_key text primary key,
  name_ko text not null,
  name_en text not null,
  item_type text not null,
  brandset text,
  core_attribute_ko text,
  talent_name_ko text,
  talent_desc_ko text,
  attrs jsonb
);

create table gear_exotic (
  item_key text primary key,
  name_ko text not null,
  name_en text not null,
  item_type text not null,
  talent_name_ko text,
  talent_desc_ko text,
  attr_types_ko text[]
);

alter table gear_talents enable row level security;
alter table gear_named enable row level security;
alter table gear_exotic enable row level security;
create policy "public read" on gear_talents for select using (true);
create policy "public read" on gear_named for select using (true);
create policy "public read" on gear_exotic for select using (true);

-- ===== seed: gear_talents =====
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('tagteam', 'chest', '태그 팀', 'Tag Team', '스킬로 대미지를 준 마지막 적에게 표식이 남습니다.

그 적에게 무기 대미지를 주면 표식이 소모되며 사용 중인 스킬의 재사용 대기시간이 6초 줄어듭니다.

재사용 대기시간: 4초', 'The last enemy you have damaged with a skill is marked.

Dealing weapon damage to that enemy consumes the mark to reduce active cooldowns by 6s.

Cooldown: 4s', '완벽한 태그 팀', '스킬로 대미지를 준 마지막 적에게 표식이 남습니다.

그 적에게 무기 대미지를 주면 표식이 소모되며 사용 중인 스킬의 재사용 대기시간이 12초 줄어듭니다.

재사용 대기시간: 4초');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('skilled', 'chest', '숙련', 'Skilled', '스킬로 처치하면 25% 확률로 스킬 재사용 대기시간이 초기화됩니다.', 'Skill kills have a 25% chance to reset skill cooldowns.', '완벽한 숙련', '스킬로 처치하면 30% 확률로 스킬 재사용 대기시간이 초기화됩니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('kineticmomentum', 'chest', '운동량', 'Kinetic Momentum', '전투 중에는 사용했거나 재사용 대기 중이 아닌 각 스킬마다 중첩이 쌓입니다.

중첩당 종합 스킬 대미지 +1.5%, 종합 스킬 회복 +2%. 스킬당 최대 15중첩. 재사용 대기 중에는 사라집니다.', 'When in combat, each skill generates a stack while active or not on cooldown.

Stacks increase your total skill damage by 1.5% and total skill repair by 2%. Up to 15 stacks per skill. Lost when on cooldown.', '완벽한 운동량', '전투 중에는 사용했거나 재사용 대기 중이 아닌 각 스킬마다 중첩이 쌓입니다.

중첩당 종합 스킬 대미지 +1.5%, 종합 스킬 회복 +2%. 스킬당 최대 18중첩. 재사용 대기 중에는 사라집니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('spotter', 'chest', '관측병', 'Spotter', '펄스에 탐지된 적에게 주는 종합 무기·스킬 대미지가 15% 증폭됩니다.', 'Amplifies total weapon and skill damage by 15% to pulsed enemies.', '완벽한 관측병', '펄스에 탐지된 적에게 주는 종합 무기·스킬 대미지가 20% 증폭됩니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('explosivedelivery', 'chest', '폭발 배송', 'Explosive Delivery', '스킬을 던지면 착지 1.5초 후 폭발이 일어나 반경 5m 안의 적에게 대미지를 줍니다.

대미지는 스킬 등급에 따라 컨커션 수류탄 대미지의 25~100%로 적용됩니다.

스킬당 최대 1회 발동합니다.', 'Whenever you throw a skill, 1.5 seconds after landing, it creates an explosion damaging enemies within 5m.

Damage scales with skill tier dealing 25-100% damage of a concussion grenade.

At most once per skill.', '완벽한 폭발 배송', '스킬을 던지면 착지 1.5초 후 폭발이 일어나 반경 5m 안의 적에게 대미지를 줍니다.
이후 5초마다 폭발이 발생합니다.

대미지는 스킬 등급에 따라 컨커션 수류탄 대미지의 25~100%로 적용됩니다.

스킬당 1회 발동합니다.

리모트 펄스, 모든 터렛, 모든 하이브, 폭발 시커, 클러스터 시커, 멘더 시커, 디코이, 모든 트랩에 적용됩니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('empathicresolve', 'chest', '공감의 의지', 'Empathic Resolve', '아군을 회복시키면 20초간 그 아군의 종합 무기·스킬 대미지가 3~15% 증가합니다(자신은 1~7%).

효과는 스킬 등급에 따라 증가합니다.', 'Repairing an ally increases their total weapon and skill damage by 3-15% for 20s. 1-7% if self.

Effectiveness increased by your skill tier.', '완벽한 공감의 의지', '아군을 회복시키면 20초간 그 아군의 종합 무기·스킬 대미지가 3~20% 증가합니다(자신은 1~15%).

효과는 스킬 등급에 따라 증가합니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('overwatch', 'chest', '경계 태세', 'Overwatch', '10초간 엄폐한 뒤에는 엄폐 상태나 엄폐 간 이동을 유지하는 동안 자신과 아군의 종합 무기·스킬 대미지가 12% 증가합니다.', 'After staying in cover for 10s, increases you and your allies'' total weapon and skill damage by 12% as long as you remain in cover or in a cover-to-cover move.', '완벽한 경계 태세', '8초간 엄폐한 뒤에는 엄폐 상태나 엄폐 간 이동을 유지하는 동안 자신과 아군의 종합 무기·스킬 대미지가 14% 증가합니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('intimidate', 'chest', '위협 전술', 'Intimidate', '보너스 방어도가 있는 동안 매초 중첩 3개를 얻습니다(최대 9). 중첩 하나당 10m 안의 적에게 주는 무기 대미지 +4%.

보너스 방어도가 없어지면 모든 중첩이 사라집니다.', 'While you have bonus armor, gain 3 stack each second up to a max of 9.
Each stack increases weapon damage by 4% to enemies within 10m.

All stacks are lost when you have no bonus armor.', '완벽한 위협 전술', '보너스 방어도가 있는 동안 매초 중첩 3개를 얻습니다(최대 10). 중첩 하나당 10m 안의 적에게 주는 무기 대미지 +4%.

보너스 방어도가 없어지면 모든 중첩이 사라집니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('unbreakable', 'chest', '파괴 불가', 'Unbreakable', '방어도가 소진되면 방어도를 95% 회복합니다.

재사용 대기시간: 60초', 'When your armor is depleted, repair 95% of your armor.

Cooldown: 60s', '완벽한 파괴 불가', '방어도가 소진되면 방어도를 100% 회복합니다.

재사용 대기시간: 55초');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('vanguard', 'chest', '선봉장', 'Vanguard', '방패를 배치하면 5초간 무적 상태가 되고, 20초간 다른 모든 아군에게 자신의 방어도의 45%에 해당하는 보너스 방어도를 부여합니다.

재사용 대기시간: 25초', 'Deploying a shield makes it invulnerable for 5s and grants 45% of your armor as bonus armor to all other allies for 20s.

Cooldown: 25s', '완벽한 선봉장', '방패를 배치하면 5초간 무적 상태가 되고, 20초간 다른 모든 아군에게 자신의 방어도의 50%에 해당하는 보너스 방어도를 부여합니다.

재사용 대기시간: 25초');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('protectedreload', 'chest', '보호 재장전', 'Protected Reload', '재장전하는 동안 보너스 방어도 +20%를 얻습니다.

청색 핵심 속성에 따라, 다른 모든 아군이 재장전할 때 자신의 방어도의 0~18%에 해당하는 보너스 방어도를 부여합니다.', 'Grants +20% bonus armor while reloading.

Grants 0-18% of your armor as bonus armor to all other allies when they are reloading, based on your blue core attribute.', '완벽한 보호 재장전', '재장전하는 동안 보너스 방어도 +40%를 얻습니다.

청색 핵심 속성에 따라, 다른 모든 아군이 재장전할 때 자신의 방어도의 0~30%에 해당하는 보너스 방어도를 부여합니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('glasscannon', 'chest', '유리 대포', 'Glass Cannon', '주는 모든 대미지가 25% 증폭되고, 받는 모든 대미지가 50% 증폭됩니다.', 'All damage you deal is amplified by 25%. All damage you take is amplified by 50%.', '완벽한 유리 대포', '주는 모든 대미지가 30% 증폭되고, 받는 모든 대미지가 60% 증폭됩니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('gunslinger', 'chest', '건슬링어', 'Gunslinger', '무기를 교체하면 5초간 종합 무기 대미지가 23% 증가합니다. 이 버프가 켜져 있는 동안 무기를 교체하면 5초간 효과가 사라집니다.', 'Weapon swapping increases total weapon damage by 23% for 5s. This buff is lost for 5s if you weapon swap while it is active.', '완벽한 건슬링어', '무기를 교체하면 5초간 종합 무기 대미지가 28% 증가합니다.
이 버프가 켜져 있는 동안 무기를 교체하면 5초간 효과가 사라집니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('focus', 'chest', '집중', 'Focus', '8배율 이상 조준경으로 조준하는 동안 매초 종합 무기 대미지가 5%씩, 최대 50%까지 증가합니다.

필요 조건
8배율 이상의 조준경 필요', 'Increases total weapon damage by 5% every second you are aiming while scoped 8x or higher, up to 50%.

REQUIRES
Requires a Scope with 8x magnification or higher', '완벽한 집중', '8배율 이상 조준경으로 조준하는 동안 매초 종합 무기 대미지가 6%씩, 최대 60%까지 증가합니다.

필요 조건
8배율 이상의 조준경 필요');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('braced', 'chest', '지지대', 'Braced', '엄폐 중에는 무기 조작력이 +45% 증가합니다.', 'While in cover weapon handling is increased by +45%.', '완벽한 지지대', '엄폐 중에는 무기 조작력이 +50% 증가합니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('spark', 'chest', '불꽃', 'Spark', '스킬로 적에게 대미지를 주면 15초간 종합 무기 대미지가 15% 증가합니다.', 'Damaging enemies with a skill increases total weapon damage by 15% for 15s.', '완벽한 불꽃', '스킬로 적에게 대미지를 주면 20초간 종합 무기 대미지가 18% 증가합니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('obliterate', 'chest', '섬멸', 'Obliterate', '치명타를 맞히면 10초간 종합 무기 대미지가 1% 증가합니다. 최대 20중첩.', 'Critical hits increase total weapon damage by 1% for 10s. Stacks up to 20 times.', '완벽한 섬멸', '치명타를 맞히면 10초간 종합 무기 대미지가 1% 증가합니다. 최대 24중첩.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('trauma', 'chest', '트라우마', 'Trauma', '머리에 맞은 적에게 실명을 겁니다. 재사용 대기시간: 30초

가슴에 맞은 적에게 출혈을 겁니다. 재사용 대기시간: 30초', 'Applies blind to an enemy hit in the head. Cooldown: 30s

Applies bleed to an enemy hit in the chest. Cooldown: 30s', '완벽한 트라우마', '머리에 맞은 적에게 실명을 겁니다. 재사용 대기시간: 20초

가슴에 맞은 적에게 출혈을 겁니다. 재사용 대기시간: 20초');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('reassigned', 'chest', '재배치', 'Reassigned', '적을 처치하면 권총에 무작위 특수 탄약 1발이 지급됩니다.

재사용 대기시간: 15초', 'Killing an enemy adds 1 round of a random special ammo into your sidearm.

Cooldown: 15s', '완벽한 재배치', '적을 처치하면 권총에 무작위 특수 탄약 1발이 지급됩니다.

재사용 대기시간: 8초');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('madbomber', 'chest', '폭탄광', 'Mad Bomber', '수류탄 범위가 +50% 증가합니다.

적을 처치한 수류탄은 반환됩니다.

발사 버튼을 누르고 있으면 수류탄을 미리 ''예열''해 더 빨리 터뜨릴 수 있습니다.

수류탄을 조준하는 동안 보너스 방어도 +15%를 얻습니다.', 'Grenade radius is increased by +50%.

Grenades that kill an enemy are refunded.

Grenades can now be "cooked" by holding the fire button, making them explode earlier.

Gain +15% bonus armor while aiming grenades.', '완벽한 폭탄광', '수류탄 범위가 +75% 증가합니다.

적을 처치한 수류탄은 반환됩니다.

발사 버튼을 누르고 있으면 수류탄을 미리 ''예열''해 더 빨리 터뜨릴 수 있습니다.

수류탄을 조준하는 동안 보너스 방어도 +15%를 얻습니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('tamperproof', 'chest', '방해 방지', 'Tamper Proof', '하이브·터렛·리모트 펄스로부터 3m 안에 들어온 적에게 쇼크를 겁니다.

무장 시간: 2초, 스킬당 재사용 대기시간: 10초', 'Enemies that walk within 3m of your hive, turret, or remote pulse are shocked.

Arm time: 2s Cooldown per skill: 10s', '완벽한 방해 방지', '하이브·터렛·리모트 펄스·디코이로부터 3m 안에 들어온 적에게 쇼크를 겁니다.

무장 시간: 2초, 스킬당 재사용 대기시간: 8초');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('efficient', 'chest', '효율적', 'Efficient', '방어구 키트를 사용해도 50% 확률로 방어구 키트가 소모되지 않습니다.

전문화 방어구 키트 보너스가 100% 증가합니다.

탤런트 발동 준비에 10초가 필요합니다.', 'Using an armor kit has a 50% chance to not consume the armor kit.

Specialization armor kit bonuses are increased by 100%

Requires 10 seconds to arm talent', '완벽한 효율적', '방어구 키트를 사용해도 75% 확률로 방어구 키트가 소모되지 않습니다.

전문화 방어구 키트 보너스가 100% 증가합니다.

탤런트 발동 준비에 10초가 필요합니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('headhunter', 'chest', '헤드헌터', 'Headhunter', '헤드샷으로 적을 처치하면, 30초 안의 다음 무기 공격이 그 처치 대미지의 125%만큼 추가 대미지를 줍니다.

대미지는 무기 대미지의 800%가 한도이며, 헤드샷 대미지가 150%를 넘으면 한도가 1250%로 늘어납니다.', 'After killing an enemy with a headshot, your next weapon hit within 30s deals an additional 125% of that killing blow''s damage.

Damage is capped to 800% of your weapon damage.
This is raised to 1250% if your headshot damage is greater than 150%.', '완벽한 헤드헌터', '헤드샷으로 적을 처치하면, 30초 안의 다음 무기 공격이 그 처치 대미지의 150%만큼 추가 대미지를 줍니다.

대미지는 무기 대미지의 800%가 한도이며, 헤드샷 대미지가 150%를 넘으면 한도가 1250%로 늘어납니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('entrench', 'chest', '참호전', 'Entrench', '방어도가 30% 미만일 때 엄폐 상태에서 헤드샷을 맞히면 방어도가 20% 회복됩니다.

재사용 대기시간: 2초', 'If you are below 30% armor, headshots from cover repair 20% of your armor.

Cooldown: 2s', '완벽한 참호전', '방어도가 30% 미만일 때 엄폐 상태에서 헤드샷을 맞히면 방어도가 30% 회복됩니다.

재사용 대기시간: 1초');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('combinedarms', 'backpack', '합동 화력', 'Combined Arms', '적을 사격하면 3초간 종합 스킬 대미지가 25% 증가합니다.', 'Shooting an enemy increases total skill damage by 25% for 3s.', '완벽한 합동 화력', '적을 사격하면 3초간 종합 스킬 대미지가 30% 증가합니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('energize', 'backpack', '활성화', 'Energize', '방어구 키트를 사용하면 15초간 스킬 등급 +1을 얻습니다. 이미 스킬 등급 6이면 과충전을 얻습니다.

재사용 대기시간: 60초', 'Using an armor kit grants +1 skill tier for 15s. If already at skill tier 6, grants overcharge.

Cooldown: 60s', '완벽한 활성화', '방어구 키트를 사용하면 15초간 스킬 등급 +1을 얻습니다. 이미 스킬 등급 6이면 과충전을 얻습니다.

재사용 대기시간: 30초');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('techsupport', 'backpack', '기술 지원', 'Tech Support', '스킬로 처치하면 20초간 종합 스킬 대미지가 25% 증가합니다.', 'Skill kills increase total skill damage by 25% for 20s', '완벽한 기술 지원', '스킬로 처치하면 27초간 종합 스킬 대미지가 25% 증가합니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('calculated', 'backpack', '치밀한 계산', 'Calculated', '엄폐 상태에서 처치하면 스킬 재사용 대기시간이 10% 줄어듭니다.', 'Kills from cover reduce skill cooldowns by 10%.', '완벽한 치밀한 계산', '엄폐 상태에서 처치하면 스킬 재사용 대기시간이 15% 줄어듭니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('shockandawe', 'backpack', '충격과 공포', 'Shock and Awe', '적에게 상태이상 효과를 걸면 20초간 종합 스킬 대미지·회복이 20% 증가합니다.', 'Applying a status effect to an enemy increases total skill damage and repair by 20% for 20s.', '완벽한 충격과 공포', '적에게 상태이상 효과를 걸면 27초간 종합 스킬 대미지·회복이 20% 증가합니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('safeguard', 'backpack', '보호 장치', 'Safeguard', '방어도가 가득 찬 상태에서는 종합 스킬 회복이 130% 증가합니다.', 'While at full armor, increases total skill repair by 130%.', '완벽한 보호 장치', '방어도가 가득 찬 상태에서는 종합 스킬 회복이 160% 증가합니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('overclock', 'backpack', '오버클럭', 'Overclock', '배치한 스킬로부터 7m 안의 아군은 재장전 속도 +25%를 얻고, 매초 활성 재사용 대기시간이 0.2초씩 줄어듭니다.', 'Allies within 7m of your deployed skills, gain +25% reload speed and reduces their active cooldowns by 0.2s each second.', '완벽한 오버클럭', '배치한 스킬로부터 15m 안의 아군은 재장전 속도 +30%를 얻고, 매초 활성 재사용 대기시간이 0.6초씩 줄어듭니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('bloodsucker', 'backpack', '흡혈귀', 'Bloodsucker', '적을 처치하면 10초간 보너스 방어도 +10%가 중첩됩니다. 최대 10중첩.', 'Killing an enemy adds a stack of +10% bonus armor for 10s. Max stack is 10.', '완벽한 흡혈귀', '적을 처치하면 10초간 보너스 방어도 +12%가 중첩됩니다. 최대 10중첩.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('leadership', 'backpack', '리더십', 'Leadership', '엄폐 간 이동을 하면 10초간 자신과 모든 아군에게 자신의 방어도의 15%에 해당하는 보너스 방어도를 부여합니다.

적으로부터 10m 안에서 끝나면 효과가 2배가 됩니다.

재사용 대기시간: 10초', 'Performing a cover to cover grants 15% of your armor as bonus armor to you and all allies for 10s.

This is doubled if you end within 10m of an enemy.

Cooldown: 10s', '완벽한 리더십', '엄폐 간 이동을 하면 10초간 자신과 모든 아군에게 자신의 방어도의 20%에 해당하는 보너스 방어도를 부여합니다.

적으로부터 10m 안에서 끝나면 효과가 3배가 됩니다.

재사용 대기시간: 10초');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('vigilance', 'backpack', '경각심', 'Vigilance', '종합 무기 대미지가 25% 증가합니다. 대미지를 받으면 4초간 이 버프가 비활성화됩니다.', 'Increases total weapon damage by 25%. Taking damage disables this buff for 4s.', '완벽한 경각심', '종합 무기 대미지가 25% 증가합니다. 대미지를 받으면 3초간 이 버프가 비활성화됩니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('versatile', 'backpack', '다재다능', 'Versatile', '주무기와 보조무기가 서로 다른 종류일 때 무기를 교체하면 10초간 종합 무기 대미지가 증폭됩니다.

산탄총·기관단총은 15m 안의 적에게 35%.

소총·지정사수소총은 25m 밖의 적에게 35%.

경기관총·돌격소총은 15~25m 사이의 적에게 10%.

무기 종류당 최대 5초에 1회.', 'Amplifies total weapon damage for 10s when swapping between your primary and secondary weapons if they are different.

35% to enemies within 15m for Shotguns and SMGs.

35% to enemies further than 25m for Rifles and Marksman Rifles.

10% to enemies between 15-25m for LMGs and Assault Rifles.

At most once per 5s per weapon type.', '완벽한 다재다능', '주무기와 보조무기가 서로 다른 종류일 때 무기를 교체하면 10초간 종합 무기 대미지가 증폭됩니다.

산탄총·기관단총은 15m 안의 적에게 45%.

소총·지정사수소총은 25m 밖의 적에게 40%.

경기관총·돌격소총은 15~25m 사이의 적에게 15%.

무기 종류당 최대 5초에 1회.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('opportunistic', 'backpack', '기회주의', 'Opportunistic', '산탄총·지정사수소총으로 적을 맞히면 5초간 그 적이 모든 공격원으로부터 받는 대미지가 10% 증폭됩니다.

필요 조건
지정사수소총 또는 산탄총 장착 필요', 'Enemies you hit with shotguns and marksman rifles amplifies the damage they take by 10% from all sources for 5s.

REQUIRES
Requires a Marksman Rifle or Shotgun Drawn', '완벽한 기회주의', '맞힌 적은 5초간 모든 공격원으로부터 받는 대미지가 15% 늘어납니다.

필요 조건
지정사수소총 또는 산탄총만 사용');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('unstoppableforce', 'backpack', '불가항력', 'Unstoppable Force', '적을 처치하면 15초간 종합 무기 대미지가 5% 증가합니다. 최대 5중첩.', 'Killing an enemy increases total weapon damage by 5% for 15s. Stacks up to 5 times.', '완벽한 불가항력', '적을 처치하면 15초간 종합 무기 대미지가 7% 증가합니다. 최대 5중첩.
수류탄으로 처치하면 중첩 2개가 추가됩니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('companion', 'backpack', '동반자', 'Companion', '아군이나 스킬로부터 5m 안에 있으면 종합 무기 대미지가 15% 증가합니다.', 'While you are within 5m of an ally or skill, total weapon damage is increased by 15%.', '완벽한 동반자', '아군이나 스킬로부터 10m 안에 있으면 종합 무기 대미지가 20% 증가합니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('composure', 'backpack', '평정심', 'Composure', '엄폐 중에는 종합 무기 대미지가 15% 증가합니다.', 'While in cover, increases total weapon damage by 15%', '완벽한 평정심', '엄폐 중에는 종합 무기 대미지가 20% 증가합니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('concussion', 'backpack', '뇌진탕', 'Concussion', '헤드샷을 맞히면 1.5초간(지정사수소총은 5초간) 종합 무기 대미지가 10% 증가합니다.

헤드샷으로 처치하면 10초간 종합 무기 대미지가 15% 증가합니다.', 'Headshots increase total weapon damage by 10% for 1.5s. 5s with marksman rifles

Headshot kills increase total weapon damage by 15% for 10s.', '완벽한 뇌진탕', '헤드샷을 맞히면 1.5초간(지정사수소총은 5초간) 종합 무기 대미지가 20% 증가합니다.

헤드샷으로 처치하면 10초간 종합 무기 대미지가 15% 증가합니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('creepingdeath', 'backpack', '죽음의 확산', 'Creeping Death', '상태이상 효과를 걸면 대상으로부터 8m 안의 모든 적에게도 함께 걸립니다.

재사용 대기시간: 15초', 'When you apply a status effect, it is also applied to all enemies within 8m of your target.

Cooldown: 15s', '완벽한 죽음의 확산', '상태이상 효과를 걸면 대상으로부터 10m 안의 모든 적에게도 함께 걸립니다.

재사용 대기시간: 10초');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('wicked', 'backpack', '사악함', 'Wicked', '상태이상 효과를 걸면 20초간 종합 무기 대미지가 18% 증가합니다.', 'Applying a status effect increases total weapon damage by 18% for 20s.', '완벽한 사악함', '상태이상 효과를 걸면 27초간 종합 무기 대미지가 18% 증가합니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('galvanize', 'backpack', '활력 부여', 'Galvanize', '적에게 실명·속박·혼란·쇼크를 걸면 10초간 그 적으로부터 20m 안의 아군에게 자신의 방어도의 40%에 해당하는 보너스 방어도를 부여합니다.', 'Applying a blind, ensnare, confuse, or shock to an enemy grants 40% of your armor as bonus armor to allies within 20m of that enemy for 10s.', '완벽한 활력 부여', '적에게 실명·속박·혼란·쇼크를 걸면 10초간 그 적으로부터 30m 안의 자신과 모든 아군에게 자신의 방어도의 50%에 해당하는 보너스 방어도를 부여합니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('clutch', 'backpack', '클러치', 'Clutch', '방어도가 15% 미만일 때 치명타를 맞히면 잃은 방어도의 2.5%가 회복됩니다.

처치하면 적색 핵심 속성 개수에 따라 4~10초 동안 방어도를 최대 100%까지 회복할 수 있습니다.', 'If you are below 15% armor, critical hits repair 2.5% missing armor.

Kills allow you to repair up to 100% armor for 4-10s, based on your number of red core attributes.', '완벽한 클러치', '방어도가 20% 미만일 때 치명타를 맞히면 잃은 방어도의 2.5%가 회복됩니다.

처치하면 적색 핵심 속성 개수에 따라 4~10초 동안 방어도를 최대 100%까지 회복할 수 있습니다.');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('adrenalinerush', 'backpack', '아드레날린 분출', 'Adrenaline Rush', '적으로부터 10m 안에 있을 때마다 5초간 보너스 방어도 20%를 얻습니다. 최대 3중첩.

재사용 대기시간: 5초', 'Whenever you are within 10m of an enemy, gain 20% bonus armor for 5s. Stacks up to 3 times.

Cooldown: 5s', '완벽한 아드레날린 분출', '적으로부터 10m 안에 있을 때마다 5초간 보너스 방어도 23%를 얻습니다. 최대 3중첩.

재사용 대기시간: 5초');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('protector', 'backpack', '수호자', 'Protector', '방패가 대미지를 받으면 자신은 보너스 방어도 +5%를 얻고, 다른 모든 아군은 3초간 자신의 방어도의 15%에 해당하는 보너스 방어도를 얻습니다.', 'When your shield is damaged, you gain +5% bonus armor and all other allies gain 15% of your armor as bonus armor for 3s.', '완벽한 수호자', '방패가 대미지를 받으면 자신은 보너스 방어도 +25%를 얻고, 다른 모든 아군은 3초간 자신의 방어도의 35%에 해당하는 보너스 방어도를 얻습니다.

재사용 대기시간: 3초');
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('bewildered', 'kneepads', '당혹', 'Bewildered', '적에게 무기 대미지를 줄 때, 그 대미지의 50%가 30m 안의 다른 적에게 대신 들어갑니다. 근처에 적이 없으면 평소대로 대미지를 줍니다.
방어구 플레이트에는 적용되지 않습니다.', 'When dealing Weapon Damage to an enemy. 50% of the damage will be dealt to another enemy within 30m instead. When there are no enemies nearby, deal damage normally.
Does not apply to Armor Plates.', null, null);
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('fireworksshow', 'backpack', '불꽃놀이', 'Fireworks Show', '컨커션 수류탄이 축제 수류탄으로 바뀝니다.

축제 수류탄이 적에게 맞으면 20m 안의 다른 적 두 명 주위에서도 폭발이 일어납니다.', 'Concussion Grenades become Festive Grenades.

Hitting an enemy with a Festive Grenade will cause explosions to happen around two other enemies within 20m.', null, null);
insert into gear_talents (talent_key, talent_slot, name_ko, name_en, desc_ko, desc_en, perfect_name_ko, perfect_desc_ko) values ('flurry', 'kneepads', '눈보라', 'Flurry', '자신이 거는 모든 상태이상 효과가 대상에게 강설 효과도 함께 겁니다.', 'Every Status Effect you apply will also apply snowfall to the target.', null, null);

-- ===== seed: gear_named =====
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('cf0d59702064b327', '키퍼', 'Keeper', 'backpack', '5.11 Tactical', '방어도', '완벽한 수호자', '방패가 대미지를 받으면 자신은 보너스 방어도 +25%를 얻고, 다른 모든 아군은 3초간 자신의 방어도의 35%에 해당하는 보너스 방어도를 얻습니다.

재사용 대기시간: 3초', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('63e0b6e6e8fc8970', '데스그립스', 'Deathgrips', 'gloves', '5.11 Tactical', '방어도', null, null, '[{"num": 10.0, "unit": "%", "type": "적 처치 시 방어도"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('7c8fb5b88caf93aa', '멜론 볼러', 'Melon Baller', 'backpack', 'Airaldi Holdings', '무기 대미지', '완벽한 뇌진탕', '헤드샷을 맞히면 1.5초간(지정사수소총은 5초간) 종합 무기 대미지가 20% 증가합니다.

헤드샷으로 처치하면 10초간 종합 무기 대미지가 15% 증가합니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('f5cac45412716c7a', '훌륭한 귀감', 'Pristine Example', 'chest', 'Airaldi Holdings', '무기 대미지', '완벽한 집중', '8배율 이상 조준경으로 조준하는 동안 매초 종합 무기 대미지가 6%씩, 최대 60%까지 증가합니다.

필요 조건
8배율 이상의 조준경 필요', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('95dc7aac00eacaff', '타격식 정비', 'Percussive Maintenance', 'backpack', 'Alps Summit Armaments', '스킬 등급', '완벽한 기술 지원', '스킬로 처치하면 27초간 종합 스킬 대미지가 25% 증가합니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('6116b2c518819d47', '모성애', 'Motherly Love', 'gloves', 'Alps Summit Armaments', '스킬 등급', null, null, '[{"num": 25.0, "unit": "%", "type": "스킬 생명력"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('8bcdf42c256c0634', '무관심의 극치', 'Zero F’s', 'chest', 'Badger Tuff', '방어도', '완벽한 파괴 불가', '방어도가 소진되면 방어도를 100% 회복합니다.

재사용 대기시간: 55초', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('b58e9678ccfffee2', '탄약고', 'Ammo Dump', 'holster', 'Badger Tuff', '방어도', null, null, '[{"num": 10.0, "unit": "%", "type": "탄약 휴대량"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('876226a1927477e0', '액체 기술자', 'Liquid Engineer', 'backpack', 'Belstone Armory', '방어도', '완벽한 흡혈귀', '적을 처치하면 10초간 보너스 방어도 +12%가 중첩됩니다. 최대 10중첩.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('bfcf0237e81224b3', '일상 휴대품', 'Everyday Carrier', 'chest', 'Belstone Armory', '방어도', '완벽한 효율적', '방어구 키트를 사용해도 75% 확률로 방어구 키트가 소모되지 않습니다.

전문화 방어구 키트 보너스가 100% 증가합니다.

탤런트 발동 준비에 10초가 필요합니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('39d6ec4d6fe8e5a4', '에르마노', 'Hermano', 'backpack', 'Brazos de Arcabuz', '방어도', '완벽한 오버클럭', '배치한 스킬로부터 15m 안의 아군은 재장전 속도 +30%를 얻고, 매초 활성 재사용 대기시간이 0.6초씩 줄어듭니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('9def00487fda32bd', '피카로스 권총집', 'Picaros Holster', 'holster', 'Brazos de Arcabuz', '방어도', null, null, '[{"num": 10.0, "unit": "%", "type": "무기 대미지"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('875eedced86898de', '전략적 제휴', 'Strategic Alignment', 'backpack', 'China Light Industries Corporation', '스킬 등급', '완벽한 충격과 공포', '적에게 상태이상 효과를 걸면 27초간 종합 스킬 대미지·회복이 20% 증가합니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('34b24e18c3af2794', '펀치드렁크', 'Punch Drunk', 'mask', 'Douglas & Harding', '무기 대미지', null, null, '[{"num": 20.0, "unit": "%", "type": "헤드샷 대미지"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('76d0a2ca005edf53', '엄마 오소리', 'Momma Badger', 'backpack', 'Edelweiss GPz', '스킬 등급', '완벽한 보호 장치', '방어도가 가득 찬 상태에서는 종합 스킬 회복이 160% 증가합니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('4b0a696822cc81e7', '후원자', 'Benefactor', 'chest', 'Edelweiss GPz', '스킬 등급', '완벽한 공감의 의지', '아군을 회복시키면 20초간 그 아군의 종합 무기·스킬 대미지가 3~20% 증가합니다(자신은 1~15%).

효과는 스킬 등급에 따라 증가합니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('c13153df28da0f87', '라부아지에', 'Lavoisier', 'backpack', 'Electrique', '스킬 등급', '완벽한 활력 부여', '적에게 실명·속박·혼란·쇼크를 걸면 10초간 그 적으로부터 30m 안의 자신과 모든 아군에게 자신의 방어도의 50%에 해당하는 보너스 방어도를 부여합니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('3a280b1963cc2f2a', '앙리', 'Henri', 'chest', 'Electrique', '스킬 등급', '완벽한 동반자', '아군이나 스킬로부터 10m 안에 있으면 종합 무기 대미지가 20% 증가합니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('3eb4caddb61b38e2', '제설기', 'Snow Machine', 'kneepads', 'Electrique', '스킬 등급', '눈보라', '자신이 거는 모든 상태이상 효과가 대상에게 강설 효과도 함께 겁니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('1b4b432360287417', '배터리 팩', 'Battery Pack', 'backpack', 'Empress International', '스킬 등급', '완벽한 치밀한 계산', '엄폐 상태에서 처치하면 스킬 재사용 대기시간이 15% 줄어듭니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('5e7098e9b697f6d5', '카이사르의 근위대', 'Caesar''s Guard', 'chest', 'Empress International', '스킬 등급', '완벽한 숙련', '스킬로 처치하면 30% 확률로 스킬 재사용 대기시간이 초기화됩니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('282da86fd0fa4abe', '흉포한 평정심', 'Ferocious Calm', 'chest', 'Fenris Group AB', '무기 대미지', '완벽한 경계 태세', '8초간 엄폐한 뒤에는 엄폐 상태나 엄폐 간 이동을 유지하는 동안 자신과 아군의 종합 무기·스킬 대미지가 14% 증가합니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('1126b2b8f32f61e1', '선두병', 'Pointman', 'chest', 'Gila Guard', '방어도', '완벽한 선봉장', '방패를 배치하면 5초간 무적 상태가 되고, 20초간 다른 모든 아군에게 자신의 방어도의 50%에 해당하는 보너스 방어도를 부여합니다.

재사용 대기시간: 25초', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('45cc3d469b913b0f', '냉각', 'Chill Out', 'mask', 'Gila Guard', '방어도', null, null, '[{"num": null, "unit": "", "type": "개조 슬롯"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('f365025b09f8a397', '밤의 주시자', 'Nightwatcher', 'mask', 'Gila Guard', '방어도', null, null, '[{"num": 100.0, "unit": "%", "type": "스캐너 펄스 가속"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('8c779a93be934518', '무정부주의자의 요리책', 'Anarchist''s Cookbook', 'backpack', 'Golan Gear Ltd', '방어도', '완벽한 사악함', '상태이상 효과를 걸면 27초간 종합 무기 대미지가 18% 증가합니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('f116f4204b6b53a9', '헌터 킬러', 'Hunter-Killer', 'chest', 'Golan Gear Ltd', '방어도', '완벽한 위협 전술', '보너스 방어도가 있는 동안 매초 중첩 3개를 얻습니다(최대 10). 중첩 하나당 10m 안의 적에게 주는 무기 대미지 +4%.

보너스 방어도가 없어지면 모든 중첩이 사라집니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('78d6625968fc3419', '축제 배송', 'Festive Delivery', 'backpack', 'Grupo Sombra S.A.', '무기 대미지', '불꽃놀이', '컨커션 수류탄이 축제 수류탄으로 바뀝니다.

축제 수류탄이 적에게 맞으면 20m 안의 다른 적 두 명 주위에서도 폭발이 일어납니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('5706d67c9fe46e9a', '돌파병의 노크 소리', 'Door-Kicker’s Knock', 'chest', 'Grupo Sombra S.A.', '무기 대미지', '완벽한 불꽃', '스킬로 적에게 대미지를 주면 20초간 종합 무기 대미지가 18% 증가합니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('58cdede9979d0b1e', '특사', 'The Courier', 'backpack', 'Habsburg Guard', '방어도', '완벽한 죽음의 확산', '상태이상 효과를 걸면 대상으로부터 10m 안의 모든 적에게도 함께 걸립니다.

재사용 대기시간: 10초', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('197adbbbb9e6526d', '소중한 것', 'Cherished', 'chest', 'Habsburg Guard', '방어도', '완벽한 트라우마', '머리에 맞은 적에게 실명을 겁니다. 재사용 대기시간: 20초

가슴에 맞은 적에게 출혈을 겁니다. 재사용 대기시간: 20초', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('d66a8d7eb330cd1b', '전력 승수', 'Force Multiplier', 'backpack', 'Hana-U Corporation', '스킬 등급', '완벽한 합동 화력', '적을 사격하면 3초간 종합 스킬 대미지가 30% 증가합니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('3f87301a05ec0457', '선장', 'Cap''n', 'backpack', 'Imminence Armaments', '무기 대미지', '완벽한 리더십', '엄폐 간 이동을 하면 10초간 자신과 모든 아군에게 자신의 방어도의 20%에 해당하는 보너스 방어도를 부여합니다.

적으로부터 10m 안에서 끝나면 효과가 3배가 됩니다.

재사용 대기시간: 10초', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('f1a079cfcb8012e3', '트릭 샷', 'Trick Shot', 'chest', 'Imminence Armaments', '무기 대미지', '완벽한 재배치', '적을 처치하면 권총에 무작위 특수 탄약 1발이 지급됩니다.

재사용 대기시간: 8초', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('2ca31c92780c3d5b', '클로크', 'Cloak', 'kneepads', 'Imminence Armaments', '무기 대미지', null, null, '[{"num": 50.0, "unit": "%", "type": "위협 감소"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('a032a9403b42a938', '불침번', 'Vigil', 'backpack', 'Legatus S.p.A.', '무기 대미지', '완벽한 다재다능', '주무기와 보조무기가 서로 다른 종류일 때 무기를 교체하면 10초간 종합 무기 대미지가 증폭됩니다.

산탄총·기관단총은 15m 안의 적에게 45%.

소총·지정사수소총은 25m 밖의 적에게 40%.

경기관총·돌격소총은 15~25m 사이의 적에게 15%.

무기 종류당 최대 5초에 1회.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('a41c0770ab0d5211', '선지자', 'Visionario', 'mask', 'Legatus S.p.A.', '무기 대미지', null, null, '[{"num": 50.0, "unit": "%", "type": "적정 사거리"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('6e8307af2fa71a15', '중추', 'Backbone', 'backpack', 'Lengmo', '방어도', '완벽한 불가항력', '적을 처치하면 15초간 종합 무기 대미지가 7% 증가합니다. 최대 5중첩.
수류탄으로 처치하면 중첩 2개가 추가됩니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('08457ee20d0fbaa1', '목수', 'Carpenter', 'chest', 'Lengmo', '방어도', '완벽한 폭탄광', '수류탄 범위가 +75% 증가합니다.

적을 처치한 수류탄은 반환됩니다.

발사 버튼을 누르고 있으면 수류탄을 미리 ''예열''해 더 빨리 터뜨릴 수 있습니다.

수류탄을 조준하는 동안 보너스 방어도 +15%를 얻습니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('7b9c4ab5a54adbac', '황제의 근위대', 'Emperor’s Guard', 'kneepads', 'Murakami Industries', '스킬 등급', null, null, '[{"num": 1.0, "unit": "%", "type": "방어도 재생"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('d7d75b2218098109', '여우의 기도', 'Fox’s Prayer', 'kneepads', 'Overlord Armaments', '무기 대미지', null, null, '[{"num": 8.0, "unit": "%", "type": "엄폐하지 않은 적 대상 대미지"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('a009485c20c6d4b0', '프록시', 'Proxy', 'backpack', 'Palisade Steelworks', '방어도', '완벽한 방해 방지', '하이브·터렛·리모트 펄스·디코이로부터 3m 안에 들어온 적에게 쇼크를 겁니다.

무장 시간: 2초, 스킬당 재사용 대기시간: 8초', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('de872871a1803ada', '연소기', 'Combustor', 'chest', 'Palisade Steelworks', '방어도', '완벽한 폭발 배송', '스킬을 던지면 착지 1.5초 후 폭발이 일어나 반경 5m 안의 적에게 대미지를 줍니다.
이후 5초마다 폭발이 발생합니다.

대미지는 스킬 등급에 따라 컨커션 수류탄 대미지의 25~100%로 적용됩니다.

스킬당 1회 발동합니다.

리모트 펄스, 모든 터렛, 모든 하이브, 폭발 시커, 클러스터 시커, 멘더 시커, 디코이, 모든 트랩에 적용됩니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('34066cfc26298ed2', '베드메디츠야 조끼', 'Vedmedytsya Vest', 'chest', 'Petrov Defense Group', '무기 대미지', '완벽한 지지대', '엄폐 중에는 무기 조작력이 +50% 증가합니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('aca56bb06cf5665b', '계약자의 장갑', 'Contractor’s Gloves', 'gloves', 'Petrov Defense Group', '무기 대미지', null, null, '[{"num": 8.0, "unit": "%", "type": "방어도 대상 대미지"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('8f243457f6c18de7', '선물', 'The Gift', 'backpack', 'Providence Defense', '무기 대미지', '완벽한 경각심', '종합 무기 대미지가 25% 증가합니다. 대미지를 받으면 3초간 이 버프가 비활성화됩니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('d2221cf09b42a179', '희생양', 'The Sacrifice', 'chest', 'Providence Defense', '무기 대미지', '완벽한 유리 대포', '주는 모든 대미지가 30% 증폭되고, 받는 모든 대미지가 60% 증폭됩니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('620bfa21d6536109', '대장간', 'Forge', 'holster', 'Richter & Kaiser GmbH', '스킬 등급', null, null, '[{"num": 50.0, "unit": "%", "type": "방패 생명력"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('f684027745ce4439', '총공세', 'Rushdown', 'chest', 'Richter & Kaiser GmbH', '스킬 등급', '완벽한 태그 팀', '스킬로 대미지를 준 마지막 적에게 표식이 남습니다.

그 적에게 무기 대미지를 주면 표식이 소모되며 사용 중인 스킬의 재사용 대기시간이 12초 줄어듭니다.

재사용 대기시간: 4초', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('c3dbff5484376336', '불독', 'Bulldog', 'backpack', 'Royal Works', '무기 대미지', '완벽한 평정심', '엄폐 중에는 종합 무기 대미지가 20% 증가합니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('a88733058ab61d9b', '로빈', 'Robin', 'chest', 'Royal Works', '무기 대미지', '완벽한 건슬링어', '무기를 교체하면 5초간 종합 무기 대미지가 28% 증가합니다.
이 버프가 켜져 있는 동안 무기를 교체하면 5초간 효과가 사라집니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('7917093a8739047e', '악셀', 'Axel', 'backpack', 'Shiny Monkey Gear', '스킬 등급', '완벽한 활성화', '방어구 키트를 사용하면 15초간 스킬 등급 +1을 얻습니다. 이미 스킬 등급 6이면 과충전을 얻습니다.

재사용 대기시간: 30초', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('6ac272fde3af410a', '그리스', 'Grease', 'kneepads', 'Shiny Monkey Gear', '스킬 등급', null, null, '[{"num": 16.0, "unit": "%", "type": "상태이상 효과"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('4acbfd99d9e2cb95', '확고한 악수', 'Firm Handshake', 'gloves', 'Sokolov Concern', '무기 대미지', null, null, '[{"num": 16.0, "unit": "%", "type": "상태이상 효과"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('4f9059a8cc99468b', '이퀄라이저', 'Equalizer', 'chest', 'Unit Alloys', '무기 대미지', '완벽한 섬멸', '치명타를 맞히면 10초간 종합 무기 대미지가 1% 증가합니다. 최대 24중첩.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('faad15e3e7c8564a', '일제 사격', 'Salvo', 'holster', 'Unit Alloys', '무기 대미지', null, null, '[{"num": 5.0, "unit": "%", "type": "발사 속도"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('21b71848ed6495f8', '손재주', 'Sleight', 'chest', 'Urban Lookout', '무기 대미지', '완벽한 보호 재장전', '재장전하는 동안 보너스 방어도 +40%를 얻습니다.

청색 핵심 속성에 따라, 다른 모든 아군이 재장전할 때 자신의 방어도의 0~30%에 해당하는 보너스 방어도를 부여합니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('0c3409d2c1cf575d', '정확무비', 'Spot-On', 'holster', 'Urban Lookout', '무기 대미지', null, null, '[{"num": 38.0, "unit": "%", "type": "명중률"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('7984e148a459949c', '설계', 'The Setup', 'backpack', 'Uzina Getica', '방어도', '완벽한 기회주의', '맞힌 적은 5초간 모든 공격원으로부터 받는 대미지가 15% 늘어납니다.

필요 조건
지정사수소총 또는 산탄총만 사용', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('947e8fe07bb3b4c9', '클로저', 'Closer', 'chest', 'Uzina Getica', '방어도', '완벽한 관측병', '펄스에 탐지된 적에게 주는 종합 무기·스킬 대미지가 20% 증폭됩니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('22f7a09fa2238b1b', '마타도르', 'Matador', 'backpack', 'Walker, Harris & Co.', '무기 대미지', '완벽한 아드레날린 분출', '적으로부터 10m 안에 있을 때마다 5초간 보너스 방어도 23%를 얻습니다. 최대 3중첩.

재사용 대기시간: 5초', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('aa8de5d4758faf5b', '연쇄 학살자', 'Chainkiller', 'chest', 'Walker, Harris & Co.', '무기 대미지', '완벽한 헤드헌터', '헤드샷으로 적을 처치하면, 30초 안의 다음 무기 공격이 그 처치 대미지의 150%만큼 추가 대미지를 줍니다.

대미지는 무기 대미지의 800%가 한도이며, 헤드샷 대미지가 150%를 넘으면 한도가 1250%로 늘어납니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('16451ff33461ae63', '추진력', 'Impetus', 'chest', 'Wyvern Wear', '스킬 등급', '완벽한 운동량', '전투 중에는 사용했거나 재사용 대기 중이 아닌 각 스킬마다 중첩이 쌓입니다.

중첩당 종합 스킬 대미지 +1.5%, 종합 스킬 회복 +2%. 스킬당 최대 18중첩. 재사용 대기 중에는 사라집니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('f71fcfef6da0de3e', '발톱 세우기', 'Claws Out', 'holster', 'Wyvern Wear', '스킬 등급', null, null, '[{"num": 500.0, "unit": "%", "type": "근접 대미지"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('868c4ac09d90af49', '공허한 사내', 'The Hollow Man', 'mask', 'Yaahl Gear', '방어도', null, null, '[{"num": 14.0, "unit": "%", "type": "생명력 대상 대미지"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('47395bc711f34ceb', '보베르', 'Bober', 'chest', 'Zwiadowka Sp.z o.o.', '무기 대미지', '완벽한 참호전', '방어도가 30% 미만일 때 엄폐 상태에서 헤드샷을 맞히면 방어도가 30% 회복됩니다.

재사용 대기시간: 1초', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('2e4198b749c899f7', '독수리의 손아귀', 'Eagles Grasp', 'gloves', 'Zwiadowka Sp.z o.o.', '무기 대미지', null, null, '[{"num": 15.0, "unit": "%", "type": "무기 조작력"}]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('5129a828a58e6832', '악마의 몫', 'Devil''s Due', 'backpack', 'Česká Výroba s.r.o.', '무기 대미지', '완벽한 클러치', '방어도가 20% 미만일 때 치명타를 맞히면 잃은 방어도의 2.5%가 회복됩니다.

처치하면 적색 핵심 속성 개수에 따라 4~10초 동안 방어도를 최대 100%까지 회복할 수 있습니다.', '[]'::jsonb);
insert into gear_named (item_key, name_ko, name_en, item_type, brandset, core_attribute_ko, talent_name_ko, talent_desc_ko, attrs) values ('3e33ea38e65e32fa', '격동', 'Turmoil', 'kneepads', 'Česká Výroba s.r.o.', '무기 대미지', '당혹', '적에게 무기 대미지를 줄 때, 그 대미지의 50%가 30m 안의 다른 적에게 대신 들어갑니다. 근처에 적이 없으면 평소대로 대미지를 줍니다.
방어구 플레이트에는 적용되지 않습니다.', '[{"num": 12.0, "unit": "%", "type": "치명타 대미지"}]'::jsonb);

-- ===== seed: gear_exotic =====
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('6cf7db846f59e203', '백인대장의 칼집', 'Centurion''s Scabbard', 'holster', '반격', '무기를 교체하면 다음 순서로 보너스 그룹을 하나씩 얻습니다:

1. 발사 속도 +20%, 무기 대미지 +20%
2. 탄창 용량 +50%, 재장전 속도 +50%

보너스는 12초 동안 유지되거나 다음 무기 교체 시까지 유지됩니다.
보조무기로 교체하면 다음 보너스 그룹이 발동하지 않습니다.', array['무기 대미지','치명타 확률','무기 조작력']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('31a85110a5eb6664', '도지 시티 건슬링어의 권총집', 'Dodge City Gunslinger''s Holster', 'holster', '속사', '권총을 넣어 둔 동안 0.3초마다 중첩 버프를 얻습니다(최대 100).

권총으로 교체하면 첫 발이 중첩을 소모하며 중첩당 대미지가 +10% 증가합니다.
이 사격은 어디에 맞아도 헤드샷 대미지를 줍니다.

필요 조건
권총 장착 필요', array['무기 대미지','무기 조작력','헤드샷 대미지']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('6de9bd26d7db7298', '황실 왕조', 'Imperial Dynasty', 'holster', '용의 시선', '전투 중일 때, 20m 안에서 가장 가까운 적에게 화상을 겁니다.

재사용 대기시간: 35초', array['스킬 등급','상태이상 효과','상태이상 저항']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('43c13444a8bc98f0', '날쌘 권총집', 'Nimble Holster', 'holster', '이리저리 피하기', '엄폐 간 이동으로 1m를 달릴 때마다 전체 방어도의 5%가 회복됩니다.
엄폐 간 이동 중에 받은 대미지는 10초에 걸쳐 회복됩니다.', array['무기 대미지','치명타 확률','치명타 대미지']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('975b3224b5dc97d6', '쇼커 펀치', 'Shocker Punch', 'holster', '제세동기', '쇼커 펀치를 장착한 동안 쇼크 상태이상으로 받는 스턴 효과가 50% 줄어듭니다.

방패로 근접 공격하면 근접 대미지가 100% 증가합니다.

세인트 엘모의 엔진과 함께 사용하면 근접 대미지가 100% 추가로 증가하고, 다음 근접 공격이 대상에게 쇼크를 겁니다.

세 아이템을 모두 사용하면 위의 모든 보너스가 적용되며, 근접 공격으로 인한 쇼크가 최초 대상을 기준으로 반경 5m까지 퍼집니다.

재사용 대기시간: 15초', array['방어도','폭발물 저항','상태이상 저항']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('d43cf388f3bcde71', '파형', 'Waveform', 'holster', '교류', '매초 두 스킬 중 하나에 스킬 대미지 3%의 중첩을 생성합니다(최대 10중첩).
최대치에서 10초가 지나면 중첩이 다른 스킬로 옮겨갑니다.
이 과정이 무한히 반복됩니다.', array['스킬 등급','스킬 대미지','스킬 가속']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('ab671c08b2a4d16d', '아코스타의 무릎 보호대', 'Acosta''s Kneepads', 'kneepads', '탈출 계획', '장애물을 뛰어넘으면 3초간 이동 속도 +10%.
5초간 움직이지 않으면 5초간 이동 속도 +20%.
상태이상 효과에 걸리면 5초간 이동 속도 +10%.
이동 속도 보너스는 최대 20%.
이 보너스는 다른 출처의 이동 속도 보너스와 중첩되지 않습니다.
상태이상 효과로 인한 이동 방해 페널티 -50%.', array['방어도','무작위 속성','무작위 속성']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('7194d4f91b56bccd', '블랙리스터', 'Blacklisters', 'kneepads', '추방', '적을 사격하면 표식이 걸립니다.
표식은 한 번에 하나만 유지됩니다.
표식은 15초 후, 또는 표식이 걸린 적이 죽으면 사라집니다.
표식이 걸린 적으로부터는 받는 대미지가 600% 증폭됩니다.
표식이 걸리지 않은 적에게는 주는 대미지가 20% 증폭됩니다.
전투 중인 적이 한 명만 남으면 표식이 사라지고 다시 걸 수 없습니다.', array['무기 대미지','치명타 확률','치명타 대미지']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('934fd850b24a3a61', '닌자바이크 메신저 무릎 보호대', 'NinjaBike Messenger Kneepads', 'kneepads', '파쿠르!', '엄폐 간 이동이나 장애물 뛰어넘기를 하면 장착한 무기가 재장전되고 5초간 보너스 방어도 +25%를 얻습니다.', array['무기 대미지','치명타 확률','치명타 대미지']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('bc13307b7ec0e07f', '간호사의 무릎 보호대', 'Nurse''s Kneepads', 'kneepads', '불침투', '자신과 10m 안의 아군 모두 상태이상 저항 +40%를 얻습니다.', array['무기 대미지','치명타 확률','치명타 대미지']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('d555b722ec1842c6', '소여의 무릎 보호대', 'Sawyer''s Kneepads', 'kneepads', '제자리 사수', '폭발로 인해 비틀거리지 않습니다.

움직이지 않는 동안 매초 종합 무기 대미지가 3%씩 증가합니다.
최대 10중첩까지 쌓이며 움직이기 시작하면 멈춥니다.
움직인 지 10초 후 모든 중첩을 잃습니다.', array['방어도','폭발물 저항','생명력']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('87bbe7feca396ff7', '피투성이 주먹', 'Bloody Knuckles', 'gloves', '물불 안 가리기', '수류탄으로 적에게 대미지를 주거나 근접 공격으로 적을 타격하면 ''시잉 레드''가 발동합니다.

시잉 레드는 무기 대미지 +25%, 근접 대미지 +100%를 부여합니다.

시잉 레드는 20초간 지속되며, 종료 후 60초의 재사용 대기시간이 있습니다.

재사용 대기 중에 근접 공격으로 적에게 대미지를 주거나 수류탄 효과로 적을 맞히면 재사용 대기시간이 즉시 종료됩니다.', array['무기 대미지','치명타 확률','치명타 대미지']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('262faaf6112f792a', 'BTSU 데이터글러브', 'BTSU Datagloves', 'gloves', '전이 오버클럭', '스킬 등급당 하이브 스킬 가속 +15%를 부여합니다.

하이브를 폭파시키면 스킬 재사용 대기시간이 초기화되고 15초간 과충전을 얻습니다.
스킬 등급 6이면 이 효과가 모든 아군에게도 적용됩니다.

이 효과를 받은 아군은 120초 동안 다시 효과를 받을 수 없습니다.', array['스킬 등급','스킬 가속','스킬 회복']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('034157313d53cd8e', '엑소더스 글러브', 'Exodus Gloves', 'gloves', '연막', '방어도가 깨지면 발밑에 연막탄을 떨어뜨려 3초간 적에게서 자신을 숨깁니다.
재사용 대기시간: 40초', array['무기 대미지','치명타 확률','치명타 대미지']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('07f6591e7fe0710b', '오버독스', 'Overdogs', 'gloves', '최약 연결고리', '등급 체계상 현재 전투 중인 적 중 가장 낮은 등급의 적에게 주는 무기 대미지를 30% 증폭시킵니다.

1등급: 헌터, 로그, 리더, 탱크, 실드, 헤비웨폰, RPG, 메딕, 컨트롤러, 워하운드, 마로더

2등급: 서포트, 엔지니어, 보디가드, 이모빌라이저, 봄버, 미니 탱크, 드론 오퍼레이터.

3등급: 그 외 모든 적 또는 스킬 프록시', array['무기 대미지','치명타 확률','치명타 대미지']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('363fa1529da1840f', '억센 건틀릿', 'Rugged Gauntlets', 'gloves', '강철 악력', '지향 사격 시 반동 페널티 -50%.
엄폐 상태에서 맹목 사격 시 반동 페널티 -50%.', array['무기 대미지','치명타 확률','치명타 대미지']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('3ebc6ae5221c316d', '카타르시스', 'Catharsis', 'mask', '악순환', '대미지를 받으면 중첩이 쌓입니다(최대 30).
중첩당 무기 대미지 +1.5%.
최대 중첩 상태에서 대미지를 받으면 정화가 발동해 모든 중첩과 상태이상 효과가 사라지고, 치유 구름이 생성되어 10초간 구름 안의 모든 아군의 최대 방어도 5%를 회복시킵니다.', array['방어도','받는 회복량','방어도 재생']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('99cbc81c0832598b', '코요테의 마스크', 'Coyote''s Mask', 'mask', '무리 본능', '자신과 모든 아군은 마지막으로 맞힌 적과의 거리에 따라 보너스를 얻습니다.

0~15m: 치명타 대미지 +25%
15~25m: 치명타 대미지 +10%, 치명타 확률 +10%
25m 이상: 치명타 확률 +25%', array['무기 대미지','치명타 확률','치명타 대미지']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('1fd27df1dc23c84e', '인베스터', 'Investor', 'mask', '슬롯형', '이 아이템의 비핵심 속성마다 색상에 따라 보너스를 받습니다:
빨강: 치명타 대미지 +10%
노랑: 스킬 효율 +5%
파랑: 방어도 재생 +1%

이 아이템은 어떤 핵심 속성이든 가질 수 있습니다.
이 아이템은 보호장구 개조 슬롯 대신 세 번째 무작위 속성을 갖습니다.
이 아이템은 헤드샷 대미지, 생명력, 스킬 회복 속성을 가질 수 없습니다.', array['무작위 핵심 속성','무작위 속성','무작위 속성','무작위 속성']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('5535971511d2cb70', '더 캐털리스트', 'The Catalyst', 'mask', '화학 작용제', '촉매 작용
상태이상 효과(화상, 출혈, 쇼크, EMP/방해, 중독, 실명/혼란)를 주거나 받으면 최대 12까지 촉매 작용 중첩이 쌓입니다. 중첩당:
무기 대미지 +2%
상태이상 효과 +2%

25m 안에서 상태이상 효과에 걸린 적 한 명당 초당 +1중첩.
자신이 상태이상 효과에 걸리면 초당 +2중첩.
5초 동안 범위 안에 적이 없거나 자신이 상태이상 효과에 걸려 있지 않으면 중첩이 초당 1개씩 사라집니다.

반응물
최대 중첩 상태에서 상태이상에 걸린 적을 처치하면 5초간 보너스를 얻습니다:
보너스 방어도 +25%
재장전 속도 +20%

안정제
화상 상태에서도 조준 사격이 끊기지 않고 유지됩니다.', array['무기 대미지','상태이상 저항','상태이상 효과']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('f2420af3372507c2', '땜장이', 'Tinkerer', 'mask', '축약', '주무기와 보조무기가 특급·네임드가 아니고 같은 종류라면, 보조무기의 탤런트가 주무기에도 적용됩니다.

주무기나 보조무기의 탤런트에 무기 교체 효과가 포함되어 있으면 적용되지 않습니다.
주무기와 보조무기의 탤런트가 같으면 적용되지 않습니다.', array['무기 대미지','치명타 확률','치명타 대미지']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('7a58d7d84502ba35', '바일', 'Vile', 'mask', '독성 전달', '상태이상 효과를 걸면 10초간 지속 대미지 디버프도 함께 겁니다.

총 대미지는 자신의 컨커션 수류탄 대미지의 50%에 해당하며, 상태이상 효과 속성에 따라 증가합니다.', array['스킬 등급','상태이상 효과','상태이상 저항']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('2f8af61b6340fa6f', '타디그레이드 방어체계', 'Tardigrade Armor System', 'chest', '삭마성 나노 코팅', '자신이나 아군의 방어도가 깨질 때마다, 10초간 자신의 방어도의 80%에 해당하는 보너스 방어도를 얻습니다.

아군당 재사용 대기시간: 45초

전문화 무기로 적을 처치하면 모든 아군의 이 재사용 대기시간이 사라집니다.', array['방어도','방어도 재생','폭발물 저항']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('7ef8b8ec715ecedd', '비컨', 'Beacon', 'chest', '유대', '10m 안에 아군이 있으면 자신과 아군 모두 치명타 대미지 +30%, 스킬 효율 +15%, 방어도 재생 +2%를 얻습니다.

10m 안에 자신의 스킬이 있으면 치명타 대미지 +15%, 스킬 효율 +8%, 방어도 재생 +1%를 얻습니다.

둘 중 더 높은 버프 그룹만 적용됩니다.', array['무기 대미지','치명타 확률','치명타 대미지']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('ac65d693dc79c197', '컬렉터', 'Collector', 'chest', '수집광', '수류탄 소지량 +3
수류탄 범위 +50%
수류탄 대미지 +35%
폭발에 추가로 휘말린 적 한 명당 수류탄 대미지 +25%.
인벤토리의 수류탄이 2개 미만이면 30초마다 수류탄이 자동으로 1개 재생성됩니다.', array['무기 대미지','치명타 확률','치명타 대미지']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('4277767f0ee0f590', '아이언 윌', 'Iron Will', 'chest', '결의', '다음 몸통 사격이 헤드샷으로 간주됩니다.

재사용 대기시간: 2초

필요 조건
장착: 지정사수소총, 소총, 권총', array['무기 대미지','헤드샷 대미지','무기 조작력']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('cf2420059eab8230', '프로보케이터', 'Provocator', 'chest', '도전자', '20m 안의 적으로부터 받는 대미지 저항 +25%를 얻습니다.', array['방어도','방어도 재생','상태이상 저항']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('feb88476d5a4fa85', '리지웨이의 자랑', 'Ridgeway''s Pride', 'chest', '최첨단', '15m 안의 적을 사격하면 대상에게 출혈을 겁니다.

15m 안에 출혈 중인 적이 있으면 그 수에 따라 매초 방어도의 3~48%가 회복됩니다.

출혈 중인 적 수에 따른 회복량:

1명: 3% 2명: 6% 3명: 12% 4명: 24% 5명: 48%', array['무기 대미지','치명타 확률','치명타 대미지']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('000c233b242c3824', '아코스타의 고백', 'Acosta''s Go-Bag', 'backpack', '손에 하나 .../... 가방엔 둘', '손에 하나 ...
수류탄을 던지면 반환되며 15초간 스킬 등급 +1을 얻습니다.
이미 스킬 등급 6이면 과충전을 얻습니다.

재사용 대기시간: 60초

... 가방엔 둘
방어구 키트 소지량 +1
수류탄 소지량 +3
탄약 휴대량 +25%
스킬 회복 +10%
상태이상 효과 +10%', array['스킬 등급','스킬 대미지','스킬 가속']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('598c2bce51b8d176', '버디의 응급처치 팩', 'Birdie''s Quick Fix Pack', 'backpack', '전투 위생병', '소생 속도 +80%
쇠약 디버프 지속 시간 -50%
하이브 효율 +45%
소생하거나 소생받는 동안, 그리고 하이브 소생 성공 후 5초간 또는 수동 소생 후 10초간 두 요원 모두에게 대미지 저항 +50%를 부여합니다.
소생에 성공하면 5초간 스킬 등급 +1을 부여합니다.
스킬 등급 6에서의 소생은 15초간 과충전을 부여합니다.', array['스킬 등급','스킬 가속','스킬 회복']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('c81c6ec1ce9b6a76', '해리어 프라이드', 'Harrier Pride', 'backpack', '재균형', '처치하거나 적을 3번 맞히면 빨강 중첩이 쌓입니다.
중첩당 무기 대미지 +0.5%.

3번 맞으면 파랑 중첩이 쌓입니다.
중첩당 대미지 저항 +0.5%.

총 중첩이 80에 도달하면 모든 중첩을 잃고, 빨강 중첩당 대미지 저항 +0.5%, 파랑 중첩당 무기 대미지 +0.5%의 별도 보너스를 다음 최대 중첩 도달 시까지 받습니다.', array['무기 대미지','방어도','스킬 등급']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('7e97abafe7c928de', '메멘토', 'Memento', 'backpack', '처치 확인', '처치한 적이 죽을 때 전리품을 떨어뜨립니다.
전리품을 모으면 단기·장기 버프를 모두 얻으며, 단기 버프는 장착한 핵심 속성 수에 비례하고 10초간 지속됩니다.

빨강 - 무기 대미지 +5%
파랑 - 보너스 방어도 +10%
노랑 - 스킬 효율 +5%

전리품을 모을 때마다 300초간 무기 대미지 +1%, 스킬 효율 +1%, 방어도 재생 +0.1%를 추가로 얻습니다.

최대 30중첩.', array['무기 대미지','방어도','스킬 등급']);
insert into gear_exotic (item_key, name_ko, name_en, item_type, talent_name_ko, talent_desc_ko, attr_types_ko) values ('f4a0b9f96079f766', '닌자바이크 메신저 백팩', 'NinjaBike Messenger Backpack', 'backpack', '임기응변', '장착한 모든 기어 세트·브랜드 세트 아이템과 슬롯을 공유해 기어 세트 보너스 해금 요건을 충족시킵니다.
여러 세트의 보너스를 동시에 해금할 수 있습니다.', array['무기 대미지','방어도','스킬 등급']);
