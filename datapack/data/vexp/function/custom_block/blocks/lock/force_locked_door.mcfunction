# Force vanilla door
execute positioned ~ ~ ~ if block ~ ~ ~ #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute positioned ~ ~ ~1 if block ~ ~ ~ #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute positioned ~ ~ ~-1 if block ~ ~ ~ #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute positioned ~1 ~ ~ if block ~ ~ ~ #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute positioned ~1 ~ ~1 if block ~ ~ ~ #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute positioned ~-1 ~ ~ if block ~ ~ ~ #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute positioned ~-1 ~ ~1 if block ~ ~ ~ #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #minecraft:doors[open=true] run function vexp:custom_block/blocks/lock/force_close_vanilla_door
