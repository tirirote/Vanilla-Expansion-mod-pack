# dungeons/lore/apply_tool_current.mcfunction
# @s is the player holding the tool in main hand.

# Default lore payload for tools.
data modify storage vexp:temp lore_apply_tool set value {desc:"Herramienta personalizada",efficiency:1,durability:0,damage:1,attack_speed:1}

# Optional custom descriptors for tools.
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.desc run data modify storage vexp:temp lore_apply_tool.desc set from entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.desc

# Optional tool-specific stats.
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.efficiency run data modify storage vexp:temp lore_apply_tool.efficiency set from entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.efficiency
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.damage run data modify storage vexp:temp lore_apply_tool.damage set from entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.damage
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.attack_speed run data modify storage vexp:temp lore_apply_tool.attack_speed set from entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.attack_speed
execute if data entity @s SelectedItem.components."minecraft:max_damage" run data modify storage vexp:temp lore_apply_tool.durability set from entity @s SelectedItem.components."minecraft:max_damage"

# Mark as initialized so lore is applied once.
data modify storage vexp:temp lore_apply_tool.custom_data set from entity @s SelectedItem.components."minecraft:custom_data"
data modify storage vexp:temp lore_apply_tool.custom_data.vexp.lore_applied set value 1b

function vexp:dungeons/lore/apply_tool_macro with storage vexp:temp lore_apply_tool
