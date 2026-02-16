# Ejecutado como la INTERACTION (Silla)

# 1. Marcarnos temporalmente para ser encontrados
tag @s add vexp.current_killer

# 2. Eliminar el modelo visual que tenga MI MISMO ID
# IMPORTANTE: Usamos 'at @s' para asegurarnos de que la busqueda ocurre AQUI
execute at @s as @e[type=item_display,tag=vexp.chair,distance=..4] if score @s vexp.id = @e[tag=vexp.current_killer,limit=1] vexp.id run kill @s

# NUEVO: Limpiar la montura (Armor Stand) si hay alguien sentado (Jugador o Mob)
# Buscamos monturas cercanas (vexp.chair_mount) y las eliminamos, lo que forzará el desmontaje
execute at @s run kill @e[type=armor_stand,tag=vexp.chair_mount,distance=..1,limit=1]

# 3. Soltar Item (Usamos el Item Frame especial)
execute at @s run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:entity_data":{id:"minecraft:item_frame",Tags:["vexp.place_chair.oak"],Invisible:1b,Fixed:1b,Silent:1b,NoGravity:1b},"minecraft:custom_model_data":{strings:["vexp:oak_chair"]},"minecraft:item_name":{"text":"Silla de Roble","italic":false},}}}
# 4. Efectos
execute at @s run playsound minecraft:block.wood.break block @a ~ ~ ~ 1 1
execute at @s run particle block{block_state:{Name:"oak_planks"}} ~ ~0.5 ~ 0.15 0.35 0.15 1 50

# 5. Limpieza final
data remove entity @s attack
kill @s