# 1. Lógica para Dagas Proyectiles (En vuelo)
# Ahora manejado por el sistema global de proyectiles: vexp:projectile/tick

# 2. Lógica para Dagas Clavadas (Stuck)
execute as @e[tag=vexp.dagger_stuck] at @s run function vexp:projectile/projectiles/dagger/stuck/tick
