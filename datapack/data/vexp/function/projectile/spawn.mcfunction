# projectile/spawn.mcfunction
# Setup inicial para un proyectil
# @s es el proyectil recién creado con tag vexp.temp_projectile

# Añadir tag principal
tag @s add vexp.projectile

# Copiar rotación del lanzador si existe
execute if entity @p[tag=vexp.projectile_owner,distance=..5] run data modify entity @s Rotation set from entity @p[tag=vexp.projectile_owner,distance=..5] Rotation

# Remover tag temporal
tag @s remove vexp.temp_projectile

# Hook: on_spawn (configuración específica del tipo de proyectil)
function vexp:projectile/hooks/on_spawn with entity @s data

# Ensure optional movement parameters exist for base system
execute unless data entity @s data.proj.randomness run data modify entity @s data.proj.randomness set value 0.0
execute unless data entity @s data.proj.homing_distance run data modify entity @s data.proj.homing_distance set value 0.0
