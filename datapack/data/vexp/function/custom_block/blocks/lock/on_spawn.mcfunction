# on_spawn.mcfunction
# Inicializa datos y vincula el candado al objetivo cercano (puerta o contenedor).

execute unless data entity @s data.vexp.key_name run data modify entity @s data.vexp.key_name set value ""
data modify entity @s data.vexp.target_type set value "none"
data modify entity @s data.vexp.target_offset set value "none"
data modify entity @s data.vexp.door_id set value 0
scoreboard players set #lock_upper vexp.math 0
tag @s remove vexp.lock_door_upper
tag @s remove vexp.lock_hinge_right

tag @s add vexp.lock_new
scoreboard players operation #lock_owner_id vexp.id = @s vexp.id

# Buscar puerta vanilla adyacente.
execute if data entity @s data.vexp{target_type:"none"} run function vexp:custom_block/blocks/lock/store_vanilla_door_target

# Si no se encontro puerta, buscar contenedor vanilla alrededor.
execute if data entity @s data.vexp{target_type:"none"} run function vexp:custom_block/blocks/lock/store_container_target

# Tag si es la parte de arriba de la puerta (usando mount local)
execute if data entity @s data.vexp{target_type:"door",door_mount:"front"} positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[half=upper] run tag @s add vexp.lock_door_upper
execute if data entity @s data.vexp{target_type:"door",door_mount:"front"} positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[half=upper] run tag @s add vexp.lock_door_upper

# Tag si es hinge right (usando mount local)
execute if data entity @s data.vexp{target_type:"door",door_mount:"front"} positioned ^ ^ ^-1 if block ~ ~ ~ #minecraft:doors[hinge=right] run tag @s add vexp.lock_hinge_right
execute if data entity @s data.vexp{target_type:"door",door_mount:"front"} positioned ^ ^ ^-1 if block ~ ~-1 ~ #minecraft:doors[hinge=right] run tag @s add vexp.lock_hinge_right

# Si el lock se colocó sobre la mitad superior, bajar la interacción 1 bloque
# y mantener un único offset visual en el display.
execute if data entity @s data.vexp{target_type:"door"} if entity @s[tag=vexp.lock_door_upper] store result score #lock_y vexp.math run data get entity @s Pos[1] 1000
execute if data entity @s data.vexp{target_type:"door"} if entity @s[tag=vexp.lock_door_upper] run scoreboard players remove #lock_y vexp.math 1000
execute if data entity @s data.vexp{target_type:"door"} if entity @s[tag=vexp.lock_door_upper] store result entity @s Pos[1] double 0.001 run scoreboard players get #lock_y vexp.math

# Dropear si está colocado mal
execute if data entity @s data.vexp{target_type:"none"} if data entity @s data.vexp{target_offset:"none"} run function vexp:custom_block/break with entity @s data.vexp

tag @s remove vexp.lock_new
