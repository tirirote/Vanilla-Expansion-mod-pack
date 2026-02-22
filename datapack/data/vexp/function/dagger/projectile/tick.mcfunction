# Projectile Tick
# Ejecutado AS @s (marker) AT @s

particle minecraft:crit ~ ~ ~ 0 0 0 0 1

# 1. Bajar vida y aplicar gravedad (Rotar hacia abajo 2 grados por tick)
# Esto hará que el ^ ^ ^.5 también se desplace hacia abajo.
scoreboard players remove @s vexp.id 1

# 2. Paso de movimiento (Raycast simple 1.2 bloques)
# Comprobar si hay entidades en el camino
execute positioned ~ ~-1 ~ if entity @e[type=!player,type=!item_display,type=!interaction,type=!marker,distance=..0.75,sort=nearest,limit=1] run function vexp:dagger/projectile/hit_mob

# Comprobar si hay bloques
execute positioned ~ ~.5 ~ unless block ^ ^ ^1 #minecraft:replaceable run function vexp:dagger/projectile/hit_block

# Si ya chocó, paramos
execute unless entity @s run return 0

# Mover el marker
execute positioned ~ ~.3 ~ run tp @s ^ ^ ^.85 ~ ~5

# Sincronizar el display
execute at @s as @e[tag=vexp.dagger_display,limit=1,distance=..2,sort=nearest] run tp @s ~ ~ ~ ~ ~
