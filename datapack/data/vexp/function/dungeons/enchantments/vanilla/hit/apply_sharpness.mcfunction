# Sharpness: +0.5*level + 0.5 al dano de melee.

scoreboard players set #ench_sharp_pct vexp.math 15
execute if score @s vexp.enchant.sharpness matches 1 run scoreboard players set #ench_sharp_pct vexp.math 15
execute if score @s vexp.enchant.sharpness matches 2 run scoreboard players set #ench_sharp_pct vexp.math 20
execute if score @s vexp.enchant.sharpness matches 3 run scoreboard players set #ench_sharp_pct vexp.math 25
execute if score @s vexp.enchant.sharpness matches 4 run scoreboard players set #ench_sharp_pct vexp.math 30
execute if score @s vexp.enchant.sharpness matches 5.. run scoreboard players set #ench_sharp_pct vexp.math 35

# Get current damage and add bonus
scoreboard players set #sharpness_bonus vexp.math 0
execute store result score #sharpness_bonus vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 10
scoreboard players operation #sharpness_bonus vexp.math += #ench_sharp_pct vexp.math
execute if score #sharpness_bonus vexp.math matches ..0 run scoreboard players set #sharpness_bonus vexp.math 1

execute store result storage vexp:temp sharpness_damage float 0.1 run scoreboard players get #sharpness_bonus vexp.math

function vexp:dungeons/enchantments/vanilla/hit/sharpness_deal_bonus with storage vexp:temp

execute as @e[tag=vexp.hitted] at @s run function vexp:dungeons/fx/enchantments/sharpness
