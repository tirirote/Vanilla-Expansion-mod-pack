# projectile/hooks/on_spawn.mcfunction
# Hook llamado cuando se crea un proyectil
# @s es el proyectil recién creado
# $(proj_type) - Tipo de proyectil pasado como parámetro

$function vexp:dungeons/$(proj_type)/projectile/on_spawn
