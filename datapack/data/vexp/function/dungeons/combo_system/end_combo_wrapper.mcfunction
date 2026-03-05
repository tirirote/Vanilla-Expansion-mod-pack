# Update storage for the current player's item
data modify storage vexp:main combo_params set from entity @s SelectedItem.components."minecraft:custom_data".vexp

# Run end_combo with the item's info
function vexp:dungeons/combo_system/hooks/end_combo with storage vexp:main combo_params
