# dungeons/lore/apply_armor_selected.mcfunction
# @s is the player holding a custom armor item in main hand.

data modify storage vexp:temp lore_apply_armor set value {desc:"Armadura personalizada"}

execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.armor.desc run data modify storage vexp:temp lore_apply_armor.desc set from entity @s SelectedItem.components."minecraft:custom_data".vexp.armor.desc

data modify storage vexp:temp lore_apply_armor.defense set from entity @s SelectedItem.components."minecraft:custom_data".vexp.armor.stats.defense
data modify storage vexp:temp lore_apply_armor.toughness set from entity @s SelectedItem.components."minecraft:custom_data".vexp.armor.stats.toughness
data modify storage vexp:temp lore_apply_armor.knockback_resistance set from entity @s SelectedItem.components."minecraft:custom_data".vexp.armor.stats.knockback_resistance

data modify storage vexp:temp lore_apply_armor.custom_data set from entity @s SelectedItem.components."minecraft:custom_data"
data modify storage vexp:temp lore_apply_armor.custom_data.vexp.lore_applied set value 1b

# Reforge display counters: remaining uses / max uses.
scoreboard players set #rf_uses vexp.math 0
scoreboard players set #rf_max vexp.math 3
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.reforge.uses store result score #rf_uses vexp.math run data get entity @s SelectedItem.components."minecraft:custom_data".vexp.reforge.uses 1
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.reforge.max_uses store result score #rf_max vexp.math run data get entity @s SelectedItem.components."minecraft:custom_data".vexp.reforge.max_uses 1
scoreboard players operation #rf_left vexp.math = #rf_max vexp.math
scoreboard players operation #rf_left vexp.math -= #rf_uses vexp.math
execute if score #rf_left vexp.math matches ..-1 run scoreboard players set #rf_left vexp.math 0
execute store result storage vexp:temp lore_apply_armor.reforge_left int 1 run scoreboard players get #rf_left vexp.math
execute store result storage vexp:temp lore_apply_armor.reforge_max int 1 run scoreboard players get #rf_max vexp.math

function vexp:dungeons/lore/apply_armor_macro_selected with storage vexp:temp lore_apply_armor
