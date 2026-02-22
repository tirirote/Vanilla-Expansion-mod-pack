# Check Pickup for Stuck Dagger
# Ejecutado AS @s (interaction)

# Si alguien hizo click izquierdo (attack) o derecho (interaction)
execute if data entity @s attack run function vexp:dagger/stuck/pickup
execute if data entity @s interaction run function vexp:dagger/stuck/pickup

# Limpiar datos para no repetir
data remove entity @s attack
data remove entity @s interaction
