# dungeons/armor/on_hit.mcfunction
# @s is the player

# Compute armor base total damage
# Get damage by armor piece
execute if data entity @s equipment.head.components."minecraft:custom_data".vexp store result score #helmet_damage vexp.math run data get entity @s equipment.head.components."minecraft:custom_data".vexp.armor.stats.damage 10
execute if data entity @s equipment.chest.components."minecraft:custom_data".vexp store result score #chestplate_damage vexp.math run data get entity @s equipment.chest.components."minecraft:custom_data".vexp.armor.stats.damage 10
execute if data entity @s equipment.legs.components."minecraft:custom_data".vexp store result score #leggings_damage vexp.math run data get entity @s equipment.legs.components."minecraft:custom_data".vexp.armor.stats.damage 10
execute if data entity @s equipment.feet.components."minecraft:custom_data".vexp store result score #boots_damage vexp.math run data get entity @s equipment.feet.components."minecraft:custom_data".vexp.armor.stats.damage 10

# Calculate total
scoreboard players set #total_armor_damage vexp.math 0
scoreboard players operation #total_armor_damage vexp.math += #helmet_damage vexp.math
scoreboard players operation #total_armor_damage vexp.math += #chestplate_damage vexp.math
scoreboard players operation #total_armor_damage vexp.math += #leggings_damage vexp.math
scoreboard players operation #total_armor_damage vexp.math += #boots_damage vexp.math

# Apply total
execute store result score #eff_dmg vexp.math run data get storage vexp:dungeons.weapon combo_params.damage 10
scoreboard players operation #eff_dmg vexp.math += #total_armor_damage vexp.math
execute store result storage vexp:dungeons.weapon combo_params.eff_damage float 0.1 run scoreboard players get #eff_dmg vexp.math

# Custom armor on hit hook
function vexp:dungeons/armor/detect_type
execute if entity @s[tag=vexp.armor_equip] run function vexp:dungeons/armor/hooks/on_hit with entity @s equipment.chest.components."minecraft:custom_data".vexp
