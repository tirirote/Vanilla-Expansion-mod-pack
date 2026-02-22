# Handle Dagger Use
# Ejecutado AS @s (jugador)

# 1. Revocar el progreso para que pueda volver a disparar
advancement revoke @s only vexp:dagger_throw

# 2. Comprobar cooldown
execute if score @s vexp.dagger_cooldown matches 1.. run return 0

# 3. Lanzar la daga
execute at @s positioned ~ ~1.2 ~ run function vexp:dagger/throw

# 4. Limpiar slot (La daga se consume al lanzarse)
# Limpiamos tanto mainhand como offhand si tienen una daga (para soportar ambas manos)
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"dagger"}}] run item replace entity @s weapon.mainhand with air
execute if items entity @s weapon.offhand *[custom_data~{vexp:{type:"dagger"}}] run item replace entity @s weapon.offhand with air