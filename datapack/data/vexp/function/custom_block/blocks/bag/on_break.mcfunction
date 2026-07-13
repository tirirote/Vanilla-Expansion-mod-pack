# On break hook
# @s is the interaction

data modify entity @s data.vexp.model set value "vexp:bag"

# Drop por loop
execute store result score #bag_items vexp.math run data get entity @s data.vexp.item_count
execute if data entity @s data.vexp.bag_item_id if score #bag_items vexp.math matches 1.. run function vexp:custom_block/blocks/bag/drop_items_loop
