# Recoger 1 item de la bolsa cuando esta abierta y mano vacia

execute store result score #bag_count vexp.math run data get entity @s data.vexp.item_count
execute unless score #bag_count vexp.math matches 1.. run function vexp:custom_block/macro/sound {sound:"minecraft:block.wool.hit"}
execute unless score #bag_count vexp.math matches 1.. run return fail

summon item ^ ^0.75 ^-0.25 {Tags:["vexp.bag.loot"],Item:{id:"minecraft:stone",count:1}}
execute as @e[type=item,tag=vexp.bag.loot,sort=nearest,limit=1,distance=..1] run data modify entity @s Item.id set from entity @e[type=interaction,tag=vexp.custom_block.interact,sort=nearest,limit=1,distance=..1] data.vexp.bag_item_id
execute as @e[type=item,tag=vexp.bag.loot,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":10,"scale":0.01}
tag @e[type=item,tag=vexp.bag.loot,sort=nearest,limit=1,distance=..1] remove vexp.bag.loot

scoreboard players remove #bag_count vexp.math 1
execute store result entity @s data.vexp.item_count int 1 run scoreboard players get #bag_count vexp.math

# Si queda vacia, limpiar datos y usar modelo abierto base
execute if score #bag_count vexp.math matches ..0 run data modify entity @s data.vexp.item_count set value 0
execute if score #bag_count vexp.math matches ..0 run data modify entity @s data.vexp.bag_item_id set value "none"
execute if score #bag_count vexp.math matches ..0 run data modify entity @s data.vexp.bag_content set value "generic"
execute if score #bag_count vexp.math matches ..0 run data modify entity @s data.vexp.bag_fill_state set value "empty"

execute if score #bag_count vexp.math matches 1.. run function vexp:custom_block/blocks/bag/bag_apply_fill_state
function vexp:custom_block/blocks/bag/bag_apply_display_model
function vexp:custom_block/macro/sound {sound:"minecraft:entity.item.pickup"}
