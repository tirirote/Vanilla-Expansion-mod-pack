# projectile/check_collision.mcfunction
# Detección de colisiones con mobs y bloques
# @s es el proyectil

# Colisión con mobs (excluir player, item, marker, interaction, item_display, area_effect_cloud)
# Dagas usan detección desplazada hacia abajo para mejor precisión
execute if entity @s[tag=vexp.dagger_projectile] positioned ~ ~-1 ~ if entity @e[predicate=vexp:is_target,distance=..2,sort=nearest] run function vexp:projectile/on_hit_mob

# Otros proyectiles usan detección estándar
execute if entity @s[tag=!vexp.dagger_projectile] positioned ~ ~ ~ if entity @e[predicate=vexp:is_target,distance=..2,sort=nearest] run function vexp:projectile/on_hit_mob

# Si ya fue destruido por colisión con mob, no continuar
execute unless entity @s run return 0

# Colisión con bloques sólidos
# Dagas usan detección desplazada hacia arriba
execute if entity @s[tag=vexp.dagger_projectile] positioned ~ ~.5 ~ unless block ^ ^ ^1 #minecraft:replaceable run function vexp:projectile/on_hit_block

# Otros proyectiles usan detección estándar
execute if entity @s[tag=!vexp.dagger_projectile] unless block ^ ^ ^0.35 #minecraft:replaceable run function vexp:projectile/on_hit_block
