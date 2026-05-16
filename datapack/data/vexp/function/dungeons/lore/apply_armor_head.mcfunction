# dungeons/lore/apply_armor_head.mcfunction
# @s is the player with a custom armor helmet equipped.

data modify storage vexp:temp lore_apply_armor set value {desc:"Armadura personalizada"}
data modify storage vexp:temp lore_apply_armor.defense set from entity @s equipment.head.components."minecraft:custom_data".vexp.armor.stats.defense
data modify storage vexp:temp lore_apply_armor.toughness set from entity @s equipment.head.components."minecraft:custom_data".vexp.armor.stats.toughness
data modify storage vexp:temp lore_apply_armor.knockback_resistance set from entity @s equipment.head.components."minecraft:custom_data".vexp.armor.stats.knockback_resistance
execute if data entity @s equipment.head.components."minecraft:custom_data".vexp.armor.desc run data modify storage vexp:temp lore_apply_armor.desc set from entity @s equipment.head.components."minecraft:custom_data".vexp.armor.desc

data modify storage vexp:temp lore_apply_armor.custom_data set from entity @s equipment.head.components."minecraft:custom_data"
data modify storage vexp:temp lore_apply_armor.custom_data.vexp.lore_applied set value 1b

function vexp:dungeons/lore/apply_armor_macro_head with storage vexp:temp lore_apply_armor
