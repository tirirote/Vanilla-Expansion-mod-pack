# Check when a player holds a newly acquired item in mainhand without vexp data
# @s is the player

# Check main hand
execute if items entity @s weapon.mainhand * unless data entity @s SelectedItem.components."minecraft:custom_data".vexp run function vexp:dungeons/handle_new_weapons/map_items

# Check equipped armor slots
execute if items entity @s armor.* #trimmable_armor run function vexp:dungeons/handle_new_weapons/check_new_armor_slots
