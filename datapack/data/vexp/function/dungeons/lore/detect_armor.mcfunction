# dungeons/lore/detect_armor.mcfunction
# Detect equipped and selected custom armor pieces that still need lore.

execute if items entity @s armor.head #head_armor[minecraft:custom_data~{vexp:{item:"armor"}}] unless data entity @s equipment.head.components."minecraft:custom_data".vexp{lore_applied:1b} run function vexp:dungeons/lore/apply_armor_head
execute if items entity @s armor.chest #chest_armor[minecraft:custom_data~{vexp:{item:"armor"}}] unless data entity @s equipment.chest.components."minecraft:custom_data".vexp{lore_applied:1b} run function vexp:dungeons/lore/apply_armor_chest
execute if items entity @s armor.legs #leg_armor[minecraft:custom_data~{vexp:{item:"armor"}}] unless data entity @s equipment.legs.components."minecraft:custom_data".vexp{lore_applied:1b} run function vexp:dungeons/lore/apply_armor_legs
execute if items entity @s armor.feet #foot_armor[minecraft:custom_data~{vexp:{item:"armor"}}] unless data entity @s equipment.feet.components."minecraft:custom_data".vexp{lore_applied:1b} run function vexp:dungeons/lore/apply_armor_feet
execute if items entity @s weapon.mainhand #trimmable_armor[minecraft:custom_data~{vexp:{item:"armor"}}] unless data entity @s SelectedItem.components."minecraft:custom_data".vexp{lore_applied:1b} run function vexp:dungeons/lore/apply_armor_selected
