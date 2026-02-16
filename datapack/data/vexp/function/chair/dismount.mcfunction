# Ejecutado como el jugador que se acaba de levantar

# 1. Liberar la silla (buscamos en un radio de 2 bloques por si el jugador se desplaza al levantarse)
execute at @s run tag @e[type=interaction,tag=vexp.chair_interact,distance=..2,limit=1] remove vexp.occupied

# 2. Eliminar la montura que ha quedado vacía
execute at @s run kill @e[type=armor_stand,tag=vexp.chair_mount,distance=..2,limit=1]

# 3. Quitar el tag de sentado al jugador
tag @s remove vexp.is_sitting

say Silla liberada