# dungeons/lore/detect_weapon.mcfunction
# Detect custom weapons in main hand that still need lore updates.

# We trigger if it has combo data BUT ONLY if it is not a tool.
execute as @a if data entity @s SelectedItem.components."minecraft:custom_data".vexp.combo unless data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool unless data entity @s SelectedItem.components."minecraft:custom_data".vexp{lore_applied:1b} run function vexp:dungeons/lore/apply_current
