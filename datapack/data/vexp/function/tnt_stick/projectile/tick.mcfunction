# Projectile Tick
# Ejecutado AS @s (marker) AT @s

# 1. Decrementar fusible
scoreboard players remove @s vexp.fuse 1

# Partículas de mecha
execute positioned ^.25 ^ ^.5 run particle minecraft:smoke ~ ~.5 ~ 0 0.1 0 0 1

# 2. Lógica de movimiento (si no está en el suelo)
execute if score @s vexp.damage matches 0 run function vexp:tnt_stick/projectile/move

# 2.5 Contador de aterrizaje (para animación de balanceo)
# Cuando damage es 1, ha aterrizado. Incrementamos hasta 20 para actuar como timer.
execute if score @s vexp.damage matches 1..20 run scoreboard players add @s vexp.damage 1

# 3. Explosión al terminar fusible
execute if score @s vexp.fuse matches ..0 run function vexp:tnt_stick/projectile/explode

# 4. Sincronizar el visual y aplicar animaciones (rotación y balanceo)
execute at @s as @e[tag=vexp.tnt_display] if score @s vexp.id = @n[tag=vexp.tnt_projectile,limit=1,distance=..1] vexp.id run function vexp:tnt_stick/projectile/sync_visual

