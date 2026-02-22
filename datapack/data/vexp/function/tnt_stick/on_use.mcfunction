# Handle TNT Stick Use
# Ejecutado AS @s (jugador)

# 1. Revocar el progreso
scoreboard players reset @s vexp.tnt_stick_used

# 2. Lanzar el cartucho personalizado
execute at @s run function vexp:tnt_stick/throw

# 3. Eliminar la bola de nieve de vainilla generada
# Buscamos la entidad snowball más cercana lanzada por el jugador
kill @e[type=minecraft:snowball,distance=..3,limit=1]

