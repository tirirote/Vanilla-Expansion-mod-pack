# projectile/despawn.mcfunction
# Limpieza del proyectil
# @s es el proyectil

# Hook: Lógica de despawn específica (loot, efectos finales, etc.)
function vexp:projectile/hooks/on_despawn with entity @s data

# Limpiar tag del lanzador
tag @a[tag=vexp.projectile_owner] remove vexp.projectile_owner

# Eliminar el proyectil
kill @s
