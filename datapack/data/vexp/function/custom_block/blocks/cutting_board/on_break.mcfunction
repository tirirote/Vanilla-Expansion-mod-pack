# Soltar item interno si existe

data remove storage vexp:custom_block cutting_board_break_item
execute if data entity @s data.vexp.board_item run data modify storage vexp:custom_block cutting_board_break_item set from entity @s data.vexp.board_item
execute if data entity @s data.vexp.board_item at @s run summon item ~ ~ ~ {Tags:["vexp.cutting_board.loot"],Item:{id:"minecraft:stone",count:1}}
execute if data storage vexp:custom_block cutting_board_break_item as @e[type=item,tag=vexp.cutting_board.loot,sort=nearest,limit=1,distance=..1] run data modify entity @s Item set from storage vexp:custom_block cutting_board_break_item
execute as @e[type=item,tag=vexp.cutting_board.loot,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":100,"scale":0.001}
tag @e[type=item,tag=vexp.cutting_board.loot,sort=nearest,limit=1,distance=..1] remove vexp.cutting_board.loot

# Limpiar visual interno
function vexp:custom_block/blocks/cutting_board/clear_item_visual
