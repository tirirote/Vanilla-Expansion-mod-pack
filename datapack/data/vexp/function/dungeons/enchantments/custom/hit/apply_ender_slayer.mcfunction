# Ender Slayer I-V: bonus damage against End mobs (same scaling as Smite).
# @s = attacker
# Scale is 10.
scoreboard players set #ench_ender_slayer_val vexp.math 25
execute if score @s vexp.enchant.ender_slayer matches 1 run scoreboard players set #ench_ender_slayer_val vexp.math 25
execute if score @s vexp.enchant.ender_slayer matches 2 run scoreboard players set #ench_ender_slayer_val vexp.math 50
execute if score @s vexp.enchant.ender_slayer matches 3 run scoreboard players set #ench_ender_slayer_val vexp.math 75
execute if score @s vexp.enchant.ender_slayer matches 4 run scoreboard players set #ench_ender_slayer_val vexp.math 100
execute if score @s vexp.enchant.ender_slayer matches 5.. run scoreboard players set #ench_ender_slayer_val vexp.math 125

# Apply slowness
execute if score @s vexp.enchant.ender_slayer matches 1 run effect give @e[tag=vexp.hitted,type=#vexp:enchantment_ender_slayer_targets] slowness 1 1 true
execute if score @s vexp.enchant.ender_slayer matches 2 run effect give @e[tag=vexp.hitted,type=#vexp:enchantment_ender_slayer_targets] slowness 2 1 true
execute if score @s vexp.enchant.ender_slayer matches 3 run effect give @e[tag=vexp.hitted,type=#vexp:enchantment_ender_slayer_targets] slowness 3 1 true
execute if score @s vexp.enchant.ender_slayer matches 4 run effect give @e[tag=vexp.hitted,type=#vexp:enchantment_ender_slayer_targets] slowness 4 1 true
execute if score @s vexp.enchant.ender_slayer matches 5.. run effect give @e[tag=vexp.hitted,type=#vexp:enchantment_ender_slayer_targets] slowness 5 1 true

# Get current damage and add bonus
scoreboard players set #ender_slayer_bonus vexp.math 0
execute store result score #ender_slayer_bonus vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 10
scoreboard players operation #ender_slayer_bonus vexp.math += #ench_ender_slayer_val vexp.math
execute if score #ender_slayer_bonus vexp.math matches ..0 run scoreboard players set #ender_slayer_bonus vexp.math 1

execute store result storage vexp:temp ender_slayer_damage float 0.1 run scoreboard players get #ender_slayer_bonus vexp.math

execute as @e[tag=vexp.hitted,type=#vexp:enchantment_ender_slayer_targets,distance=..16,limit=1] run function vexp:dungeons/enchantments/custom/hit/ender_slayer_deal_bonus with storage vexp:temp

# Status and Feedback effects
effect give @e[tag=vexp.hitted,type=#vexp:enchantment_ender_slayer_targets,distance=..16] slowness 5 1 true
execute as @e[tag=vexp.hitted,type=#vexp:enchantment_ender_slayer_targets,distance=..16] at @s run function vexp:dungeons/fx/enchantments/bane
