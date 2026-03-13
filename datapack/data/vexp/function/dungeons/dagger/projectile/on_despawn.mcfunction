# projectile/on_despawn.mcfunction
# Limpieza antes de destruir el proyectil de daga
# @s es el proyectil

# Eliminar tag de dueño (además del que limpia el sistema base)
tag @p[tag=vexp.dagger_owner,limit=1] remove vexp.dagger_owner

# Eliminar display visual de la daga
execute as @e[tag=vexp.dagger_display,distance=..1.5,sort=nearest,limit=1] run kill @s
