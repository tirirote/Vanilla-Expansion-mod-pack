# on_spawn.mcfunction
# Se ejecuta durante el spawn del bloque. El executor no siempre es la interaction,
# por eso buscamos la interaction recien creada en esta posicion.

# Initial data for locked door
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id run data modify entity @s data.vexp.has_lock set value 0
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id run data modify entity @s data.vexp.key_name set value ""

execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id at @s run function vexp:custom_block/blocks/door/initial_placement
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id at @s run function vexp:custom_block/blocks/door/on_spawn_pair_setup
