# dungeons/reforge/internal/apply_tool_stats.mcfunction
# @s is player. storage vexp:temp reforge_apply contains item data.

# Capture base stats
execute store result score #rf_def vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_armor.stats.defense 10
execute store result score #rf_dmg vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_armor.stats.damage 10
execute store result score #rf_spd vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_armor.stats.speed 10
execute store result score #rf_tough vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_armor.stats.toughness 10
execute store result score #rf_knockb vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_armor.stats.knockback_resistance 10

# Capture mods
execute store result score #rf_def_mod vexp.math run data get storage vexp:temp reforge_apply.mods.defense 10
execute store result score #rf_dmg_mod vexp.math run data get storage vexp:temp reforge_apply.mods.damage 10
execute store result score #rf_spd_mod vexp.math run data get storage vexp:temp reforge_apply.mods.speed 10
execute store result score #rf_tough_mod vexp.math run data get storage vexp:temp reforge_apply.mods.toughness 10
execute store result score #rf_knockb_mod vexp.math run data get storage vexp:temp reforge_apply.mods.knockback 10

# Operation
scoreboard players operation #rf_def vexp.math += #rf_def_mod vexp.math
scoreboard players operation #rf_dmg vexp.math += #rf_dmg_mod vexp.math
scoreboard players operation #rf_spd vexp.math += #rf_spd_mod vexp.math
scoreboard players operation #rf_tough vexp.math += #rf_tough_mod vexp.math
scoreboard players operation #rf_knockb vexp.math += #rf_knockb_mod vexp.math

# Write back to custom_data
execute store result storage vexp:temp reforge_apply.custom_data.vexp.armor.stats.defense float 0.1 run scoreboard players get #rf_def vexp.math
execute store result storage vexp:temp reforge_apply.custom_data.vexp.armor.stats.damage float 0.1 run scoreboard players get #rf_dmg vexp.math
execute store result storage vexp:temp reforge_apply.custom_data.vexp.armor.stats.speed float 0.1 run scoreboard players get #rf_tough vexp.math
execute store result storage vexp:temp reforge_apply.custom_data.vexp.armor.stats.toughness float 0.1 run scoreboard players get #tough vexp.math
execute store result storage vexp:temp reforge_apply.custom_data.vexp.armor.stats.knockback_resistance float 0.1 run scoreboard players get #knockb vexp.math
