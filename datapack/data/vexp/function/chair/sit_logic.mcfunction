# Ejecutado como el JUGADOR

# 1. Marcarnos como sentado
tag @s add vexp.is_sitting

# 2. Marcar la silla original como ocupada
tag @e[tag=vexp.current_chair,limit=1] add vexp.occupied

# 3. Invocar la montura EXACTAMENTE en la silla marcada
execute at @e[tag=vexp.current_chair,limit=1] run summon armor_stand ~ ~ ~ {Tags:["vexp.chair_mount","vexp.temp"],Invisible:1b,Marker:1b,NoGravity:1b,Small:1b}

# 4. Sincronizar rotación con la silla visual
execute at @e[tag=vexp.current_chair,limit=1] as @e[tag=vexp.temp,limit=1] run data modify entity @s Rotation set from entity @e[type=item_display,tag=vexp.chair,distance=..1,limit=1] Rotation

# 5. ¡Sentarse!
ride @s mount @e[tag=vexp.temp,limit=1]

# 6. Limpieza
tag @e[tag=vexp.temp] remove vexp.temp
