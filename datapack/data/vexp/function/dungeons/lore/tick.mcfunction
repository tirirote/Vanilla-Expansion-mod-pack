# dungeons/lore/tick.mcfunction
# Applies lore once when a combo weapon is first held in main hand.

execute as @a if data entity @s SelectedItem.components."minecraft:custom_data".vexp.item if data entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.damage unless data entity @s SelectedItem.components."minecraft:custom_data".vexp.lore_applied run function vexp:dungeons/lore/apply_current
