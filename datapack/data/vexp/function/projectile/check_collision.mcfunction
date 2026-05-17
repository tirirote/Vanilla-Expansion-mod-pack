# projectile/check_collision.mcfunction
# Detección de colisiones con mobs y bloques
# @s es el proyectil

# Colisión con mobs (excluir player, item, marker, interaction, item_display, area_effect_cloud)
# Dagas usan detección desplazada hacia abajo para mejor precisión
execute if entity @s[tag=vexp.dagger_projectile] if block ^ ^ ^1 #minecraft:replaceable if entity @e[predicate=vexp:is_target,distance=..2,sort=nearest] run function vexp:projectile/on_hit_mob
# Colisión con bloques sólidos
# Dagas usan detección desplazada hacia arriba
execute if entity @s[tag=vexp.dagger_projectile] unless block ^ ^ ^1 #minecraft:replaceable run function vexp:projectile/on_hit_block


# Otros proyectiles usan detección estándar
execute if entity @s[tag=!vexp.dagger_projectile] if block ^ ^ ^0.35 #minecraft:replaceable if entity @e[predicate=vexp:is_target,distance=..2,sort=nearest] run function vexp:projectile/on_hit_mob

execute if entity @s[tag=!vexp.dagger_projectile] unless block ^ ^ ^0.35 #minecraft:replaceable run function vexp:projectile/on_hit_block
