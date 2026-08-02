# dungeons/combo_system/hitbox/update.mcfunction
# @s is the player (owner)

# Evaluate hitbox with mainhand / offhand data

#1. If holding spellbook in offhand, use spellbook data
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem run function vexp:dungeons/combo_system/hitbox/evaluate_summon with entity @s equipment.offhand.components."minecraft:custom_data".vexp.combo

#2. If holding spellbook in offhand, and other thing in mainhand, use mainhand data
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} if data entity @s SelectedItem run function vexp:dungeons/combo_system/hitbox/evaluate_summon with entity @s SelectedItem.components."minecraft:custom_data".vexp.combo

# 3. If not spellbook in offhand, use mainhand data
execute unless data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} run function vexp:dungeons/combo_system/hitbox/evaluate_summon with entity @s SelectedItem.components."minecraft:custom_data".vexp.combo
