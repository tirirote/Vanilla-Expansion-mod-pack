# Update storage with THIS player's item info
data modify storage vexp:main combo_params set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo
data modify storage vexp:main combo_params.item set from entity @s SelectedItem.components."minecraft:custom_data".vexp.item
data modify storage vexp:main combo_params.type set from entity @s SelectedItem.components."minecraft:custom_data".vexp.type
data modify storage vexp:main combo_params.quality set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.quality

# Legacy fallback: older items may store quality at vexp.quality
execute unless data storage vexp:main combo_params{quality:"normal"} unless data storage vexp:main combo_params{quality:"netherite"} unless data storage vexp:main combo_params{quality:"echo"} unless data storage vexp:main combo_params{quality:"amethyst"} run data modify storage vexp:main combo_params.quality set from entity @s SelectedItem.components."minecraft:custom_data".vexp.quality



# Run handle_hit with the item's info
function vexp:dungeons/combo_system/hooks/handle_hit with storage vexp:main combo_params
