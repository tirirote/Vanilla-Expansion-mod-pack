# Convertir Item Frame en Silla
# Ejecutado AS y AT el Item Frame que está en el suelo

# 1. Invocar la silla
execute at @s align xyz positioned ~0.5 ~0.5 ~0.5 run function vexp:chair/spawn/spawn_oak

# 2. Rotación: Copiar del Jugador
# Seleccionamos la silla recién creada (vexp.temp) y copiamos el YAW (Rotation[0]) del jugador más cercano (@p)
execute as @e[tag=vexp.temp,distance=..0.5,sort=nearest,limit=1] run data modify entity @s Rotation[0] set from entity @p Rotation[0]

# 3. Ajuste: Girar 180 grados
# Para que el "frente" de la silla mire hacia el jugador (Asiento hacia ti)
execute as @e[tag=vexp.temp,distance=..0.5,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ ~180 0

# 4. Copiar a la Interacción
# La interacción (vexp.temp_interact) debe tener la misma rotación
execute as @e[tag=vexp.temp_interact,distance=..0.5,sort=nearest,limit=1] run data modify entity @s Rotation set from entity @e[tag=vexp.temp,distance=..0.5,sort=nearest,limit=1] Rotation

# 5. Limpieza
kill @s
tag @e[tag=vexp.temp,distance=..0.5,sort=nearest,limit=1] remove vexp.temp
tag @e[tag=vexp.temp_interact,distance=..0.5,sort=nearest,limit=1] remove vexp.temp_interact
