# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj
# Ejemplo con todos los parámetros activos:
data modify entity @s data.proj set value {speed:0.8, lifetime:10, gravity:0, damage:3, randomness:0}
