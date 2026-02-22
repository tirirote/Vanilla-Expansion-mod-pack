# Player Tick Logic for Daggers
# Ejecutado AS @s (jugador)

# Decrementar cooldown
execute if score @s vexp.dagger_cooldown matches 1.. run scoreboard players remove @s vexp.dagger_cooldown 1
