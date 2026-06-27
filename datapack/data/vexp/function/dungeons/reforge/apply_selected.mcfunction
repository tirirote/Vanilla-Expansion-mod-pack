# Requires temporary pending marker in mainhand lore.

# Safety guards.
data remove storage vexp:temp reforge_check
execute if data entity @s SelectedItem.components."minecraft:lore"[0] run data modify storage vexp:temp reforge_check.line0 set from entity @s SelectedItem.components."minecraft:lore"[0]
execute unless data storage vexp:temp reforge_check{line0:{text:"Reforja pendiente"}} run return fail
execute unless data entity @s SelectedItem.components."minecraft:custom_data".vexp.item run return fail
execute unless data entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.damage unless data entity @s SelectedItem.components."minecraft:custom_data".vexp.tool.efficiency run return 0

# Snapshot current custom_data.
data remove storage vexp:temp reforge_apply
data modify storage vexp:temp reforge_apply.custom_data set from entity @s SelectedItem.components."minecraft:custom_data"

# Initialize reforge metadata (first reforge keeps immutable base stats + name).
execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge run data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge set value {}
data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.item_type set from storage vexp:temp reforge_apply.custom_data.vexp.item
execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge.uses run data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.uses set value 0
execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge.max_uses run data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.max_uses set value 3
execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_combo if data storage vexp:temp reforge_apply.custom_data.vexp.combo run data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_combo set from storage vexp:temp reforge_apply.custom_data.vexp.combo
execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_tool if data storage vexp:temp reforge_apply.custom_data.vexp.tool run data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_tool set from storage vexp:temp reforge_apply.custom_data.vexp.tool
execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_name run data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_name set from entity @s SelectedItem.components."minecraft:item_name".text
execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_name if data entity @s SelectedItem.components."minecraft:item_name" run data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_name set from entity @s SelectedItem.components."minecraft:item_name"
execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_name run data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_name set value "Objeto"

# Break if trying to reforge above max uses (3).
execute if data storage vexp:temp reforge_apply.custom_data.vexp.reforge{uses:3} run function vexp:dungeons/reforge/break_selected
execute if data storage vexp:temp reforge_apply.custom_data.vexp.reforge{uses:3} run return fail

# Choose random variant by weapon class and apply deltas.
function vexp:dungeons/reforge/choose_variant

# Increment uses.
execute store result score #rf_uses vexp.math run data get storage vexp:temp reforge_apply.custom_data.vexp.reforge.uses 1
scoreboard players add #rf_uses vexp.math 1
execute store result storage vexp:temp reforge_apply.custom_data.vexp.reforge.uses int 1 run scoreboard players get #rf_uses vexp.math

# Recompute stats from immutable base stats + variant mods.
execute if data storage vexp:temp reforge_apply.custom_data.vexp.combo run function vexp:dungeons/reforge/stats/apply_weapon_stats
execute if data storage vexp:temp reforge_apply.custom_data.vexp.tool run function vexp:dungeons/reforge/stats/apply_tool_stats

# Force lore rebuild with updated stats and rename item as: "Variante NombreBase".
data remove storage vexp:temp reforge_apply.custom_data.vexp.lore_applied
data modify storage vexp:temp reforge_apply.base_name set from storage vexp:temp reforge_apply.custom_data.vexp.reforge.base_name
execute unless data storage vexp:temp reforge_apply.base_name run data modify storage vexp:temp reforge_apply.base_name set value "Arma"

# Name color by reforge result quality.
data modify storage vexp:temp reforge_apply.color set value "gray"
execute if data storage vexp:temp reforge_apply{variant_key:"damage"} run data modify storage vexp:temp reforge_apply.color set value "yellow"
execute if data storage vexp:temp reforge_apply{variant_key:"speed"} run data modify storage vexp:temp reforge_apply.color set value "aqua"
execute if data storage vexp:temp reforge_apply{variant_key:"balanced"} run data modify storage vexp:temp reforge_apply.color set value "blue"
execute if data storage vexp:temp reforge_apply{variant_key:"bad"} run data modify storage vexp:temp reforge_apply.color set value "red"
execute if data storage vexp:temp reforge_apply{variant_key:"epic"} run data modify storage vexp:temp reforge_apply.color set value "light_purple"
data modify storage vexp:temp reforge_apply.custom_data.vexp.reforge.variant_color set from storage vexp:temp reforge_apply.color

function vexp:dungeons/reforge/update_name_and_data_macro with storage vexp:temp reforge_apply

execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge{uses:3} run function vexp:utils/sound {sound:"minecraft:block.amethyst_block.chime", type:"player"}
execute unless data storage vexp:temp reforge_apply.custom_data.vexp.reforge{uses:3} positioned ^ ^ ^1.5 run particle instant_effect{color:16744174} ~ ~1.4 ~ 0.1 0.1 0.1 0 3
