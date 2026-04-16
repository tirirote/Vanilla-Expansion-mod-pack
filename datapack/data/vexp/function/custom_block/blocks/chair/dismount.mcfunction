# Ejecutado como el jugador que se acaba de levantar.

# Liberar silla ocupada cercana.
execute at @s run tag @e[type=interaction,tag=vexp.chair_interact,distance=..2,limit=1] remove vexp.occupied

# Eliminar montura vacia.
execute at @s run kill @e[type=armor_stand,tag=vexp.chair_mount,distance=..2,limit=1]

# Quitar estado de sentado.
tag @s remove vexp.is_sitting
tag @s remove vexp.sit_grace
