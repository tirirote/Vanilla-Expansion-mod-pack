# On break hook
# @s is the interaction

data modify entity @s data.vexp.model set value "vexp:bag"
data modify entity @s data.vexp.lore set value [{"text":"Vacía","color":"gray","italic":false}]

execute store result score #bag_items vexp.math run data get entity @s data.vexp.item_count

# Drop de la bolsa abierta
# 1. Drop en bucle de items
execute if entity @s[tag=vexp.bag_opened] if data entity @s data.vexp.bag_item_id if score #bag_items vexp.math matches 1.. run function vexp:custom_block/blocks/bag/drop_items_loop
# 2. Dropea la bolsa
execute if entity @s[tag=vexp.bag_opened] run data modify entity @s data.vexp.bag_fill_state set value "empty"
execute if entity @s[tag=vexp.bag_opened] run data modify entity @s data.vexp.bag_content set value "generic"
execute if entity @s[tag=vexp.bag_opened] run data modify entity @s data.vexp.bag_item_id set value "none"

execute if entity @s[tag=vexp.bag_opened] run function vexp:custom_block/blocks/bag/drop_bag with entity @s data.vexp

# Drop de la bolsa cerrada
# 1. Update del lore
execute unless entity @s[tag=vexp.bag_opened] if data entity @s data.vexp.bag_item_id if score #bag_items vexp.math matches 1.. run function vexp:custom_block/blocks/bag/update_bag_lore with entity @s data.vexp
# 2. Dropea la bolsa
execute unless entity @s[tag=vexp.bag_opened] run function vexp:custom_block/blocks/bag/drop_bag with entity @s data.vexp
