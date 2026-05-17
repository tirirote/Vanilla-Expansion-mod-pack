execute if data entity @s data.vexp.pan_item run data modify storage vexp:custom_block frying_pan_pickup set from entity @s data.vexp.pan_item
execute if data entity @s data.vexp.pan_item run data remove entity @s data.vexp.pan_item
execute if data storage vexp:custom_block frying_pan_pickup at @s run summon item ~ ~0.5 ~ {Tags:["vexp.frying_pan.loot"],PickupDelay:0,Item:{id:"minecraft:stone",count:1}}
execute if data storage vexp:custom_block frying_pan_pickup as @e[type=item,tag=vexp.frying_pan.loot,sort=nearest,limit=1,distance=..1] run data modify entity @s Item set from storage vexp:custom_block frying_pan_pickup
tag @e[type=item,tag=vexp.frying_pan.loot,distance=..1] remove vexp.frying_pan.loot

data modify entity @s data.vexp.cook_time set value 0
scoreboard players set @s vexp.cook_time 0
function vexp:custom_block/blocks/frying_pan/clear_item_visual
execute if data storage vexp:custom_block frying_pan_pickup run function vexp:custom_block/macro/sound {sound:"minecraft:entity.item.pickup"}
