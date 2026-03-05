# 1. Lógica para Jugadores (Detección de lanzamiento)
execute as @a if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"dagger"}}] run function vexp:dagger/player_tick

# 2. Lógica para Dagas Proyectiles (En vuelo)
execute as @e[tag=vexp.dagger_projectile] at @s run function vexp:dungeons/dagger/projectile/tick

# 3. Lógica para Dagas Clavadas (Stuck)
execute as @e[tag=vexp.dagger_stuck] at @s run function vexp:dungeons/dagger/stuck/tick