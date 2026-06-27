# dungeons/lore/detect_tool.mcfunction
# Detect custom tools in main hand that still need lore updates.

# We filter by items that explicitly have the vexp.tool structure.
execute as @a if data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool unless data entity @s SelectedItem.components."minecraft:custom_data".vexp{lore_applied:1b} run function vexp:dungeons/lore/apply_tool_current
