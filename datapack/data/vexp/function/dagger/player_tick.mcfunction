# Player Tick Logic for Daggers
# Ejecutado AS @s (jugador)

# Decrementar cooldown
execute if score @s vexp.dagger_cooldown matches 1.. run scoreboard players remove @s vexp.dagger_cooldown 1

# Detectar uso instantáneo (Right Click) via Predicado
# Esto detecta el inicio de la animación de "consumir" (food)
execute if predicate vexp:is_using_dagger run function vexp:dagger/on_use
