# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj
# Ejemplo con todos los parámetros activos:
data modify entity @s data.proj set value {speed:0.1, lifetime:60, gravity:0, damage:2, randomness:0.1, homing_distance:8.0, spin:-25}
