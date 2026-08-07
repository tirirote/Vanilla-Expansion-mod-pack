# Apply armor item modifiers

# Get modifiers
$data modify storage vexp:temp lore_apply_armor.attributes set from entity @s $(path).components."minecraft:attribute_modifiers"

# Select speed presets
execute if data storage vexp:temp lore_apply_armor{speed:"Muy lenta"} run scoreboard players set #armor_speed_mod vexp.math -8
execute if data storage vexp:temp lore_apply_armor{speed:"Lenta"} run scoreboard players set #armor_speed_mod vexp.math -4
execute if data storage vexp:temp lore_apply_armor{speed:"Media"} run scoreboard players set #armor_speed_mod vexp.math 2
execute if data storage vexp:temp lore_apply_armor{speed:"Alta"} run scoreboard players set #armor_speed_mod vexp.math 5
execute if data storage vexp:temp lore_apply_armor{speed:"Muy alta"} run scoreboard players set #armor_speed_mod vexp.math 10
execute store result storage vexp:temp lore_apply_armor.attributes[0].amount float 0.001 run scoreboard players get #armor_speed_mod vexp.math

# Select knockback presets
execute if data storage vexp:temp lore_apply_armor{knockback_resistance:"Ninguna"} run scoreboard players set #armor_knock_mod vexp.math 0
execute if data storage vexp:temp lore_apply_armor{knockback_resistance:"Baja"} run scoreboard players set #armor_knock_mod vexp.math 2
execute if data storage vexp:temp lore_apply_armor{knockback_resistance:"Media"} run scoreboard players set #armor_knock_mod vexp.math 4
execute if data storage vexp:temp lore_apply_armor{knockback_resistance:"Alta"} run scoreboard players set #armor_knock_mod vexp.math 6
execute store result storage vexp:temp lore_apply_armor.attributes[3].amount float 0.01 run scoreboard players get #armor_knock_mod vexp.math


# Armor Base
$data modify storage vexp:temp lore_apply_armor.attributes[1].amount set from entity @s $(path).components."minecraft:custom_data".vexp.armor.stats.defense
# Toughness
$data modify storage vexp:temp lore_apply_armor.attributes[2].amount set from entity @s $(path).components."minecraft:custom_data".vexp.armor.stats.toughness
