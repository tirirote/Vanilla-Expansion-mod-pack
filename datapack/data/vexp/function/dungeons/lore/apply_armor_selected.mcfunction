# dungeons/lore/apply_armor_selected.mcfunction
# @s is the player holding a custom armor item in main hand.

data modify storage vexp:temp lore_apply_armor set value {desc:"Armadura personalizada"}

execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.armor.desc run data modify storage vexp:temp lore_apply_armor.desc set from entity @s SelectedItem.components."minecraft:custom_data".vexp.armor.desc

data modify storage vexp:temp lore_apply_armor.defense set from entity @s SelectedItem.components."minecraft:custom_data".vexp.armor.stats.defense
data modify storage vexp:temp lore_apply_armor.toughness set from entity @s SelectedItem.components."minecraft:custom_data".vexp.armor.stats.toughness
data modify storage vexp:temp lore_apply_armor.knockback_resistance set from entity @s SelectedItem.components."minecraft:custom_data".vexp.armor.stats.knockback_resistance

data modify storage vexp:temp lore_apply_armor.custom_data set from entity @s SelectedItem.components."minecraft:custom_data"
data modify storage vexp:temp lore_apply_armor.custom_data.vexp.lore_applied set value 1b

function vexp:dungeons/lore/apply_armor_macro_selected with storage vexp:temp lore_apply_armor
