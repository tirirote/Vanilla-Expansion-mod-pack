# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj
# Ejemplo con todos los parámetros activos:
data modify entity @s data.proj set value {speed:0.3, lifetime:120, gravity:-5, damage:3, randomness:0.1, homing_distance:12.0, exclude_tag:"echo_marked"}
