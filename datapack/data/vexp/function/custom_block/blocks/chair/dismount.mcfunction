# Ejecutado como el jugador que se acaba de levantar.

# Añadir animación de jitter
execute as @e[type=interaction,tag=vexp.chair_interact,distance=..2,limit=1] run tag @s add vexp.block.jitter
execute as @e[type=interaction,tag=vexp.chair_interact,distance=..2,limit=1] run scoreboard players set @s vexp.block_anim 10

# Sonido
function vexp:custom_block/macro/sound {sound:"minecraft:block.fence_gate.open"}

# Liberar silla ocupada cercana.
execute at @s run tag @e[type=interaction,tag=vexp.chair_interact,distance=..2,limit=1] remove vexp.occupied

# Eliminar montura vacia.
execute at @s run kill @e[type=armor_stand,tag=vexp.chair_mount,distance=..2,limit=1]

# Quitar estado de sentado.
tag @s remove vexp.is_sitting
tag @s remove vexp.sit_grace
