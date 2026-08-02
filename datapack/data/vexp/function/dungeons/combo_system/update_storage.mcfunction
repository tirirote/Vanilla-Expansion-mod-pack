# Update Storage Once

data remove storage vexp:dungeons.weapon combo_params.right_click_cooldown

#1. If holding spellbook in offhand, use spellbook data
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem run data modify storage vexp:dungeons.weapon combo_params set from entity @s equipment.offhand.components."minecraft:custom_data".vexp.combo
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem run data modify storage vexp:dungeons.weapon combo_params.item set from entity @s equipment.offhand.components."minecraft:custom_data".vexp.item
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem run data modify storage vexp:dungeons.weapon combo_params.type set from entity @s equipment.offhand.components."minecraft:custom_data".vexp.type
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem run data modify storage vexp:dungeons.weapon combo_params.quality set from entity @s equipment.offhand.components."minecraft:custom_data".vexp.combo.quality
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem run data modify storage vexp:dungeons.weapon combo_params.right_click_cooldown set from entity @s equipment.offhand.components."minecraft:custom_data".vexp.combo.right_click_cooldown

#2. If holding spellbook in offhand, and other thing in mainhand, use mainhand data
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} if data entity @s SelectedItem run data modify storage vexp:dungeons.weapon combo_params set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} if data entity @s SelectedItem run data modify storage vexp:dungeons.weapon combo_params.item set from entity @s SelectedItem.components."minecraft:custom_data".vexp.item
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} if data entity @s SelectedItem run data modify storage vexp:dungeons.weapon combo_params.type set from entity @s SelectedItem.components."minecraft:custom_data".vexp.type
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} if data entity @s SelectedItem run data modify storage vexp:dungeons.weapon combo_params.quality set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.quality
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} if data entity @s SelectedItem run data modify storage vexp:dungeons.weapon combo_params.right_click_cooldown set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.right_click_cooldown

# 3. If not spellbook in offhand, use mainhand data
execute unless data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} run data modify storage vexp:dungeons.weapon combo_params set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo
execute unless data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} run data modify storage vexp:dungeons.weapon combo_params.item set from entity @s SelectedItem.components."minecraft:custom_data".vexp.item
execute unless data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} run data modify storage vexp:dungeons.weapon combo_params.type set from entity @s SelectedItem.components."minecraft:custom_data".vexp.type
execute unless data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} run data modify storage vexp:dungeons.weapon combo_params.quality set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.quality
execute unless data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} run data modify storage vexp:dungeons.weapon combo_params.right_click_cooldown set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.right_click_cooldown
