# Lógica por Item Frame (Colocación)
# Se ejecuta AS @s (item frame) AT @s

# 1. ¿Está en el Suelo (Facing:1) Y tiene Espacio? -> Convertir en Silla
execute if data entity @s {Facing:1b} if block ~ ~1.5 ~ #minecraft:replaceable run function vexp:chair/convert_frame_oak
# Nota: Si se convierte, la entidad muere, así que las siguientes líneas no se ejecutarán para ella.

# 2. Si sigue Viva (Facing!=1 o Bloque sólido encima) -> Es Inválida, Pickup (Devolver Item)
execute unless data entity @s {Facing:1b} run function vexp:chair/pickup
execute unless block ~ ~1.5 ~ #minecraft:replaceable run function vexp:chair/pickup
