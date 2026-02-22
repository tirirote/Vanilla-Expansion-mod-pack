# Move Logic
# Ejecutado AS @s (marker) AT @s

# Comprobar si hay bloques en el camino (adelante)
execute if block ^ ^ ^0.5 #minecraft:replaceable run tp @s ^ ^.25 ^0.4 ~ ~5
execute unless block ^ ^ ^0.5 #minecraft:replaceable run function vexp:tnt_stick/projectile/impact_effects
execute unless block ^ ^ ^0.5 #minecraft:replaceable run scoreboard players set @s vexp.damage 1

# Comprobar si tocó el suelo (abajo)
execute if score @s vexp.damage matches 0 if block ~ ~-0.1 ~ #minecraft:replaceable run return 1
execute if score @s vexp.damage matches 0 run function vexp:tnt_stick/projectile/impact_effects
scoreboard players set @s vexp.damage 1

