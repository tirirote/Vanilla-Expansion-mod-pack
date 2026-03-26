# projectile/on_despawn.mcfunction
# Limpieza antes de destruir el proyectil de daga
# @s es el proyectil

# Eliminar tag de dueño (además del que limpia el sistema base)
tag @p[tag=vexp.dagger_owner,limit=1] remove vexp.dagger_owner

# Eliminar display visual de la daga
scoreboard players operation #temp vexp.id = @s vexp.id
execute as @e[type=item_display,tag=vexp.dagger_display] if score @s vexp.id = #temp vexp.id run kill @s
