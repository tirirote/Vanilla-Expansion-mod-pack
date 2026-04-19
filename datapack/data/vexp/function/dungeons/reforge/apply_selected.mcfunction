# Requires temporary pending marker in mainhand lore.

# Safety guards.
data remove storage vexp:temp reforge_check
execute if data entity @s SelectedItem.components."minecraft:lore"[0] run data modify storage vexp:temp reforge_check.line0 set from entity @s SelectedItem.components."minecraft:lore"[0]
execute unless data storage vexp:temp reforge_check{line0:{text:"Reforja pendiente"}} run return 0
execute unless data entity @s SelectedItem.components."minecraft:custom_data".vexp.item run return 0
execute unless data entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.damage run return 0

# Snapshot current custom_data.
data remove storage vexp:temp reforge_apply
data modify storage vexp:temp reforge_apply.custom_data set from entity @s SelectedItem.components."minecraft:custom_data"

# Initialize reforge metadata (first reforge keeps immutable base stats + name).
execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge run data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge set value {}
data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.item_type set from storage vexp:temp reforge_apply.custom_data.vexp.item
execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge.uses run data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.uses set value 0
execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge.max_uses run data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.max_uses set value 3
execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_combo run data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_combo set from storage vexp:temp reforge_apply.custom_data.vexp.combo
execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_name run data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_name set from entity @s SelectedItem.components."minecraft:item_name".text
execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_name if data entity @s SelectedItem.components."minecraft:item_name" run data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_name set from entity @s SelectedItem.components."minecraft:item_name"
execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_name run data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_name set value "Arma"

# Break if trying to reforge above max uses (3).
execute if data storage vexp:temp reforge_apply.custom_data.vexp.reforge{uses:3} run function vexp:dungeons/reforge/break_selected
execute if data storage vexp:temp reforge_apply.custom_data.vexp.reforge{uses:3} run return 0

# Choose random variant by weapon class and apply deltas.
function vexp:dungeons/reforge/choose_variant

# Increment uses.
execute store result score #rf_uses vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.uses 1
scoreboard players add #rf_uses vexp.math 1
execute store result storage vexp:temp reforge_apply.custom_data.vexp.reforge.uses int 1 run scoreboard players get #rf_uses vexp.math

# Recompute combo from immutable base stats + variant mods.
execute store result score #rf_damage vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_combo.damage 1
execute store result score #rf_cooldown vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_combo.cooldown 1
execute store result score #rf_reach vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_combo.reach 10
execute store result score #rf_range vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_combo.range 10

execute store result score #rf_mod_damage vexp.math run data get storage vexp:temp reforge_apply.mods.damage 1
execute store result score #rf_mod_cooldown vexp.math run data get storage vexp:temp reforge_apply.mods.cooldown 1
execute store result score #rf_mod_reach vexp.math run data get storage vexp:temp reforge_apply.mods.reach 10
execute store result score #rf_mod_range vexp.math run data get storage vexp:temp reforge_apply.mods.range 10

scoreboard players operation #rf_damage vexp.math += #rf_mod_damage vexp.math
scoreboard players operation #rf_cooldown vexp.math += #rf_mod_cooldown vexp.math
scoreboard players operation #rf_reach vexp.math += #rf_mod_reach vexp.math
scoreboard players operation #rf_range vexp.math += #rf_mod_range vexp.math

# Never allow attack combo cooldown <= 0.
execute if score #rf_cooldown vexp.math matches ..0 run scoreboard players set #rf_cooldown vexp.math 1

execute store result storage vexp:temp reforge_apply.custom_data.vexp.combo.damage int 1 run scoreboard players get #rf_damage vexp.math
execute store result storage vexp:temp reforge_apply.custom_data.vexp.combo.cooldown int 1 run scoreboard players get #rf_cooldown vexp.math
execute store result storage vexp:temp reforge_apply.custom_data.vexp.combo.reach float 0.1 run scoreboard players get #rf_reach vexp.math
execute store result storage vexp:temp reforge_apply.custom_data.vexp.combo.range float 0.1 run scoreboard players get #rf_range vexp.math

# Right-click cooldown is intentionally untouched.

# Force lore rebuild with updated stats and rename item as: "Variante NombreBase".
data remove storage vexp:temp reforge_apply.custom_data.vexp.lore_applied
data modify storage vexp:temp reforge_apply.base_name set from storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_name
execute unless data storage vexp:temp reforge_apply.base_name run data modify storage vexp:temp reforge_apply.base_name set value "Arma"
function vexp:dungeons/reforge/update_name_and_data_macro with storage vexp:temp reforge_apply

function vexp:utils/sound {sound:"minecraft:block.amethyst_block.chime", type:"player"}
