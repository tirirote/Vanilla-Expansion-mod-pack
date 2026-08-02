# dungeons/combo_system/hooks/apply_params.mcfunction

# Assign cooldown from item params (effect-adjusted)
$scoreboard players set @s vexp.combo_cooldown $(eff_cooldown)

#1. Assign vexp.attacker to current player
tag @s add vexp.attacker

# Critical hit by jump: trigger only while descending in the air (after jump peak).
tag @s remove vexp.hit_critical
scoreboard players set #crit_vy vexp.math 0
execute if predicate vexp:is_airborne store result score #crit_vy vexp.math run data get entity @s Motion[1] 100
execute if predicate vexp:is_airborne if score #crit_vy vexp.math matches ..10 run tag @s add vexp.hit_critical

#2. Swoosh Feedback
execute store result score #random_swoosh vexp.math run random value 0..5
execute unless data storage vexp:dungeons.weapon combo_params{item:"spellbook"} if score #random_swoosh vexp.math matches 0 run function vexp:dungeons/fx/swooshes/combo_swoosh_0
execute unless data storage vexp:dungeons.weapon combo_params{item:"spellbook"} if score #random_swoosh vexp.math matches 1 run function vexp:dungeons/fx/swooshes/combo_swoosh_1
execute unless data storage vexp:dungeons.weapon combo_params{item:"spellbook"} if score #random_swoosh vexp.math matches 2 run function vexp:dungeons/fx/swooshes/combo_swoosh_2
execute unless data storage vexp:dungeons.weapon combo_params{item:"spellbook"} if score #random_swoosh vexp.math matches 3 run function vexp:dungeons/fx/swooshes/combo_swoosh_3
execute unless data storage vexp:dungeons.weapon combo_params{item:"spellbook"} if score #random_swoosh vexp.math matches 4 run function vexp:dungeons/fx/swooshes/combo_swoosh_4
execute unless data storage vexp:dungeons.weapon combo_params{item:"spellbook"} if score #random_swoosh vexp.math matches 5 run function vexp:dungeons/fx/swooshes/combo_swoosh_5
execute unless data storage vexp:dungeons.weapon combo_params{item:"spellbook"} run function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player", pitch:1}

#3. Queue delayed hit resolution so swoosh feedback can play first.
scoreboard players set @s[tag=!vexp.hit_delay.pending] vexp.hit_delay 5
tag @s add vexp.hit_delay.pending
