# Lock on tick when mounted on door
# on_tick.mcfunction
# Ejecutar AS la interaction del candado.

# 1) Validar que el objetivo siga existiendo. Si no, dropear candado.
execute unless block ^ ^ ^1 #minecraft:doors unless block ^1 ^ ^1 #minecraft:doors unless block ^-1 ^ ^1 #minecraft:doors run function vexp:custom_block/break with entity @s data.vexp

# 2) Si es puerta vanilla, validar llave en mano de jugadores cercanos.
tag @s remove vexp.lock_has_key
tag @s add vexp.lock_checking
execute unless data entity @s data.vexp{key_name:""} run function vexp:custom_block/blocks/lock/check_player_key_macro with entity @s data.vexp

# 3) Si la puerta está abierta y no hay llave correcta cerca, forzar cierre respetando facing y hinge.
execute unless entity @s[tag=vexp.lock_has_key] unless entity @s[tag=vexp.lock_door_open] run function vexp:custom_block/blocks/lock/force_locked_door

# 4) Ajustar visual del candado según estado real de la puerta (sin interpolación).
scoreboard players operation #lock_owner_id vexp.id = @s vexp.id

# Check if door opened (check once)
execute unless entity @s[tag=vexp.lock_door_open] run function vexp:custom_block/blocks/lock/check_door_open
execute if entity @s[tag=vexp.lock_door_open] run function vexp:custom_block/blocks/lock/check_door_close

execute if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s interpolation_duration set value 0
execute if entity @s[tag=vexp.lock_door_open] as @e[type=item_display,tag=vexp.custom_block.display,distance=..2,sort=nearest,limit=1] if score @s vexp.id = #lock_owner_id vexp.id run data modify entity @s start_interpolation set value 0

# Check lock display
execute unless entity @s[tag=vexp.lock_display_updated] run function vexp:custom_block/blocks/lock/update_lock_door_open

tag @s remove vexp.lock_checking
