# Bane of Arthropods: dano extra a artropodos.

scoreboard players set #ench_bane_pct vexp.math 25
execute if score @s vexp.enchant.bane_of_arthropods matches 1 run scoreboard players set #ench_bane_pct vexp.math 25
execute if score @s vexp.enchant.bane_of_arthropods matches 2 run scoreboard players set #ench_bane_pct vexp.math 50
execute if score @s vexp.enchant.bane_of_arthropods matches 3 run scoreboard players set #ench_bane_pct vexp.math 75
execute if score @s vexp.enchant.bane_of_arthropods matches 4 run scoreboard players set #ench_bane_pct vexp.math 100
execute if score @s vexp.enchant.bane_of_arthropods matches 5.. run scoreboard players set #ench_bane_pct vexp.math 125

# Apply slowness
execute if score @s vexp.enchant.bane_of_arthropods matches 1 run effect give @e[tag=vexp.hitted,type=#vexp:enchantment_bane_targets] slowness 1 1 true
execute if score @s vexp.enchant.bane_of_arthropods matches 2 run effect give @e[tag=vexp.hitted,type=#vexp:enchantment_bane_targets] slowness 2 1 true
execute if score @s vexp.enchant.bane_of_arthropods matches 3 run effect give @e[tag=vexp.hitted,type=#vexp:enchantment_bane_targets] slowness 3 1 true
execute if score @s vexp.enchant.bane_of_arthropods matches 4 run effect give @e[tag=vexp.hitted,type=#vexp:enchantment_bane_targets] slowness 4 1 true
execute if score @s vexp.enchant.bane_of_arthropods matches 5.. run effect give @e[tag=vexp.hitted,type=#vexp:enchantment_bane_targets] slowness 5 1 true

# Get current damage and add bonus
scoreboard players set #bane_bonus vexp.math 0
execute store result score #bane_bonus vexp.math run data get storage vexp:dungeons.weapon combo_params.eff_damage 10
scoreboard players operation #bane_bonus vexp.math += #ench_bane_pct vexp.math
execute if score #bane_bonus vexp.math matches ..0 run scoreboard players set #bane_bonus vexp.math 1

execute store result storage vexp:temp bane_damage float 0.1 run scoreboard players get #bane_bonus vexp.math

execute as @e[tag=vexp.hitted,type=#vexp:enchantment_bane_targets,limit=1] run function vexp:dungeons/enchantments/vanilla/hit/bane_deal_bonus with storage vexp:temp

# Feedback
execute as @e[tag=vexp.hitted,type=#vexp:enchantment_bane_targets] at @s run function vexp:dungeons/fx/enchantments/bane
