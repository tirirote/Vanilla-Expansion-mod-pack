# Loop recursivo: droppea los items de bag_break.items hasta vaciarla
# @s is the interaction

execute unless data entity @s data.vexp.bag_item_id run return 0

execute store result score #bag_items_current vexp.math run data get entity @s data.vexp.item_count
execute unless score #bag_items_current vexp.math matches 1.. run return 0

# Dropea 1
function vexp:custom_block/blocks/bag/drop_single_item with entity @s data.vexp

scoreboard players remove #bag_items_current vexp.math 1
execute store result entity @s data.vexp.item_count int 1 run scoreboard players get #bag_items_current vexp.math

execute if score #bag_items_current vexp.math matches 1.. run function vexp:custom_block/blocks/bag/drop_items_loop
