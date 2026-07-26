# Cubism I-V: bonus damage against slimes, magma cubes and creepers (same scaling as Smite).
# @s = attacker

scoreboard players set #ench_cubism_pct vexp.math 25
execute if score @s vexp.enchant.cubism matches 1 run scoreboard players set #ench_cubism_pct vexp.math 25
execute if score @s vexp.enchant.cubism matches 2 run scoreboard players set #ench_cubism_pct vexp.math 50
execute if score @s vexp.enchant.cubism matches 3 run scoreboard players set #ench_cubism_pct vexp.math 75
execute if score @s vexp.enchant.cubism matches 4 run scoreboard players set #ench_cubism_pct vexp.math 100
execute if score @s vexp.enchant.cubism matches 5.. run scoreboard players set #ench_cubism_pct vexp.math 125

# Apply slowness
execute if score @s vexp.enchant.cubism matches 1 run effect give @e[tag=vexp.hitted,type=#vexp:enchantment_cubism_targets] slowness 1 1 true
execute if score @s vexp.enchant.cubism matches 2 run effect give @e[tag=vexp.hitted,type=#vexp:enchantment_cubism_targets] slowness 2 1 true
execute if score @s vexp.enchant.cubism matches 3 run effect give @e[tag=vexp.hitted,type=#vexp:enchantment_cubism_targets] slowness 3 1 true
execute if score @s vexp.enchant.cubism matches 4 run effect give @e[tag=vexp.hitted,type=#vexp:enchantment_cubism_targets] slowness 4 1 true
execute if score @s vexp.enchant.cubism matches 5.. run effect give @e[tag=vexp.hitted,type=#vexp:enchantment_cubism_targets] slowness 5 1 true

# Get current damage and add bonus
scoreboard players set #cubism_bonus vexp.math 0
execute store result score #cubism_bonus vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 10
scoreboard players operation #cubism_bonus vexp.math += #ench_cubism_pct vexp.math
execute if score #cubism_bonus vexp.math matches ..0 run scoreboard players set #cubism_bonus vexp.math 1

execute store result storage vexp:temp cubism_damage float 0.1 run scoreboard players get #cubism_bonus vexp.math

execute as @e[tag=vexp.hitted,type=#vexp:enchantment_cubism_targets] run function vexp:dungeons/enchantments/custom/hit/cubism_deal_bonus with storage vexp:temp

# Feedback
execute as @e[tag=vexp.hitted,type=#vexp:enchantment_cubism_targets] at @s run function vexp:dungeons/fx/enchantments/bane
