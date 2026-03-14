# dungeons/scythe/projectile/on_spawn.mcfunction
# Configuración inicial del proyectil de guadaña
# @s es el proyectil recién creado

# NBT unificado: data.proj con todos los parámetros
data modify entity @s data.proj set value {speed:0.8, lifetime:10, gravity:0, damage:2, randomness:0.08, homing_distance:0.0}
