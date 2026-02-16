# Gestión de interacciones con sillas
# IMPORTANTE: Usamos 'at @s' para que las funciones se ejecuten en la posición de la silla
execute as @e[type=interaction,tag=vexp.chair_interact] at @s if data entity @s interaction run function vexp:chair/interact
execute as @e[type=interaction,tag=vexp.chair_interact] at @s if data entity @s attack run function vexp:chair/pickup

# LÓGICA DE DESMONTADO
execute as @a[tag=vexp.is_sitting] unless data entity @s RootVehicle run function vexp:chair/dismount

# LÓGICA DE COLOCACIÓN (NUEVO MÉTODO: ITEM FRAMES)
# Detectar item frames invisibles colocados en el SUELO (Facing:1b) con el tag de silla
execute as @e[type=item_frame,tag=vexp.place_chair.oak,nbt={Facing:1b}] at @s if block ~ ~1.5 ~ #minecraft:replaceable run function vexp:chair/convert_frame_oak

execute as @e[type=item_frame,tag=vexp.place_chair.oak,nbt={Facing:1b}] at @s unless block ~ ~1.5 ~ #minecraft:replaceable run function vexp:chair/pickup

# Limpiar colocaciones inválidas (Pared/Techo) para recuperar el item
execute as @e[type=item_frame,tag=vexp.place_chair.oak,nbt=!{Facing:1b}] run function vexp:chair/pickup