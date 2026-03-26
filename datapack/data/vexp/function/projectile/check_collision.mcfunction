# projectile/check_collision.mcfunction
# Detección de colisiones con mobs y bloques
# @s es el proyectil

# Colisión con mobs (excluir player, item, marker, interaction, item_display, area_effect_cloud)
# Dagas usan detección desplazada hacia abajo para mejor precisión
execute if entity @s[tag=vexp.dagger_projectile] positioned ~ ~-1 ~ if entity @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,type=!block_display,type=!text_display,type=!armor_stand,type=!arrow,type=!leash_knot,distance=..1.5,sort=nearest] run function vexp:projectile/on_hit_mob

# Otros proyectiles usan detección estándar
execute if entity @s[tag=!vexp.dagger_projectile] if entity @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,type=!block_display,type=!text_display,type=!armor_stand,type=!arrow,type=!leash_knot,distance=..1.5,sort=nearest] run function vexp:projectile/on_hit_mob

# Si ya fue destruido por colisión con mob, no continuar
execute unless entity @s run return 0

# Colisión con bloques sólidos
# Dagas usan detección desplazada hacia arriba
execute if entity @s[tag=vexp.dagger_projectile] positioned ~ ~.5 ~ unless block ^ ^ ^1 #minecraft:replaceable run function vexp:projectile/on_hit_block

# Otros proyectiles usan detección estándar
execute if entity @s[tag=!vexp.dagger_projectile] unless block ^ ^ ^0.35 #minecraft:replaceable run function vexp:projectile/on_hit_block
