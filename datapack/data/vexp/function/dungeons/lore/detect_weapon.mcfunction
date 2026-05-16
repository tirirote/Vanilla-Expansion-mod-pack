# dungeons/lore/detect_weapon.mcfunction
# Detect custom weapons in main hand that still need lore.

execute as @a if data entity @s SelectedItem.components."minecraft:custom_data".vexp.item if data entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.damage unless data entity @s SelectedItem.components."minecraft:custom_data".vexp.lore_applied run function vexp:dungeons/lore/apply_current
