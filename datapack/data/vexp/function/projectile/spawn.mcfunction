# projectile/spawn.mcfunction
# Setup inicial para un proyectil
# @s es el proyectil recién creado con tag vexp.temp_projectile

# Añadir tag principal
tag @s add vexp.projectile
# Heredar la rotación del contexto de ejecución actual
# El caller ya debe venir con la orientación deseada mediante facing/rotated.

# Vincular con id del dueño si existe
# assign_id solo si el jugador no tiene ID todavía → todos los proyectiles del mismo volley comparten el mismo ID
execute if entity @p[tag=vexp.projectile_owner,distance=..5,limit=1] unless score @p[tag=vexp.projectile_owner,distance=..5,limit=1] vexp.id matches 1.. run function vexp:utils/assign_id
execute if entity @p[tag=vexp.projectile_owner,distance=..5,limit=1] run scoreboard players operation @s vexp.id = @p[tag=vexp.projectile_owner,distance=..5,limit=1] vexp.id
# Guardar ID del volley antes de eliminar el tag (para spawns subsiguientes del mismo volley)
execute if entity @p[tag=vexp.projectile_owner,distance=..5,limit=1] as @p[tag=vexp.projectile_owner,distance=..5,limit=1] run scoreboard players operation #volley_owner_id vexp.id = @s vexp.id

# Remover tag temporal del dueño
tag @p[tag=vexp.projectile_owner,distance=..5,limit=1] remove vexp.projectile_owner

# Para spawns subsiguientes del mismo volley (tag ya eliminado): heredar ID solo si
# este proyectil aun no tiene ID asignado.
execute unless entity @p[tag=vexp.projectile_owner,distance=..5,limit=1] if score @s vexp.id matches ..0 if score #volley_owner_id vexp.id matches 1.. run scoreboard players operation @s vexp.id = #volley_owner_id vexp.id

# Resolver rotacion del duenyo por ID para que todos los proyectiles del mismo volley
# reciban orientacion correcta incluso si el tag vexp.projectile_owner ya fue removido.
scoreboard players operation #proj_owner_id vexp.id = @s vexp.id
tag @s add vexp.proj_self_temp
execute as @a if score @s vexp.id = #proj_owner_id vexp.id run data modify entity @e[tag=vexp.proj_self_temp,limit=1] Rotation set from entity @s Rotation
tag @s remove vexp.proj_self_temp

# Remover tag temporal del proyectil
tag @s remove vexp.temp_projectile
tag @s remove vexp.keep_rotation

# Fuego visual en la entidad base del proyectil (armor stand)
execute if entity @s[type=minecraft:armor_stand] run data merge entity @s {Fire:32767s,HasVisualFire:1b}

# Hook: on_spawn (configuración específica del tipo de proyectil)
function vexp:projectile/hooks/on_spawn with entity @s data

# Ensure optional movement parameters exist for base system
execute unless data entity @s data.proj.randomness run data modify entity @s data.proj.randomness set value 0.0
execute unless data entity @s data.proj.homing_distance run data modify entity @s data.proj.homing_distance set value 0.0
execute unless data entity @s data.proj.spin run data modify entity @s data.proj.spin set value 0.0
execute unless data entity @s data.proj.face_player run data modify entity @s data.proj.face_player set value 0
execute unless data entity @s data.proj.radius run data modify entity @s data.proj.radius set value 0.0
execute unless data entity @s data.proj.orbit_height run data modify entity @s data.proj.orbit_height set value 0.0
# exclude_tag is optional and only set if discriminative homing is needed

