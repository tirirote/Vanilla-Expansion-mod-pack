# Check when a player holds or equips a newly adquired item (not crafted) without vexp data
# @s is the player

# Check main hand
execute unless data entity @s SelectedItem.components."minecraft:custom_data".vexp run function vexp:dungeons/handle_new_weapons/map_items

# Check armor slots
execute unless data entity @s equipment.head.components."minecraft:custom_data".vexp run function vexp:dungeons/handle_new_weapons/map_items
execute unless data entity @s equipment.chest.components."minecraft:custom_data".vexp run function vexp:dungeons/handle_new_weapons/map_items
execute unless data entity @s equipment.legs.components."minecraft:custom_data".vexp run function vexp:dungeons/handle_new_weapons/map_items
execute unless data entity @s equipment.feet.components."minecraft:custom_data".vexp run function vexp:dungeons/handle_new_weapons/map_items
