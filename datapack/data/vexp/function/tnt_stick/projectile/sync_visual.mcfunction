# Projectile Visual Sync & Animation
# Ejecutado AS @s (item_display) AT @s (item_display, posicionado en el marker)

# 1. Ajustar posición al marker (manteniendo rotación propia del visual)
tp @s ~ ~ ~ ~ ~

# 2. Rotación Progresiva en vuelo
# Si el proyectil (marker) tiene damage 0, está en vuelo
execute if score @n[tag=vexp.tnt_projectile,limit=1,distance=..1] vexp.damage matches 0 run tp @s ~ ~ ~ ~15 ~10

# 3. Animación de Balanceo (wobble) al aterrizar
# Usamos vexp.damage como timer de aterrizaje
# Inclinación hacia adelante
execute if score @n[tag=vexp.tnt_projectile,limit=1,distance=..1] vexp.damage matches 2..6 run tp @s ~ ~ ~ ~ ~-35
# Inclinación hacia atrás
execute if score @n[tag=vexp.tnt_projectile,limit=1,distance=..1] vexp.damage matches 7..11 run tp @s ~ ~ ~ ~ ~5
# Inclinación de retorno
execute if score @n[tag=vexp.tnt_projectile,limit=1,distance=..1] vexp.damage matches 12..16 run tp @s ~ ~ ~ ~ ~-5
