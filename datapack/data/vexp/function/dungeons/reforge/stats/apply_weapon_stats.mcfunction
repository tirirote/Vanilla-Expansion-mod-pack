# internal/apply_weapon_stats.mcfunction
# Recalculates combo stats based on immutable base stats + variant modifiers.

# Read base stats
execute store result score #rf_damage vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_combo.damage 1
execute store result score #rf_cooldown vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_combo.cooldown 1
execute store result score #rf_reach vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_combo.reach 10
execute store result score #rf_range vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_combo.range 10

# Read variant modifiers
execute store result score #rf_mod_damage vexp.math run data get storage vexp:temp reforge_apply.mods.damage 1
execute store result score #rf_mod_cooldown vexp.math run data get storage vexp:temp reforge_apply.mods.cooldown 1
execute store result score #rf_mod_reach vexp.math run data get storage vexp:temp reforge_apply.mods.reach 10
execute store result score #rf_mod_range vexp.math run data get storage vexp:temp reforge_apply.mods.range 10

# Apply calculations
scoreboard players operation #rf_damage vexp.math += #rf_mod_damage vexp.math
scoreboard players operation #rf_cooldown vexp.math += #rf_mod_cooldown vexp.math
scoreboard players operation #rf_reach vexp.math += #rf_mod_reach vexp.math
scoreboard players operation #rf_range vexp.math += #rf_mod_range vexp.math

# Safety guard for cooldown
execute if score #rf_cooldown vexp.math matches ..0 run scoreboard players set #rf_cooldown vexp.math 1

# Save back to reforge_apply storage
execute store result storage vexp:temp reforge_apply.custom_data.vexp.combo.damage int 1 run scoreboard players get #rf_damage vexp.math
execute store result storage vexp:temp reforge_apply.custom_data.vexp.combo.cooldown int 1 run scoreboard players get #rf_cooldown vexp.math
execute store result storage vexp:temp reforge_apply.custom_data.vexp.combo.reach float 0.1 run scoreboard players get #rf_reach vexp.math
execute store result storage vexp:temp reforge_apply.custom_data.vexp.combo.range float 0.1 run scoreboard players get #rf_range vexp.math
