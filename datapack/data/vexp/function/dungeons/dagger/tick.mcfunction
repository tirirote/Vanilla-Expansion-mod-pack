# 1. Lógica para Jugadores (Detección de lanzamiento)
execute as @a if items entity @s weapon.mainhand *[custom_data~{vexp:{item:"dagger"}}] run function vexp:dungeons/dagger/player_tick

# 2. Lógica para Dagas Proyectiles (En vuelo)
# Ahora manejado por el sistema global de proyectiles: vexp:projectile/tick

# 3. Lógica para Dagas Clavadas (Stuck)
execute as @e[tag=vexp.dagger_stuck] at @s run function vexp:dungeons/dagger/stuck/tick