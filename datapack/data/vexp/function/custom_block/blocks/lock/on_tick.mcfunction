# on_tick.mcfunction
# Ejecutar AS la interaction del candado.

# 1) Validar que el objetivo siga existiendo. Si no, dropear candado.
execute if data entity @s data.vexp{target_type:"container",target_offset:"east"} unless block ~1 ~ ~ #vexp:lock_containers run function vexp:custom_block/break with entity @s data.vexp
execute if data entity @s data.vexp{target_type:"container",target_offset:"west"} unless block ~-1 ~ ~ #vexp:lock_containers run function vexp:custom_block/break with entity @s data.vexp
execute if data entity @s data.vexp{target_type:"container",target_offset:"south"} unless block ~ ~ ~1 #vexp:lock_containers run function vexp:custom_block/break with entity @s data.vexp
execute if data entity @s data.vexp{target_type:"container",target_offset:"north"} unless block ~ ~ ~-1 #vexp:lock_containers run function vexp:custom_block/break with entity @s data.vexp
execute if data entity @s data.vexp{target_type:"container",target_offset:"self"} unless block ~1 ~ ~ #vexp:lock_containers unless block ~-1 ~ ~ #vexp:lock_containers unless block ~ ~ ~1 #vexp:lock_containers unless block ~ ~ ~-1 #vexp:lock_containers run function vexp:custom_block/break with entity @s data.vexp

execute if data entity @s data.vexp{target_type:"door",target_offset:"east"} unless block ~1 ~ ~ #minecraft:doors unless block ~1 ~-1 ~ #minecraft:doors unless block ~1 ~1 ~ #minecraft:doors run function vexp:custom_block/break with entity @s data.vexp
execute if data entity @s data.vexp{target_type:"door",target_offset:"west"} unless block ~-1 ~ ~ #minecraft:doors unless block ~-1 ~-1 ~ #minecraft:doors unless block ~-1 ~1 ~ #minecraft:doors run function vexp:custom_block/break with entity @s data.vexp
execute if data entity @s data.vexp{target_type:"door",target_offset:"south"} unless block ~ ~ ~1 #minecraft:doors unless block ~ ~-1 ~1 #minecraft:doors unless block ~ ~1 ~1 #minecraft:doors run function vexp:custom_block/break with entity @s data.vexp
execute if data entity @s data.vexp{target_type:"door",target_offset:"north"} unless block ~ ~ ~-1 #minecraft:doors unless block ~ ~-1 ~-1 #minecraft:doors unless block ~ ~1 ~-1 #minecraft:doors run function vexp:custom_block/break with entity @s data.vexp

# 2) Si es puerta vanilla, validar llave en mano de jugadores cercanos.
tag @s remove vexp.lock_has_key
tag @s add vexp.lock_checking
execute if data entity @s data.vexp{target_type:"door"} unless data entity @s data.vexp{key_name:""} run function vexp:custom_block/blocks/lock/check_player_key_macro with entity @s data.vexp

# 3) Si la puerta está abierta y no hay llave correcta cerca, forzar cierre respetando facing y hinge.
execute if data entity @s data.vexp{target_type:"door"} unless entity @s[tag=vexp.lock_has_key] positioned ~ ~ ~1 run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute if data entity @s data.vexp{target_type:"door"} unless entity @s[tag=vexp.lock_has_key] positioned ~ ~ ~-1 run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute if data entity @s data.vexp{target_type:"door"} unless entity @s[tag=vexp.lock_has_key] positioned ~1 ~ ~ run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute if data entity @s data.vexp{target_type:"door"} unless entity @s[tag=vexp.lock_has_key] positioned ~-1 ~ ~ run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute if data entity @s data.vexp{target_type:"door"} unless entity @s[tag=vexp.lock_has_key] positioned ~1 ~ ~1 run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute if data entity @s data.vexp{target_type:"door"} unless entity @s[tag=vexp.lock_has_key] positioned ~1 ~ ~-1 run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute if data entity @s data.vexp{target_type:"door"} unless entity @s[tag=vexp.lock_has_key] positioned ~-1 ~ ~1 run function vexp:custom_block/blocks/lock/force_close_vanilla_door
execute if data entity @s data.vexp{target_type:"door"} unless entity @s[tag=vexp.lock_has_key] positioned ~-1 ~ ~-1 run function vexp:custom_block/blocks/lock/force_close_vanilla_door

