# Recoger todo el contenido de la bolsa con mano vacia + sneaking

execute unless data entity @s data.vexp.bag_item_id run return fail
execute unless data entity @s data.vexp.item_count run return fail

execute store result score #bag_count vexp.math run data get entity @s data.vexp.item_count
execute unless score #bag_count vexp.math matches 1.. run return fail

summon item ~ ~ ~ {Tags:["vexp.bag.loot"],Item:{id:"minecraft:stone",count:1}}
execute as @e[type=item,tag=vexp.bag.loot,sort=nearest,limit=1,distance=..1] run data modify entity @s Item.id set from entity @e[type=interaction,tag=vexp.custom_block.interact,sort=nearest,limit=1,distance=..1] data.vexp.bag_item_id
execute as @e[type=item,tag=vexp.bag.loot,sort=nearest,limit=1,distance=..1] store result entity @s Item.count byte 1 run scoreboard players get #bag_count vexp.math
execute as @e[type=item,tag=vexp.bag.loot,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":10,"scale":0.01}
tag @e[type=item,tag=vexp.bag.loot,sort=nearest,limit=1,distance=..1] remove vexp.bag.loot

data modify entity @s data.vexp.item_count set value 0
data remove entity @s data.vexp.bag_item_id
data remove entity @s data.vexp.bag_content
data remove entity @s data.vexp.bag_fill_state

function vexp:custom_block/blocks/bag/bag_apply_display_model
function vexp:custom_block/macro/sound {sound:"minecraft:entity.item.pickup"}
