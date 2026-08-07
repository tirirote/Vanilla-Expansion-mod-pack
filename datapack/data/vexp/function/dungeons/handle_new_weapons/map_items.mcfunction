# Map vanilla weapons/tools found without vexp data in mainhand.
# This dispatcher delegates full component application per item type.

execute if items entity @s weapon.mainhand bow unless data entity @s SelectedItem.components."minecraft:custom_data".vexp run function vexp:dungeons/handle_new_weapons/macro/apply_bow

execute if items entity @s weapon.mainhand #swords unless data entity @s SelectedItem.components."minecraft:custom_data".vexp run function vexp:dungeons/handle_new_weapons/macro/apply_sword
execute if items entity @s weapon.mainhand #spears unless data entity @s SelectedItem.components."minecraft:custom_data".vexp run function vexp:dungeons/handle_new_weapons/macro/apply_spear
execute if items entity @s weapon.mainhand #axes unless data entity @s SelectedItem.components."minecraft:custom_data".vexp run function vexp:dungeons/handle_new_weapons/macro/apply_axe
execute if items entity @s weapon.mainhand #pickaxes unless data entity @s SelectedItem.components."minecraft:custom_data".vexp run function vexp:dungeons/handle_new_weapons/macro/apply_pickaxe
execute if items entity @s weapon.mainhand #shovels unless data entity @s SelectedItem.components."minecraft:custom_data".vexp run function vexp:dungeons/handle_new_weapons/macro/apply_shovel
execute if items entity @s weapon.mainhand #hoes unless data entity @s SelectedItem.components."minecraft:custom_data".vexp run function vexp:dungeons/handle_new_weapons/macro/apply_hoe

execute if items entity @s weapon.mainhand #trimmable_armor unless data entity @s SelectedItem.components."minecraft:custom_data".vexp run function vexp:dungeons/handle_new_weapons/macro/apply_armor
