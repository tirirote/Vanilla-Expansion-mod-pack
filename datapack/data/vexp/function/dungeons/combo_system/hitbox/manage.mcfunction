# dungeons/combo_system/hitbox/manage.mcfunction

# Assign player ID if missing
execute if score @s vexp.id matches 0 run function vexp:utils/assign_id

# Check for combo item
tag @s remove vexp.combo_user

execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} if items entity @s weapon.offhand *[custom_data~{vexp:{type:"short_combo"}}] unless data entity @s SelectedItem run tag @s add vexp.combo_user
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} if items entity @s weapon.offhand *[custom_data~{vexp:{type:"mid_combo"}}] unless data entity @s SelectedItem run tag @s add vexp.combo_user
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} if items entity @s weapon.offhand *[custom_data~{vexp:{type:"long_combo"}}] unless data entity @s SelectedItem run tag @s add vexp.combo_user

execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"spellbook"} if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"short_combo"}}] run tag @s add vexp.combo_user
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"spellbook"} if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"mid_combo"}}] run tag @s add vexp.combo_user
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"spellbook"} if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"long_combo"}}] run tag @s add vexp.combo_user

execute unless data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"spellbook"} if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"short_combo"}}] run tag @s add vexp.combo_user
execute unless data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"spellbook"} if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"mid_combo"}}] run tag @s add vexp.combo_user
execute unless data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"spellbook"} if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"long_combo"}}] run tag @s add vexp.combo_user

# If holding, summon/update hitbox (ensure 'at @s' for proper summoning)
# During hide timer, skip hitbox so right-click can show vanilla item use animation.
execute if entity @s[tag=vexp.combo_user] unless score @s vexp.hitbox_hide_timer matches 1.. at @s positioned ~ ~1 ~ run function vexp:dungeons/combo_system/hitbox/update
