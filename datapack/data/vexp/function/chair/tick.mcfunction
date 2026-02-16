# Gestión de interacciones con sillas
# IMPORTANTE: 1 Sola búsqueda global por tipo de entidad
# 1. Procesar Interacciones de Sillas (Left/Right Click y Limpieza)
execute as @e[type=interaction,tag=vexp.chair_interact] at @s run function vexp:chair/tick_interaction

# 2. Desmontado de Jugadores
execute as @a[tag=vexp.is_sitting] unless data entity @s RootVehicle run function vexp:chair/dismount

# 3. Limpieza de Monturas
execute as @e[type=armor_stand,tag=vexp.chair_mount] run function vexp:chair/tick_mount

# 4. Procesar Item Frames de colocación (Solo 1 búsqueda)
execute as @e[type=item_frame,tag=vexp.place_chair.oak] at @s run function vexp:chair/tick_frame