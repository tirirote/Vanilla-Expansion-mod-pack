# on_spawn.mcfunction
# Inicializa estado del bloque recien colocado y sincroniza su modelo visual.

execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id at @s run function vexp:custom_block/blocks/pile_of_books/init_state
