# dungeons/combo_system/hooks/apply_params.mcfunction

# Assign cooldown from item params (effect-adjusted)
$scoreboard players set @s vexp.combo_cooldown $(eff_cooldown)

# Start swoosh spawn window (10 ticks from hit trigger)
scoreboard players set @s vexp.swoosh_ticks 1

# 2. Assign vexp.attacker to current player
tag @s add vexp.attacker

# Critical hit by jump: trigger only while descending in the air (after jump peak).
tag @s remove vexp.hit_critical
scoreboard players set #crit_vy vexp.math 0
execute if predicate vexp:is_airborne store result score #crit_vy vexp.math run data get entity @s Motion[1] 1000
execute if predicate vexp:is_airborne if score #crit_vy vexp.math matches ..-1 run tag @s add vexp.hit_critical

# Generic damage based on item params (Assigns vexp.hitted to nearest mob)
# damage_aoe will now handle finding the hitbox itself
function vexp:dungeons/combo_system/hitbox/damage_aoe with storage vexp:dungeons.weapon combo_params

# Process combos and hooks for the hitted entity
function vexp:dungeons/combo_system/hooks/hit/handle_hit with storage vexp:dungeons.weapon combo_params

function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player"}
