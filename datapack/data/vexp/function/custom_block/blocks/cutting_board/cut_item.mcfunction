# Intenta cortar el item colocado en la tabla

scoreboard players set #can_cut vexp.math 0
scoreboard players set #did_cut vexp.math 0

function vexp:custom_block/blocks/cutting_board/cuttable_whitelist
execute if score #can_cut vexp.math matches 1.. run function vexp:custom_block/blocks/cutting_board/cut_transform

execute if score #can_cut vexp.math matches 1.. run function vexp:custom_block/blocks/cutting_board/spawn_item_visual
execute if score #can_cut vexp.math matches 1.. run function vexp:custom_block/macro/sound {sound:"minecraft:item.shears.snip"}
execute if score #can_cut vexp.math matches 1.. run particle composter ^ ^0.2 ^ 0.15 0.05 0.15 0 1

# 4. Añadir animación de jitter
execute if score #can_cut vexp.math matches 1.. run tag @s add vexp.block.jitter
execute if score #can_cut vexp.math matches 1.. run scoreboard players set @s vexp.block_anim 10
