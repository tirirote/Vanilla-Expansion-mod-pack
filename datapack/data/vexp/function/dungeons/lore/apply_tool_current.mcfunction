# dungeons/lore/apply_tool_current.mcfunction
# @s is the player holding the tool in main hand.

# Default descriptor lines.
data modify storage vexp:temp lore_apply_tool set value {desc:"Herramienta personalizada", rc_desc:"Habilidad personalizada", bonus_desc:"Bonus de herramienta", status_desc:"Estado personalizado", efficiency:0.0, break_speed:0.0, damage:0.0, attack_speed:1.0}

# Optional custom descriptors for tools.
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.desc run data modify storage vexp:temp lore_apply_tool.desc set from entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.desc

# Apply Ability desc.
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.rc_desc run data modify storage vexp:temp lore_apply_tool.rc_desc set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.rc_desc

# Apply Bonus desc.
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.bonus_desc run data modify storage vexp:temp lore_apply_tool.bonus_desc set from entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.bonus_desc

# Apply Status desc.
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.status_desc run data modify storage vexp:temp lore_apply_tool.status_desc set from entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.status_desc

# Optional tool-specific stats.
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.efficiency run data modify storage vexp:temp lore_apply_tool.efficiency set from entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.efficiency
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.damage run data modify storage vexp:temp lore_apply_tool.damage set from entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.damage
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.break_speed run data modify storage vexp:temp lore_apply_tool.break_speed set from entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.break_speed
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.attack_speed run data modify storage vexp:temp lore_apply_tool.attack_speed set from entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.attack_speed

# Cooldown calculation
data remove storage vexp:temp lore_apply_tool.right_click_cooldown
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.right_click_cooldown run data modify storage vexp:temp lore_apply_tool.right_click_cooldown set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.right_click_cooldown

scoreboard players set #const_ten vexp.math 10
scoreboard players set #const_twenty vexp.math 20

execute store result score #rc_ticks vexp.math run data get storage vexp:temp lore_apply_tool.right_click_cooldown 1
scoreboard players operation #rc_tenths vexp.math = #rc_ticks vexp.math
scoreboard players operation #rc_tenths vexp.math *= #const_ten vexp.math
scoreboard players operation #rc_tenths vexp.math /= #const_twenty vexp.math
scoreboard players operation #rc_sec_int vexp.math = #rc_tenths vexp.math
scoreboard players operation #rc_sec_int vexp.math /= #const_ten vexp.math
scoreboard players operation #rc_sec_dec vexp.math = #rc_tenths vexp.math
scoreboard players operation #rc_sec_dec vexp.math %= #const_ten vexp.math
execute store result storage vexp:temp lore_apply_tool.right_click_cooldown_sec_int int 1 run scoreboard players get #rc_sec_int vexp.math
execute store result storage vexp:temp lore_apply_tool.right_click_cooldown_sec_dec int 1 run scoreboard players get #rc_sec_dec vexp.math

# Reforge display counters
scoreboard players set #rf_uses vexp.math 0
scoreboard players set #rf_max vexp.math 3
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.reforge.uses store result score #rf_uses vexp.math run data get entity @s SelectedItem.components."minecraft:custom_data".vexp.reforge.uses 1
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.reforge.max_uses store result score #rf_max vexp.math run data get entity @s SelectedItem.components."minecraft:custom_data".vexp.reforge.max_uses 1
scoreboard players operation #rf_left vexp.math = #rf_max vexp.math
scoreboard players operation #rf_left vexp.math -= #rf_uses vexp.math
execute if score #rf_left vexp.math matches ..-1 run scoreboard players set #rf_left vexp.math 0
execute store result storage vexp:temp lore_apply_tool.reforge_left int 1 run scoreboard players get #rf_left vexp.math
execute store result storage vexp:temp lore_apply_tool.reforge_max int 1 run scoreboard players get #rf_max vexp.math

# Initialize custom_data
data modify storage vexp:temp lore_apply_tool.custom_data set from entity @s SelectedItem.components."minecraft:custom_data"
data modify storage vexp:temp lore_apply_tool.custom_data.vexp.lore_applied set value 1b

# Choose macro by fields availability
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.bonus_desc if data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.status_desc run function vexp:dungeons/lore/apply_tool_macro_bonus_status with storage vexp:temp lore_apply_tool
execute if data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.bonus_desc unless data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.status_desc run function vexp:dungeons/lore/apply_tool_macro_bonus with storage vexp:temp lore_apply_tool
execute unless data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.bonus_desc run function vexp:dungeons/lore/apply_tool_macro with storage vexp:temp lore_apply_tool
