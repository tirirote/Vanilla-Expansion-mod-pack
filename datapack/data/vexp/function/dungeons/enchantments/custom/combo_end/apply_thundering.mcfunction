# Thundering I/II/III: AoE pulse on combo finisher.
# Bonus damage: 10% / 20% / 30% of current combo eff_damage in radius 3.5.

scoreboard players set #thunder_pct vexp.math 10
execute if score #ench_thundering vexp.math matches 2 run scoreboard players set #thunder_pct vexp.math 20
execute if score #ench_thundering vexp.math matches 3.. run scoreboard players set #thunder_pct vexp.math 30

scoreboard players set #thunder_bonus vexp.math 0
execute store result score #thunder_bonus vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 10
scoreboard players operation #thunder_bonus vexp.math *= #thunder_pct vexp.math
scoreboard players set #const_100 vexp.math 100
scoreboard players operation #thunder_bonus vexp.math /= #const_100 vexp.math
execute if score #thunder_bonus vexp.math matches ..0 run scoreboard players set #thunder_bonus vexp.math 1

execute store result storage vexp:temp thundering_damage float 0.1 run scoreboard players get #thunder_bonus vexp.math

function vexp:utils/fx/thundering

execute as @e[predicate=vexp:is_target,distance=..3.5] at @s run function vexp:dungeons/enchantments/custom/combo_end/thundering_deal_bonus with storage vexp:temp
