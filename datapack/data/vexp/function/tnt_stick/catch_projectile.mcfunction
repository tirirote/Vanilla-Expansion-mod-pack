# Catch Projectile (Dispenser or manual throw fallback)
# Ejecutado AS @e[type=experience_bottle] AT @s

# 1. Crear el marcador en la posición actual de la botella
summon minecraft:marker ~ ~ ~ {Tags:["vexp.tnt_projectile","vexp.temp_projectile"]}

# 2. Copiar la rotación de la botella al marcador para que mantenga la dirección
execute as @e[tag=vexp.temp_projectile,limit=1] run data modify entity @s Rotation set from entity @e[type=experience_bottle,distance=..0.1,sort=nearest,limit=1] Rotation

# 3. Configurar el proyectil
execute as @e[tag=vexp.temp_projectile,limit=1] at @s run function vexp:tnt_stick/projectile/setup

# 4. Eliminar la botella original para que no de XP ni se vea
kill @s
