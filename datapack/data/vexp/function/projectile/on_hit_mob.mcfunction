# projectile/on_hit_mob.mcfunction
# Llamado cuando el proyectil colisiona con una entidad
# @s es el proyectil

# Marcar el objetivo
tag @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..1.2,limit=1,sort=nearest] add vexp.proj_target

# Hook: Lógica específica del tipo de proyectil
execute positioned ~ ~ ~ run function vexp:projectile/hooks/on_hit_mob with entity @s data

# Limpiar tag del objetivo
tag @e[tag=vexp.proj_target] remove vexp.proj_target

# Destruir proyectil (si no se previene por rebote)
execute unless entity @s[tag=vexp.prevent_despawn] run function vexp:projectile/despawn
tag @s remove vexp.prevent_despawn

