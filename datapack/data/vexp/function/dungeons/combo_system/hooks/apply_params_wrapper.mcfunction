# dungeons/combo_system/hooks/apply_params_wrapper.mcfunction
# @s is the player (owner)

# Update storage with THIS player's item info to avoid race conditions
data modify storage vexp:main combo_params set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo
data modify storage vexp:main combo_params.item set from entity @s SelectedItem.components."minecraft:custom_data".vexp.item

# Forward to the macro-based apply_params
function vexp:dungeons/combo_system/hooks/apply_params with storage vexp:main combo_params
