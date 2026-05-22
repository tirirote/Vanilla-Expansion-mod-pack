# Recupera el item puesto sobre la tabla

execute if data entity @s data.vexp.board_item run data modify storage vexp:custom_block cutting_board_pickup set from entity @s data.vexp.board_item
execute if data entity @s data.vexp.board_item run data remove entity @s data.vexp.board_item

execute if data storage vexp:custom_block cutting_board_pickup at @s run summon item ~ ~0.5 ~ {Tags:["vexp.cutting_board.loot"],PickupDelay:0,Item:{id:"minecraft:stone",count:1}}
execute if data storage vexp:custom_block cutting_board_pickup as @e[type=item,tag=vexp.cutting_board.loot,sort=nearest,limit=1,distance=..1] run data modify entity @s Item set from storage vexp:custom_block cutting_board_pickup
tag @e[type=item,tag=vexp.cutting_board.loot,distance=..1] remove vexp.cutting_board.loot

function vexp:custom_block/blocks/cutting_board/clear_item_visual
execute if data storage vexp:custom_block cutting_board_pickup run function vexp:custom_block/macro/sound {sound:"minecraft:entity.item.pickup"}

data remove storage vexp:custom_block cutting_board_pickup
