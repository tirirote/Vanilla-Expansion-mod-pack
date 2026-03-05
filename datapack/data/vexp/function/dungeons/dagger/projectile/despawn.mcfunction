# Projectile Despawn
# Ejecutado AS @s (marker)

#Eliminar tag de dueño
tag @p[tag=vexp.dagger_owner,limit=1] remove vexp.dagger_owner

#Eliminar display
execute as @e[tag=vexp.dagger_display,distance=..1.5,sort=nearest,limit=1] run kill @s

#Eliminar marker
kill @s
