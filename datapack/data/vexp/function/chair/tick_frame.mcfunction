# Lógica por Item Frame (Colocación)
# Se ejecuta AS @s (item frame) AT @s

# 1. Validar Colocación (Suelo + Espacio)
# Si no es válido, devolver item (pickup)
execute unless data entity @s {Facing:1b} run function vexp:chair/pickup
execute unless block ~ ~1.5 ~ #minecraft:replaceable run function vexp:chair/pickup

# 2. Convertir según el tipo de madera (Si es válido)
# Solo convertimos si seguimos existiendo (Facing:1b)
execute if data entity @s {Facing:1b} if block ~ ~1.5 ~ #minecraft:replaceable run function vexp:chair/tick_frame_convert
