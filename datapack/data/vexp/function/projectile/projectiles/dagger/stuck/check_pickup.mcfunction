# Check Pickup for Stuck Dagger
# Ejecutado AS @s (interaction)

# Si alguien hizo click izquierdo (attack) o derecho (interaction)
execute if data entity @s attack run function vexp:projectile/projectiles/dagger/stuck/pickup
execute if data entity @s interaction run function vexp:projectile/projectiles/dagger/stuck/pickup

#Si el jugador está muy cerca
execute at @s if entity @p[distance=..1,limit=1] run function vexp:projectile/projectiles/dagger/stuck/pickup

# Limpiar datos para no repetir
data remove entity @s attack
data remove entity @s interaction
