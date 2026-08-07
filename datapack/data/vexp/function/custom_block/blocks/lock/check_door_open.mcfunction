# Check if door opened (only once)
execute if data entity @s data.vexp{target_type:"door"} if block ~1 ~ ~ #minecraft:doors[open=true] run tag @s add vexp.lock_door_open
execute if data entity @s data.vexp{target_type:"door"} if block ~1 ~-1 ~ #minecraft:doors[open=true] run tag @s add vexp.lock_door_open
execute if data entity @s data.vexp{target_type:"door"} if block ~1 ~1 ~ #minecraft:doors[open=true] run tag @s add vexp.lock_door_open
execute if data entity @s data.vexp{target_type:"door"} if block ~-1 ~ ~ #minecraft:doors[open=true] run tag @s add vexp.lock_door_open
execute if data entity @s data.vexp{target_type:"door"} if block ~-1 ~-1 ~ #minecraft:doors[open=true] run tag @s add vexp.lock_door_open
execute if data entity @s data.vexp{target_type:"door"} if block ~-1 ~1 ~ #minecraft:doors[open=true] run tag @s add vexp.lock_door_open
execute if data entity @s data.vexp{target_type:"door"} if block ~ ~ ~1 #minecraft:doors[open=true] run tag @s add vexp.lock_door_open
execute if data entity @s data.vexp{target_type:"door"} if block ~ ~-1 ~1 #minecraft:doors[open=true] run tag @s add vexp.lock_door_open
execute if data entity @s data.vexp{target_type:"door"} if block ~ ~1 ~1 #minecraft:doors[open=true] run tag @s add vexp.lock_door_open
execute if data entity @s data.vexp{target_type:"door"} if block ~ ~ ~-1 #minecraft:doors[open=true] run tag @s add vexp.lock_door_open
execute if data entity @s data.vexp{target_type:"door"} if block ~ ~-1 ~-1 #minecraft:doors[open=true] run tag @s add vexp.lock_door_open
execute if data entity @s data.vexp{target_type:"door"} if block ~ ~1 ~-1 #minecraft:doors[open=true] run tag @s add vexp.lock_door_open

tag @s remove vexp.lock_display_updated
