# dungeons/combo_system/hooks/apply_params_wrapper.mcfunction
# @s is the player (owner)

# Update storage with THIS player's item info to avoid race conditions
data modify storage vexp:main combo_params set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo
data modify storage vexp:main combo_params.item set from entity @s SelectedItem.components."minecraft:custom_data".vexp.item
data modify storage vexp:main combo_params.type set from entity @s SelectedItem.components."minecraft:custom_data".vexp.type
data modify storage vexp:main combo_params.quality set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.quality

# Legacy fallback: older items may store quality at vexp.quality
execute unless data storage vexp:main combo_params{quality:"normal"} unless data storage vexp:main combo_params{quality:"netherite"} unless data storage vexp:main combo_params{quality:"echo"} unless data storage vexp:main combo_params{quality:"amethyst"} run data modify storage vexp:main combo_params.quality set from entity @s SelectedItem.components."minecraft:custom_data".vexp.quality


# Forward to the macro-based apply_params
function vexp:dungeons/combo_system/hooks/apply_params with storage vexp:main combo_params
