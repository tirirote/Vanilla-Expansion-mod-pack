# dungeons/reforge/internal/apply_tool_stats.mcfunction
# @s is player. storage vexp:temp reforge_apply contains item data.

# Capture base stats
execute store result score #rf_eff vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_tool.efficiency 10

# Capture mods
execute store result score #rf_mod_eff vexp.math run data get storage vexp:temp reforge_apply.mods.efficiency 10

# Operation
scoreboard players operation #rf_eff vexp.math += #rf_mod_eff vexp.math

# Write back to custom_data
execute store result storage vexp:temp reforge_apply.custom_data.vexp.tool.efficiency float 0.1 run scoreboard players get #rf_eff vexp.math