# 4) Ajustar visual del candado según estado real de la puerta (sin interpolación).
scoreboard players operation #lock_owner_id vexp.id = @s vexp.id

tag @s remove vexp.lock_door_open
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

execute if data entity @s data.vexp{target_type:"door"} as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s interpolation_duration set value 0
execute if data entity @s data.vexp{target_type:"door"} as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s start_interpolation set value 0

# Cerrada (mismo offset para delante y detrás)
# Parte de abajo
execute if data entity @s data.vexp{target_type:"door"} unless entity @s[tag=vexp.lock_hinge_right] unless entity @s[tag=vexp.lock_door_upper] unless entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.translation set value [-0.25f,0.75f,0f]
execute if data entity @s data.vexp{target_type:"door"} unless entity @s[tag=vexp.lock_hinge_right] unless entity @s[tag=vexp.lock_door_upper] unless entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.left_rotation set value [0f,1f,0f,0f]

execute if data entity @s data.vexp{target_type:"door"} if entity @s[tag=vexp.lock_hinge_right] unless entity @s[tag=vexp.lock_door_upper] unless entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.translation set value [0.25f,0.75f,0f]
execute if data entity @s data.vexp{target_type:"door"} if entity @s[tag=vexp.lock_hinge_right] unless entity @s[tag=vexp.lock_door_upper] unless entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.left_rotation set value [0f,1f,0f,0f]

# Parte de arriba
execute if data entity @s data.vexp{target_type:"door"} unless entity @s[tag=vexp.lock_hinge_right] if entity @s[tag=vexp.lock_door_upper] unless entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.translation set value [-0.25f,-0.25f,0f]
execute if data entity @s data.vexp{target_type:"door"} unless entity @s[tag=vexp.lock_hinge_right] if entity @s[tag=vexp.lock_door_upper] unless entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.left_rotation set value [0f,1f,0f,0f]

execute if data entity @s data.vexp{target_type:"door"} if entity @s[tag=vexp.lock_hinge_right] if entity @s[tag=vexp.lock_door_upper] unless entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.translation set value [0.25f,-0.25f,0f]
execute if data entity @s data.vexp{target_type:"door"} if entity @s[tag=vexp.lock_hinge_right] if entity @s[tag=vexp.lock_door_upper] unless entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.left_rotation set value [0f,1f,0f,0f]

# Abierta (mismo offset para delante y detrás)
# Parte de abajo
execute if data entity @s data.vexp{target_type:"door"} unless entity @s[tag=vexp.lock_hinge_right] unless entity @s[tag=vexp.lock_door_upper] if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.translation set value [0.3f,0.75f,0.75f]
execute if data entity @s data.vexp{target_type:"door"} unless entity @s[tag=vexp.lock_hinge_right] unless entity @s[tag=vexp.lock_door_upper] if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.left_rotation set value [0f,-1f,0f,1f]

execute if data entity @s data.vexp{target_type:"door"} if entity @s[tag=vexp.lock_hinge_right] unless entity @s[tag=vexp.lock_door_upper] if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.translation set value [-0.3f,0.75f,0.75f]
execute if data entity @s data.vexp{target_type:"door"} if entity @s[tag=vexp.lock_hinge_right] unless entity @s[tag=vexp.lock_door_upper] if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.left_rotation set value [0f,1f,0f,1f]

# Parte de arriba
execute if data entity @s data.vexp{target_type:"door"} unless entity @s[tag=vexp.lock_hinge_right] if entity @s[tag=vexp.lock_door_upper] if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.translation set value [0.3f,-0.25f,0.75f]
execute if data entity @s data.vexp{target_type:"door"} unless entity @s[tag=vexp.lock_hinge_right] if entity @s[tag=vexp.lock_door_upper] if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.left_rotation set value [0f,-1f,0f,1f]

execute if data entity @s data.vexp{target_type:"door"} if entity @s[tag=vexp.lock_hinge_right] if entity @s[tag=vexp.lock_door_upper] if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.translation set value [-0.3f,-0.25f,0.75f]
execute if data entity @s data.vexp{target_type:"door"} if entity @s[tag=vexp.lock_hinge_right] if entity @s[tag=vexp.lock_door_upper] if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s transformation.left_rotation set value [0f,1f,0f,1f]

tag @s remove vexp.lock_checking
