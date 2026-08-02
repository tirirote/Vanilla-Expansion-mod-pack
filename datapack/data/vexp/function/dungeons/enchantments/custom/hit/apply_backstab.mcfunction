# Backstab I/II/III: bonus damage when attacker is behind the target.
# Bonus: 15% / 30% / 45% of current combo eff_damage.

scoreboard players set #backstab_pct vexp.math 15
execute if score @s vexp.enchant.backstab matches 2 run scoreboard players set #backstab_pct vexp.math 30
execute if score @s vexp.enchant.backstab matches 3.. run scoreboard players set #backstab_pct vexp.math 45

# Mark valid backstab targets: attacker is behind the victim.
tag @e[tag=vexp.hitted,distance=..16] remove vexp.backstab_target
execute as @e[tag=vexp.hitted,distance=..16] at @s anchored eyes positioned ^ ^ ^-2 if entity @p[tag=vexp.attacker,limit=1,distance=..3] run tag @s add vexp.backstab_target

scoreboard players set #backstab_bonus vexp.math 0
execute store result score #backstab_bonus vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 10
scoreboard players operation #backstab_bonus vexp.math *= #backstab_pct vexp.math
scoreboard players set #const_100 vexp.math 100
scoreboard players operation #backstab_bonus vexp.math /= #const_100 vexp.math
execute if score #backstab_bonus vexp.math matches ..0 run scoreboard players set #backstab_bonus vexp.math 1

execute store result storage vexp:temp backstab_damage int 1 run scoreboard players get #backstab_bonus vexp.math

execute as @e[tag=vexp.backstab_target,distance=..16] run function vexp:dungeons/enchantments/custom/hit/backstab_deal_bonus with storage vexp:temp

#Feedback
execute as @e[tag=vexp.backstab_target,distance=..16] at @s run function vexp:dungeons/fx/enchantments/backstab

tag @e[tag=vexp.backstab_target,distance=..16] remove vexp.backstab_target
