# Force vanilla door
execute if block ~ ~ ~1 #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute if block ~ ~ ~-1 #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute if block ~1 ~ ~ #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute if block ~-1 ~ ~ #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute if block ~1 ~ ~1 #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute if block ~1 ~ ~-1 #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute if block ~-1 ~ ~1 #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute if block ~-1 ~ ~-1 #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
