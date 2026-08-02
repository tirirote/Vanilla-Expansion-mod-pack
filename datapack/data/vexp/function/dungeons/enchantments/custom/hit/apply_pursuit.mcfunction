# Pursuit I/II: bonus damage scales with missing player health.
# Base multiplier: 10% / 20%, scaled by missing HP percentage.

scoreboard players set #pursuit_base_pct vexp.math 10
execute if score @s vexp.enchant.pursuit matches 2.. run scoreboard players set #pursuit_base_pct vexp.math 20

scoreboard players set #pursuit_max_hp vexp.math 1
scoreboard players set #pursuit_cur_hp vexp.math 0
execute store result score #pursuit_max_hp vexp.math run attribute @s minecraft:max_health get 10
execute store result score #pursuit_cur_hp vexp.math run data get entity @s Health 10
execute if score #pursuit_max_hp vexp.math matches ..0 run scoreboard players set #pursuit_max_hp vexp.math 1

scoreboard players operation #pursuit_missing_hp vexp.math = #pursuit_max_hp vexp.math
scoreboard players operation #pursuit_missing_hp vexp.math -= #pursuit_cur_hp vexp.math
execute if score #pursuit_missing_hp vexp.math matches ..0 run return 0

scoreboard players set #const_10 vexp.math 10

# Precision-safe formula (no early % rounding):
# bonus = eff_damage * base_pct * missing_hp / max_hp * 10
scoreboard players set #pursuit_bonus vexp.math 0
execute store result score #pursuit_bonus vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 10
scoreboard players operation #pursuit_bonus vexp.math *= #pursuit_base_pct vexp.math
scoreboard players operation #pursuit_bonus vexp.math *= #pursuit_missing_hp vexp.math
scoreboard players operation #pursuit_max_hp vexp.math *= #const_10 vexp.math
scoreboard players operation #pursuit_bonus vexp.math /= #pursuit_max_hp vexp.math
execute if score #pursuit_bonus vexp.math matches ..0 run return 0

execute store result storage vexp:temp pursuit_damage float 0.1 run scoreboard players get #pursuit_bonus vexp.math
execute as @e[tag=vexp.hitted,distance=..16] at @s run function vexp:dungeons/enchantments/custom/hit/pursuit_deal_bonus with storage vexp:temp

#Feedback
execute as @e[tag=vexp.hitted,distance=..16] at @s run function vexp:dungeons/fx/enchantments/pursuit

function vexp:utils/sound {sound: "minecraft:entity.vex.hurt", type: "player", pitch:1}
