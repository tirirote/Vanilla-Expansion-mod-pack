# On swoosh custom hook wrapper

#1. If holding spellbook in offhand, use spellbook data
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem run function vexp:dungeons/combo_system/hooks/swoosh/route_on_swoosh with entity @s equipment.offhand.components."minecraft:custom_data".vexp

#2. If holding spellbook in offhand, and other thing in mainhand, use mainhand data
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} if data entity @s SelectedItem run function vexp:dungeons/combo_system/hooks/swoosh/route_on_swoosh with entity @s SelectedItem.components."minecraft:custom_data".vexp

# 3. If not spellbook in offhand, use mainhand data
execute unless data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} run function vexp:dungeons/combo_system/hooks/swoosh/route_on_swoosh with entity @s SelectedItem.components."minecraft:custom_data".vexp
