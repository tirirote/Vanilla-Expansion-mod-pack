# Backstab I/II/III: bonus damage when attacker is behind the target.
# Bonus: 15% / 30% / 45% of current combo eff_damage.

scoreboard players set #backstab_pct vexp.math 15
execute if score @s vexp.enchant.backstab matches 2 run scoreboard players set #backstab_pct vexp.math 30
execute if score @s vexp.enchant.backstab matches 3.. run scoreboard players set #backstab_pct vexp.math 45

# Mark valid backstab targets: attacker is behind the victim.
tag @e[tag=vexp.hitted] remove vexp.backstab_target
execute as @e[tag=vexp.hitted] at @s anchored eyes positioned ^ ^ ^-2 if entity @p[tag=vexp.attacker,limit=1,distance=..2.5] run tag @s add vexp.backstab_target
execute as @e[tag=vexp.hitted] at @s anchored eyes positioned ^ ^ ^-4 if entity @p[tag=vexp.attacker,limit=1,distance=..2.5] run tag @s add vexp.backstab_target
execute as @e[tag=vexp.hitted] at @s anchored eyes positioned ^ ^ ^-6 if entity @p[tag=vexp.attacker,limit=1,distance=..2.5] run tag @s add vexp.backstab_target
execute as @e[tag=vexp.hitted] at @s anchored eyes positioned ^ ^ ^-8 if entity @p[tag=vexp.attacker,limit=1,distance=..2.5] run tag @s add vexp.backstab_target
execute as @e[tag=vexp.hitted] at @s anchored eyes positioned ^ ^ ^-10 if entity @p[tag=vexp.attacker,limit=1,distance=..2.5] run tag @s add vexp.backstab_target
execute as @e[tag=vexp.hitted] at @s anchored eyes positioned ^ ^ ^-12 if entity @p[tag=vexp.attacker,limit=1,distance=..2.5] run tag @s add vexp.backstab_target
execute as @e[tag=vexp.hitted] at @s anchored eyes positioned ^ ^ ^-14 if entity @p[tag=vexp.attacker,limit=1,distance=..2.5] run tag @s add vexp.backstab_target
execute as @e[tag=vexp.hitted] at @s anchored eyes positioned ^ ^ ^-16 if entity @p[tag=vexp.attacker,limit=1,distance=..2.5] run tag @s add vexp.backstab_target

scoreboard players set #backstab_bonus vexp.math 0
execute store result score #backstab_bonus vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 10
scoreboard players operation #backstab_bonus vexp.math *= #backstab_pct vexp.math
scoreboard players set #const_100 vexp.math 100
scoreboard players operation #backstab_bonus vexp.math /= #const_100 vexp.math
execute if score #backstab_bonus vexp.math matches ..0 run scoreboard players set #backstab_bonus vexp.math 1

execute store result score #backstab_total vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 10
scoreboard players operation #backstab_total vexp.math += #backstab_bonus vexp.math

execute store result storage vexp:temp backstab_damage float 0.1 run scoreboard players get #backstab_total vexp.math

execute as @e[tag=vexp.backstab_target] run function vexp:dungeons/enchantments/custom/hit/backstab_deal_bonus with storage vexp:temp

#Feedback
execute as @e[tag=vexp.backstab_target,limit=1] at @s run function vexp:dungeons/fx/enchantments/backstab

tag @e[tag=vexp.backstab_target] remove vexp.backstab_target
