# Smite: dano extra a objetivos no-muertos.
# Scale is 10.
scoreboard players set #ench_smite_val vexp.math 25
execute if score @s vexp.enchant.smite matches 1 run scoreboard players set #ench_smite_val vexp.math 25
execute if score @s vexp.enchant.smite matches 2 run scoreboard players set #ench_smite_val vexp.math 50
execute if score @s vexp.enchant.smite matches 3 run scoreboard players set #ench_smite_val vexp.math 75
execute if score @s vexp.enchant.smite matches 4 run scoreboard players set #ench_smite_val vexp.math 100
execute if score @s vexp.enchant.smite matches 5.. run scoreboard players set #ench_smite_val vexp.math 125

# Get current damage and add bonus
scoreboard players set #smite_bonus vexp.math 0
execute store result score #smite_bonus vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 10
scoreboard players operation #smite_bonus vexp.math += #ench_smite_val vexp.math
execute if score #smite_bonus vexp.math matches ..0 run scoreboard players set #smite_bonus vexp.math 1

execute store result storage vexp:temp smite_damage float 0.1 run scoreboard players get #smite_bonus vexp.math

execute as @e[tag=vexp.hitted,type=#vexp:enchantment_smite_targets,limit=1] run function vexp:dungeons/enchantments/vanilla/hit/smite_deal_bonus with storage vexp:temp
