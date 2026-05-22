# Refresca el visual del item que esta sobre la tabla

function vexp:custom_block/blocks/cutting_board/clear_item_visual

scoreboard players operation #temp vexp.id = @s vexp.id
data remove storage vexp:custom_block cutting_board_visual_item
execute if data entity @s data.vexp.board_item run data modify storage vexp:custom_block cutting_board_visual_item set from entity @s data.vexp.board_item

execute if data entity @s data.vexp.board_item at @s run summon item_display ~ ~ ~ {Tags:["vexp.cutting_board.item","vexp.cutting_board.new"],item:{id:"minecraft:stone",count:1},transformation:{translation:[0f,0.075f,0f],scale:[0.62f,0.62f,0.62f],left_rotation:[1f,0f,0f,1f],right_rotation:[0f,0f,0f,1f]},teleport_duration:1,interpolation_duration:1}
execute if data storage vexp:custom_block cutting_board_visual_item as @e[type=item_display,tag=vexp.cutting_board.new,sort=nearest,limit=1,distance=..1] run scoreboard players operation @s vexp.id = #temp vexp.id
execute if data storage vexp:custom_block cutting_board_visual_item as @e[type=item_display,tag=vexp.cutting_board.new,sort=nearest,limit=1,distance=..1] run data modify entity @s item set from storage vexp:custom_block cutting_board_visual_item
tag @e[type=item_display,tag=vexp.cutting_board.new] remove vexp.cutting_board.new
