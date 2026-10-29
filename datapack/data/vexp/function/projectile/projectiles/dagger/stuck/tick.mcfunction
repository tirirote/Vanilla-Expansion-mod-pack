# Stuck Tick
# Ejecutado AS @s (marker) AT @s

# 1. Animación de balanceo
function vexp:projectile/projectiles/dagger/stuck/animate

# 2. Sincronizar visual e interacción (@s es el marcador)
scoreboard players operation #temp vexp.id = @s vexp.id
execute at @s as @e[tag=vexp.dagger_stuck_visual,distance=..2] if score @s vexp.id = #temp vexp.id at @s run tp @s ~ ~ ~
execute at @s as @e[tag=vexp.dagger_stuck_interact,distance=..2] if score @s vexp.id = #temp vexp.id at @s run tp @s ~ ~ ~

# 3. Detección de Recogida (Pickup)
execute at @s as @e[tag=vexp.dagger_stuck_interact,distance=..2] if score @s vexp.id = #temp vexp.id run function vexp:projectile/projectiles/dagger/stuck/check_pickup
