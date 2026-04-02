# dungeons/combo_system/hooks/apply_params_wrapper.mcfunction
# @s is the player (owner)

# Update storage with THIS player's item info to avoid race conditions
data modify storage vexp:dungeons.weapon combo_params set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo
data modify storage vexp:dungeons.weapon combo_params.item set from entity @s SelectedItem.components."minecraft:custom_data".vexp.item
data modify storage vexp:dungeons.weapon combo_params.type set from entity @s SelectedItem.components."minecraft:custom_data".vexp.type
data modify storage vexp:dungeons.weapon combo_params.quality set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.quality

# Compute effective damage and cooldown accounting for vanilla effects
function vexp:dungeons/combo_system/hooks/compute_effects

# Forward to the macro-based apply_params
function vexp:dungeons/combo_system/hooks/apply_params with storage vexp:dungeons.weapon combo_params
