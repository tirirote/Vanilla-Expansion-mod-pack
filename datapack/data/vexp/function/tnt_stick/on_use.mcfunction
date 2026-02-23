# Handle TNT Stick Use
# Ejecutado AS @s (jugador)

# 1. Revocar el progreso
scoreboard players reset @s vexp.tnt_stick_used

# 2. Lanzar el cartucho personalizado
execute at @s run function vexp:tnt_stick/throw

# 3. Eliminar la botella de experiencia generada
# Buscamos la entidad experience_bottle más cercana lanzada por el jugador
kill @e[type=minecraft:experience_bottle,distance=..3,limit=1]

