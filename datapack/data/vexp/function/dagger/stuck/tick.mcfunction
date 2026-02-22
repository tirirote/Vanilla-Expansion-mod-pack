# Stuck Tick
# Ejecutado AS @s (marker) AT @s

# 1. Buscar al mob al que estamos pegados
# Asumimos que el mob está muy cerca del marker.
# Si el mob muere, @e[...] fallará.
execute as @e[type=!player,type=!item_display,type=!interaction,type=!marker,distance=..1,limit=1,sort=nearest] at @s run tag @s add vexp.current_host

# 2. Moverse con el host (@s es el marcador)
execute at @e[tag=vexp.current_host,limit=1] run teleport @s ~ ~1 ~

# 3. Daño por sangrado (Cada 20 ticks / 1 seg)
# Solo si hay un host y NO está en un bloque
execute if entity @e[tag=vexp.current_host,distance=..0.1] unless entity @s[tag=vexp.stuck_in_block] run scoreboard players remove @s vexp.dagger_cooldown 1

# Al llegar a 0, hacemos daño y reseteamos el reloj
execute if score @s vexp.dagger_cooldown matches ..0 as @e[tag=vexp.current_host,limit=1] run damage @s 2 minecraft:player_attack
execute if score @s vexp.dagger_cooldown matches ..0 run scoreboard players set @s vexp.dagger_cooldown 20

# 5. Sincronizar visual e interacción (@s es el marcador)
execute at @s as @e[tag=vexp.dagger_stuck_visual,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run tp @s ~ ~ ~
execute at @s as @e[tag=vexp.dagger_stuck_interact,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run tp @s ~ ~ ~

# 6. Detección de Recogida (Pickup)
execute at @s as @e[tag=vexp.dagger_stuck_interact,distance=..1.5] if score @s vexp.id = @n[tag=vexp.dagger_stuck,distance=..1] vexp.id run function vexp:dagger/stuck/check_pickup
# Limpiar tags temporales
tag @e[tag=vexp.current_host] remove vexp.current_host
