# projectile/hooks/on_tick.mcfunction
# Hook llamado cada tick del proyectil
# @s es el proyectil
# Usado para partículas, efectos visuales, sonidos, etc.
# $(proj_type) - Tipo de proyectil pasado como parámetro

$function vexp:dungeons/$(proj_type)/projectile/on_tick
