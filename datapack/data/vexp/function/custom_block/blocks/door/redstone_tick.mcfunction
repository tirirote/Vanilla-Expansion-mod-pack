# redstone_tick.mcfunction
# Ejecutar AS la interaction de la puerta
# Sincroniza estado visual con la puerta de hierro (hitbox) para soporte redstone.

# Resolver transiciones de redstone de esta puerta
tag @s remove vexp.tmp_redstone_open
tag @s remove vexp.tmp_redstone_close

execute unless entity @s[tag=vexp.door_pending_close] unless entity @s[tag=vexp.door_opened] if block ~ ~ ~ iron_door[half=lower,open=true] run tag @s add vexp.tmp_redstone_open
execute unless entity @s[tag=vexp.door_pending_close] unless entity @s[tag=vexp.door_opened] if block ~ ~1 ~ iron_door[half=upper,open=true] run tag @s add vexp.tmp_redstone_open

execute unless entity @s[tag=vexp.door_pending_close] unless entity @s[tag=vexp.door_opened] if block ~ ~ ~ iron_door[half=lower,open=true] run stopsound @a[distance=..10] * block.iron_door.open
execute unless entity @s[tag=vexp.door_pending_close] unless entity @s[tag=vexp.door_opened] if block ~ ~ ~ iron_door[half=lower,open=true] run stopsound @a[distance=..10] * block.iron_door.close

execute if entity @s[tag=vexp.door_opened] unless block ~ ~ ~ iron_door[half=lower,open=true] unless block ~ ~1 ~ iron_door[half=upper,open=true] run tag @s add vexp.tmp_redstone_close

# Buscar puerta gemela cercana (doble puerta) para sincronizar también por redstone
execute if entity @s[tag=vexp.tmp_redstone_open] run function vexp:custom_block/blocks/door/find_pair
execute if entity @s[tag=vexp.tmp_redstone_close] run function vexp:custom_block/blocks/door/find_pair

# Aplicar cambio usando lógica enrutada reutilizable
execute if entity @s[tag=vexp.tmp_redstone_open] run function vexp:custom_block/blocks/door/open_routed
execute if entity @s[tag=vexp.tmp_redstone_close] run function vexp:custom_block/blocks/door/close_routed

# Limpieza temporal
tag @s remove vexp.tmp_redstone_open
tag @s remove vexp.tmp_redstone_close
tag @e[type=interaction,tag=vexp.tmp_door_pair] remove vexp.tmp_door_pair
