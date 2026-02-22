# Throw TNT Stick Logic
# Ejecutado AS @s (jugador) AT @s

tag @s add vexp.tnt_thrower

# Sonido de lanzamiento
playsound minecraft:entity.snowball.throw player @a ~ ~ ~ 0.5 1.0

# Crear el proyectil (Marker)
# Lo spawneamos a la altura de los ojos
summon minecraft:marker ~ ~1.5 ~ {Tags:["vexp.tnt_projectile","vexp.temp_projectile"]}

# Ejecutar setup sobre el proyectil
execute as @e[tag=vexp.temp_projectile,limit=1] at @s run function vexp:tnt_stick/projectile/setup

tag @s remove vexp.tnt_thrower
