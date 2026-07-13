# redstone_tick.mcfunction
# Ejecutar AS la interaction de la puerta
# Sincroniza estado visual con la puerta de hierro (hitbox) para soporte redstone.

# En puertas dobles, solo la hoja controladora (no right) procesa el tick para evitar doble ruteo.
execute if entity @s[tag=vexp.neighbour.right] run return 0

# Resolver transiciones de redstone de esta puerta
tag @s remove vexp.tmp_redstone_open
tag @s remove vexp.tmp_redstone_close

execute unless data entity @s data.vexp{has_lock:1} unless entity @s[tag=vexp.door_pending_close] unless entity @s[tag=vexp.door_opened] if block ~ ~ ~ iron_door[half=lower,open=true,powered=true] if block ~ ~1 ~ iron_door[half=upper,open=true,powered=true] run tag @s add vexp.tmp_redstone_open
execute unless data entity @s data.vexp{has_lock:1} unless entity @s[tag=vexp.door_pending_close] unless entity @s[tag=vexp.door_opened] if block ~ ~ ~1 iron_door[half=lower,open=true,powered=true] if block ~ ~1 ~1 iron_door[half=upper,open=true,powered=true] run tag @s add vexp.tmp_redstone_open
execute unless data entity @s data.vexp{has_lock:1} unless entity @s[tag=vexp.door_pending_close] unless entity @s[tag=vexp.door_opened] if block ~ ~ ~-1 iron_door[half=lower,open=true,powered=true] if block ~ ~1 ~-1 iron_door[half=upper,open=true,powered=true] run tag @s add vexp.tmp_redstone_open
execute unless data entity @s data.vexp{has_lock:1} unless entity @s[tag=vexp.door_pending_close] unless entity @s[tag=vexp.door_opened] if block ~1 ~ ~ iron_door[half=lower,open=true,powered=true] if block ~1 ~1 ~ iron_door[half=upper,open=true,powered=true] run tag @s add vexp.tmp_redstone_open
execute unless data entity @s data.vexp{has_lock:1} unless entity @s[tag=vexp.door_pending_close] unless entity @s[tag=vexp.door_opened] if block ~-1 ~ ~ iron_door[half=lower,open=true,powered=true] if block ~-1 ~1 ~ iron_door[half=upper,open=true,powered=true] run tag @s add vexp.tmp_redstone_open

# Bloquear Sonido
execute if block ~ ~ ~ iron_door run stopsound @a[distance=..16] * block.iron_door.open
execute if block ~ ~ ~ iron_door run stopsound @a[distance=..16] * block.iron_door.close

execute if entity @s[tag=vexp.door_opened] if block ~ ~ ~ iron_door[half=lower,open=false,powered=false] if block ~ ~1 ~ iron_door[half=upper,open=false,powered=false] run tag @s add vexp.tmp_redstone_close
execute if entity @s[tag=vexp.door_opened] if block ~ ~ ~1 iron_door[half=lower,open=false,powered=false] if block ~ ~1 ~1 iron_door[half=upper,open=false,powered=false] run tag @s add vexp.tmp_redstone_close
execute if entity @s[tag=vexp.door_opened] if block ~ ~ ~-1 iron_door[half=lower,open=false,powered=false] if block ~ ~1 ~-1 iron_door[half=upper,open=false,powered=false] run tag @s add vexp.tmp_redstone_close
execute if entity @s[tag=vexp.door_opened] if block ~1 ~ ~ iron_door[half=lower,open=false,powered=false] if block ~1 ~1 ~ iron_door[half=upper,open=false,powered=false] run tag @s add vexp.tmp_redstone_close
execute if entity @s[tag=vexp.door_opened] if block ~-1 ~ ~ iron_door[half=lower,open=false,powered=false] if block ~-1 ~1 ~ iron_door[half=upper,open=false,powered=false] run tag @s add vexp.tmp_redstone_close

# Forzar puerta con candado a open=false solo si fue abierta externamente (no por interaccion valida)
execute if data entity @s data.vexp{has_lock:1} unless entity @s[tag=vexp.door_opened] if block ~ ~ ~ iron_door[half=lower,open=true,powered=true] if block ~ ~1 ~ iron_door[half=upper,open=true,powered=true] run function vexp:custom_block/blocks/door/place_closed_door_block

