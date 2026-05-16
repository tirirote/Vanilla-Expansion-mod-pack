# dungeons/nether/projectile/on_spawn.mcfunction
# @s is the nether proj
# Ejemplo con todos los parámetros activos:
data modify entity @s data.proj set value {speed:0.25, lifetime:30, damage:1, face_player:1, radius:4.5, height:1.5}
