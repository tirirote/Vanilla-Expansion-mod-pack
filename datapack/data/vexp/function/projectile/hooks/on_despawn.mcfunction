# projectile/hooks/on_despawn.mcfunction
# Hook llamado antes de que el proyectil sea destruido
# @s es el proyectil
# Usado para efectos finales, drop de items, etc.
# $(proj_type) - Tipo de proyectil pasado como parámetro

$function vexp:projectile/projectiles/$(proj_type)/on_despawn
