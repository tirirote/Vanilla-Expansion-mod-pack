# dungeons/reforge/internal/apply_tool_stats.mcfunction
# @s is player. storage vexp:temp reforge_apply contains item data.

# Capture base stats
execute store result score #rf_def vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_armor.stats.defense 10
execute store result score #rf_dmg vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_armor.stats.damage 10
execute store result score #rf_tough vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_armor.stats.toughness 10

# Capture mods
execute store result score #rf_def_mod vexp.math run data get storage vexp:temp reforge_apply.mods.defense 10
execute store result score #rf_dmg_mod vexp.math run data get storage vexp:temp reforge_apply.mods.damage 10
execute store result score #rf_tough_mod vexp.math run data get storage vexp:temp reforge_apply.mods.toughness 10

# Operation
scoreboard players operation #rf_def vexp.math += #rf_def_mod vexp.math
scoreboard players operation #rf_dmg vexp.math += #rf_dmg_mod vexp.math
scoreboard players operation #rf_tough vexp.math += #rf_tough_mod vexp.math

# Write back to custom_data
execute store result storage vexp:temp reforge_apply.custom_data.vexp.armor.stats.defense float 0.1 run scoreboard players get #rf_def vexp.math
execute store result storage vexp:temp reforge_apply.custom_data.vexp.armor.stats.damage float 0.1 run scoreboard players get #rf_dmg vexp.math
data modify storage vexp:temp reforge_apply.custom_data.vexp.armor.stats.speed set from storage vexp:temp reforge_apply.mods.speed
execute store result storage vexp:temp reforge_apply.custom_data.vexp.armor.stats.toughness float 0.1 run scoreboard players get #tough vexp.math
data modify storage vexp:temp reforge_apply.custom_data.vexp.armor.stats.knockback_resistance set from storage vexp:temp reforge_apply.mods.knockback
