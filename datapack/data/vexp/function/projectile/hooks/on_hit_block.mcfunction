# projectile/hooks/on_hit_block.mcfunction
# Hook llamado cuando el proyectil golpea un bloque
# @s es el proyectil
# $(proj_type) - Tipo de proyectil pasado como parámetro

$function vexp:projectile/projectiles/$(proj_type)/on_hit_block

execute positioned ^ ^ ^0.5 run function vexp:utils/feedback/block_hit
