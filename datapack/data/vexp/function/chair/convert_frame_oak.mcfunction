# Convertir Item Frame en Silla
# Ejecutado AS y AT el Item Frame que está en el suelo

# 1. Invocar la silla en el centro del bloque
# Importante: Spawnear sin rotación inicial forzada para luego aplicarla nosotros
execute at @s align xyz positioned ~0.5 ~0.5 ~0.5 run function vexp:chair/spawn/spawn_oak

# 2. Capturar y Aplicar Rotación
# Los Item Frames en el suelo tienen Rotation: 0-7 (45 grados cada paso)
# Rotation 0 apunta al SUR (Z+). Rotation 4 al NORTE (Z-).
# Ajusta estos valores si tu modelo sale girado.
# (Si el modelo sale mirando al revés, cambia 180 por 0, -90 por 90, etc.)

# Rotación 0 (Sur) -> 180 grados
execute if data entity @s {Rotation:0b} as @e[tag=vexp.chair,distance=..0.1] run data merge entity @s {Rotation:[180f,0f]}
execute if data entity @s {Rotation:0b} as @e[tag=vexp.chair_interact,distance=..0.1] run data merge entity @s {Rotation:[180f,0f]}

# Rotación 2 (Este, izquierda) -> -90 grados
execute if data entity @s {Rotation:2b} as @e[tag=vexp.chair,distance=..0.1] run data merge entity @s {Rotation:[-90f,0f]}
execute if data entity @s {Rotation:2b} as @e[tag=vexp.chair_interact,distance=..0.1] run data merge entity @s {Rotation:[-90f,0f]}

# Rotación 4 (Norte, arriba) -> 0 grados
execute if data entity @s {Rotation:4b} as @e[tag=vexp.chair,distance=..0.1] run data merge entity @s {Rotation:[0f,0f]}
execute if data entity @s {Rotation:4b} as @e[tag=vexp.chair_interact,distance=..0.1] run data merge entity @s {Rotation:[0f,0f]}

# Rotación 6 (Oeste, derecha) -> 90 grados
execute if data entity @s {Rotation:6b} as @e[tag=vexp.chair,distance=..0.1] run data merge entity @s {Rotation:[90f,0f]}
execute if data entity @s {Rotation:6b} as @e[tag=vexp.chair_interact,distance=..0.1] run data merge entity @s {Rotation:[90f,0f]}

# Diagonales (1, 3, 5, 7)
execute if data entity @s {Rotation:1b} as @e[tag=vexp.chair,distance=..0.1] run data merge entity @s {Rotation:[-135f,0f]}
execute if data entity @s {Rotation:1b} as @e[tag=vexp.chair_interact,distance=..0.1] run data merge entity @s {Rotation:[-135f,0f]}

execute if data entity @s {Rotation:3b} as @e[tag=vexp.chair,distance=..0.1] run data merge entity @s {Rotation:[-45f,0f]}
execute if data entity @s {Rotation:3b} as @e[tag=vexp.chair_interact,distance=..0.1] run data merge entity @s {Rotation:[-45f,0f]}

execute if data entity @s {Rotation:5b} as @e[tag=vexp.chair,distance=..0.1] run data merge entity @s {Rotation:[45f,0f]}
execute if data entity @s {Rotation:5b} as @e[tag=vexp.chair_interact,distance=..0.1] run data merge entity @s {Rotation:[45f,0f]}

execute if data entity @s {Rotation:7b} as @e[tag=vexp.chair,distance=..0.1] run data merge entity @s {Rotation:[135f,0f]}
execute if data entity @s {Rotation:7b} as @e[tag=vexp.chair_interact,distance=..0.1] run data merge entity @s {Rotation:[135f,0f]}

# 3. Eliminar el Item Frame
kill @s
