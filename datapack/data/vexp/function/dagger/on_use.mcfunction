# Handle Dagger Use
# Ejecutado AS @s (jugador)

# 1. Revocar el progreso para que pueda volver a disparar
advancement revoke @s only vexp:dagger_throw

# 2. Comprobar cooldown
execute if score @s vexp.dagger_cooldown matches 1.. run return 0

# 3. Lanzar la daga
execute at @s positioned ~ ~1.2 ~ run function vexp:dagger/throw

# 4. Limpiar slot (La daga se consume al lanzarse)
item replace entity @s weapon.mainhand with air
