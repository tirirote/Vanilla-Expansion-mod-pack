# dungeons/lore/detect_armor.mcfunction
# Detect equipped and selected custom armor pieces that still need lore.

execute as @a if items entity @s armor.head *[custom_data~{vexp:{item:"armor",armor:{stats:{}}}}] unless items entity @s armor.head *[custom_data~{vexp:{lore_applied:1b}}] run function vexp:dungeons/lore/apply_armor_head
execute as @a if items entity @s armor.chest *[custom_data~{vexp:{item:"armor",armor:{stats:{}}}}] unless items entity @s armor.chest *[custom_data~{vexp:{lore_applied:1b}}] run function vexp:dungeons/lore/apply_armor_chest
execute as @a if items entity @s armor.legs *[custom_data~{vexp:{item:"armor",armor:{stats:{}}}}] unless items entity @s armor.legs *[custom_data~{vexp:{lore_applied:1b}}] run function vexp:dungeons/lore/apply_armor_legs
execute as @a if items entity @s armor.feet *[custom_data~{vexp:{item:"armor",armor:{stats:{}}}}] unless items entity @s armor.feet *[custom_data~{vexp:{lore_applied:1b}}] run function vexp:dungeons/lore/apply_armor_feet
execute as @a if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"armor",armor:{stats:{}}} unless data entity @s SelectedItem.components."minecraft:custom_data".vexp{lore_applied:1b} run function vexp:dungeons/lore/apply_armor_selected
