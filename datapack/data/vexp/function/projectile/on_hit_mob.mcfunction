# projectile/on_hit_mob.mcfunction
# Llamado cuando el proyectil colisiona con una entidad
# @s es el proyectil

# Limpiar residuos previos antes de seleccionar un nuevo objetivo
tag @e[tag=vexp.proj_target] remove vexp.proj_target

# Marcar el objetivo
execute at @s run tag @e[type=!player,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,type=!text_display,type=!armor_stand,distance=..1.5,sort=nearest] add vexp.proj_target

# Hook: Lógica específica del tipo de proyectil
function vexp:projectile/hooks/on_hit_mob with entity @s data

# Limpiar tag del objetivo
tag @e[tag=vexp.proj_target] remove vexp.proj_target

# Destruir proyectil (si no se previene por rebote)
execute unless entity @s[tag=vexp.prevent_despawn] run function vexp:projectile/despawn
tag @s remove vexp.prevent_despawn
