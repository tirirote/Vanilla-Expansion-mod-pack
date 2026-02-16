# Setup común para todas las sillas

playsound minecraft:block.wood.place block @a ~ ~ ~ 1 1
# Ejecutado AS y AT el item_display (modelo visual)

# Alinear posición
tp @s ~ ~ ~

# 0. Asegurar que el contador global está inicializado (si es 0 o null, poner a 1)
# Esto previene errores en la primera ejecución
execute unless score #global vexp.id matches 1.. run scoreboard players set #global vexp.id 1

# 1. Incrementar ID y asignar a ESTE modelo visual
scoreboard players add #global vexp.id 1
scoreboard players operation @s vexp.id = #global vexp.id

# 2. Crear la interacción (Hitbox)
summon interaction ~ ~ ~ {Tags:["vexp.chair_interact","vexp.temp_interact"],width:0.8f,height:1.6f}

# 3. Asignar EL MISMO ID a la interacción recién creada
# Usamos el tag temporal para identificarla sin ambigüedad
execute as @e[type=interaction,tag=vexp.temp_interact] run scoreboard players operation @s vexp.id = #global vexp.id

# 4. Copiar rotación
execute as @e[type=interaction,tag=vexp.temp_interact] run data modify entity @s Rotation set from entity @e[type=item_display,tag=vexp.chair,distance=..0.1,limit=1] Rotation

# Limpieza de tag temporal
tag @e[tag=vexp.temp_interact] remove vexp.temp_interact
tag @s remove vexp.temp