# Buscar puerta gemela cercana (doble puerta) para sincronizar también por redstone
execute if entity @s[tag=vexp.tmp_redstone_open] run function vexp:custom_block/blocks/door/find_pair
execute if entity @s[tag=vexp.tmp_redstone_close] run function vexp:custom_block/blocks/door/find_pair

# Recalcular lados left/right para el ruteo de doble puerta (igual que en interaccion manual)
execute if entity @s[tag=vexp.tmp_redstone_open] run tag @s remove vexp.neighbour.left
execute if entity @s[tag=vexp.tmp_redstone_open] run tag @s remove vexp.neighbour.right
execute if entity @s[tag=vexp.tmp_redstone_close] run tag @s remove vexp.neighbour.left
execute if entity @s[tag=vexp.tmp_redstone_close] run tag @s remove vexp.neighbour.right

execute if entity @s[tag=vexp.tmp_redstone_open,y_rotation=-45..45] positioned ~1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right
execute if entity @s[tag=vexp.tmp_redstone_open,y_rotation=-45..45] positioned ~-1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[tag=vexp.tmp_redstone_open,y_rotation=136..180] positioned ~1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[tag=vexp.tmp_redstone_open,y_rotation=136..180] positioned ~-1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right
execute if entity @s[tag=vexp.tmp_redstone_open,y_rotation=-180..-136] positioned ~1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[tag=vexp.tmp_redstone_open,y_rotation=-180..-136] positioned ~-1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right
execute if entity @s[tag=vexp.tmp_redstone_open,y_rotation=45..135] positioned ~ ~ ~1 if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right
execute if entity @s[tag=vexp.tmp_redstone_open,y_rotation=45..135] positioned ~ ~ ~-1 if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[tag=vexp.tmp_redstone_open,y_rotation=-135..-45] positioned ~ ~ ~1 if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[tag=vexp.tmp_redstone_open,y_rotation=-135..-45] positioned ~ ~ ~-1 if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right

execute if entity @s[tag=vexp.tmp_redstone_close,y_rotation=-45..45] positioned ~1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right
execute if entity @s[tag=vexp.tmp_redstone_close,y_rotation=-45..45] positioned ~-1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[tag=vexp.tmp_redstone_close,y_rotation=136..180] positioned ~1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[tag=vexp.tmp_redstone_close,y_rotation=136..180] positioned ~-1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right
execute if entity @s[tag=vexp.tmp_redstone_close,y_rotation=-180..-136] positioned ~1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[tag=vexp.tmp_redstone_close,y_rotation=-180..-136] positioned ~-1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right
execute if entity @s[tag=vexp.tmp_redstone_close,y_rotation=45..135] positioned ~ ~ ~1 if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right
execute if entity @s[tag=vexp.tmp_redstone_close,y_rotation=45..135] positioned ~ ~ ~-1 if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[tag=vexp.tmp_redstone_close,y_rotation=-135..-45] positioned ~ ~ ~1 if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[tag=vexp.tmp_redstone_close,y_rotation=-135..-45] positioned ~ ~ ~-1 if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right

execute if entity @s[tag=vexp.tmp_redstone_open] run tag @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] remove vexp.neighbour.left
execute if entity @s[tag=vexp.tmp_redstone_open] run tag @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] remove vexp.neighbour.right
execute if entity @s[tag=vexp.tmp_redstone_open,tag=vexp.neighbour.left] run tag @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] add vexp.neighbour.right
execute if entity @s[tag=vexp.tmp_redstone_open,tag=vexp.neighbour.right] run tag @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] add vexp.neighbour.left

execute if entity @s[tag=vexp.tmp_redstone_close] run tag @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] remove vexp.neighbour.left
execute if entity @s[tag=vexp.tmp_redstone_close] run tag @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] remove vexp.neighbour.right
execute if entity @s[tag=vexp.tmp_redstone_close,tag=vexp.neighbour.left] run tag @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] add vexp.neighbour.right
execute if entity @s[tag=vexp.tmp_redstone_close,tag=vexp.neighbour.right] run tag @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] add vexp.neighbour.left

# Aplicar cambio usando lógica enrutada reutilizable
execute if entity @s[tag=vexp.tmp_redstone_open] run function vexp:custom_block/blocks/door/open_routed
execute if entity @s[tag=vexp.tmp_redstone_close] run function vexp:custom_block/blocks/door/close_routed

# Limpieza temporal
tag @s remove vexp.tmp_redstone_open
tag @s remove vexp.tmp_redstone_close
tag @e[type=interaction,tag=vexp.tmp_door_pair] remove vexp.tmp_door_pair
