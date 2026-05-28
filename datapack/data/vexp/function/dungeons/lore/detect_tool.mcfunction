# dungeons/lore/detect_tool.mcfunction
# Detect custom tools in main hand that still need lore.

execute as @a if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"pickaxe"} unless data entity @s SelectedItem.components."minecraft:custom_data".vexp{lore_applied:1b} run function vexp:dungeons/lore/apply_tool_current
execute as @a if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"shovel"} unless data entity @s SelectedItem.components."minecraft:custom_data".vexp{lore_applied:1b} run function vexp:dungeons/lore/apply_tool_current
execute as @a if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"hoe"} unless data entity @s SelectedItem.components."minecraft:custom_data".vexp{lore_applied:1b} run function vexp:dungeons/lore/apply_tool_current
