# projectile/hooks/on_hit_mob.mcfunction
# Hook llamado cuando el proyectil golpea una entidad
# @s es el proyectil
# @e[tag=vexp.proj_target] es el mob objetivo
# $(proj_type) - Tipo de proyectil pasado como parámetro

$function vexp:projectile/projectiles/$(proj_type)/on_hit_mob
