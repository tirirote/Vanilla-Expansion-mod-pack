# dungeons/lore/apply_armor_feet.mcfunction
# @s is the player with custom armor boots equipped.

data modify storage vexp:temp lore_apply_armor set value {desc:"Armadura personalizada"}
data modify storage vexp:temp lore_apply_armor.defense set from entity @s equipment.feet.components."minecraft:custom_data".vexp.armor.stats.defense
data modify storage vexp:temp lore_apply_armor.toughness set from entity @s equipment.feet.components."minecraft:custom_data".vexp.armor.stats.toughness
data modify storage vexp:temp lore_apply_armor.knockback_resistance set from entity @s equipment.feet.components."minecraft:custom_data".vexp.armor.stats.knockback_resistance
execute if data entity @s equipment.feet.components."minecraft:custom_data".vexp.armor.desc run data modify storage vexp:temp lore_apply_armor.desc set from entity @s equipment.feet.components."minecraft:custom_data".vexp.armor.desc

data modify storage vexp:temp lore_apply_armor.custom_data set from entity @s equipment.feet.components."minecraft:custom_data"
data modify storage vexp:temp lore_apply_armor.custom_data.vexp.lore_applied set value 1b

function vexp:dungeons/lore/apply_armor_macro_feet with storage vexp:temp lore_apply_armor
