# projectile/tick.mcfunction
# Sistema global de proyectiles
# Ejecutado para todos los proyectiles con tag vexp.projectile

# 1. Copiar lifetime desde NBT al scoreboard
execute store result score @s vexp.proj_lifetime run data get entity @s data.proj.lifetime

# 2. Restar 1 del lifetime
scoreboard players remove @s vexp.proj_lifetime 1

# 3. Copiar resultado de vuelta al NBT
execute store result entity @s data.proj.lifetime int 1 run scoreboard players get @s vexp.proj_lifetime

# 4. Hook: on_tick (efectos visuales, partículas, comportamiento específico)
execute if entity @s[tag=vexp.projectile] run function vexp:projectile/hooks/on_tick with entity @s data

# 5. Movimiento (con velocidad y gravedad combinadas)
execute if score @s vexp.proj_lifetime matches 1.. run function vexp:projectile/move with entity @s data.proj

# 6. Detección de colisiones
execute if score @s vexp.proj_lifetime matches 1.. run function vexp:projectile/check_collision

# 7. Limpieza si expira el tiempo de vida
execute if score @s vexp.proj_lifetime matches ..0 run function vexp:projectile/despawn
