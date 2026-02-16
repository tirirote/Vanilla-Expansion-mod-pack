# Ejecutado como el MOB que se va a sentar

# 1. Marcar la silla original como ocupada
tag @e[tag=vexp.current_chair,sort=nearest,distance=..5,limit=1] add vexp.occupied

# 2. Invocar la montura EXACTAMENTE en la silla marcada
execute at @e[tag=vexp.current_chair,sort=nearest,distance=..5,limit=1] run summon armor_stand ~ ~ ~ {Tags:["vexp.chair_mount","vexp.temp"],Invisible:1b,Marker:1b,NoGravity:1b,Small:1b}
# Nota: ~0.4 de altura ayuda a que el mob no quede enterrado visualmente

# 3. Sincronizar rotación con la silla visual
execute at @e[tag=vexp.current_chair,sort=nearest,distance=..5,limit=1] as @e[tag=vexp.temp,sort=nearest,distance=..1,limit=1] run data modify entity @s Rotation set from entity @e[type=item_display,tag=vexp.chair,sort=nearest,distance=..1,limit=1] Rotation

# 4. ¡Sentar al Mob!
ride @s mount @e[tag=vexp.temp,sort=nearest,distance=..5,limit=1]

# 5. Marcar al mob como sentado
tag @s add vexp.is_sitting_mob

# 6. Soltar la correa (Para que no intente seguir al jugador)
# En 1.21 quitar Leash hace que el item caiga al suelo.
data remove entity @s Leash

# 7. Limpieza
tag @e[tag=vexp.temp,sort=nearest,distance=..5,limit=1] remove vexp.temp