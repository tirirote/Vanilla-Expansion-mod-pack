# projectile/tick.mcfunction
# Sistema global de proyectiles
# Ejecutado para todos los proyectiles con tag vexp.projectile

# 1. Resolución de dueño para proyectiles con dependencia (face_player o radius)
execute store result score #proj_face vexp.math run data get entity @s data.proj.face_player
execute store result score #proj_radius vexp.math run data get entity @s data.proj.radius 100
execute if score #proj_face vexp.math matches 1.. run tag @s add vexp.needs_owner
execute if score #proj_radius vexp.math matches 1.. run tag @s add vexp.needs_owner
execute if score #proj_radius vexp.math matches ..-1 run tag @s add vexp.needs_owner

tag @s add vexp.proj_self_temp
tag @s remove vexp.proj_has_owner
execute if entity @s[tag=vexp.needs_owner] run scoreboard players operation #temp vexp.id = @s vexp.id
execute if entity @s[tag=vexp.needs_owner] as @a if score @s vexp.id = #temp vexp.id run tag @e[tag=vexp.proj_self_temp,limit=1] add vexp.proj_has_owner

# 2. Si necesita dueño y no lo hay, despawn
execute if entity @s[tag=vexp.needs_owner] unless entity @s[tag=vexp.proj_has_owner] run function vexp:projectile/despawn

# 3. Copiar lifetime desde NBT al scoreboard
execute store result score @s vexp.proj_lifetime run data get entity @s data.proj.lifetime

# 4. Restar 1 del lifetime
scoreboard players remove @s vexp.proj_lifetime 1

# 5. Copiar resultado de vuelta al NBT
execute store result entity @s data.proj.lifetime int 1 run scoreboard players get @s vexp.proj_lifetime

# 6. Hook: on_tick (efectos visuales, partículas, comportamiento específico)
execute if entity @s[tag=vexp.projectile] run function vexp:projectile/hooks/on_tick with entity @s data

# 7. Movimiento Unificado (ahora gestiona internamente spin, face_player y órbita)
execute if score @s vexp.proj_lifetime matches 1.. run function vexp:projectile/move with entity @s data.proj

# Cleanup de tags
tag @s remove vexp.proj_has_owner
tag @s remove vexp.proj_self_temp
tag @s remove vexp.needs_owner

# 6. Detección de colisiones
execute if score @s vexp.proj_lifetime matches 1.. run function vexp:projectile/check_collision

# 7. Limpieza si expira el tiempo de vida
execute if score @s vexp.proj_lifetime matches ..0 run function vexp:projectile/despawn
