# Ejecutado como la INTERACTION (Silla)

# 1. Marcarnos temporalmente para ser encontrados
tag @s add vexp.current_killer

# 2. Eliminar el modelo visual que tenga MI MISMO ID
execute at @s as @e[type=item_display,tag=vexp.chair,distance=..4] if score @s vexp.id = @e[tag=vexp.current_killer,limit=1] vexp.id run kill @s

# 3. Limpiar monturas
execute at @s run kill @e[type=armor_stand,tag=vexp.chair_mount,distance=..1,limit=1]

# 4. Soltar Item según Tipo (Oak, Spruce, etc.)
# Usamos tag común vexp.place_chair para el futuro tick global
# Oak
execute if entity @s[tag=vexp.chair.oak] run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:entity_data":{id:"minecraft:item_frame",Tags:["vexp.place_chair","vexp.place_chair.oak"],Invisible:1b,Fixed:1b,Silent:1b,NoGravity:1b},"minecraft:custom_model_data":{strings:["vexp:oak_chair"]},"minecraft:item_name":{"text":"Silla de Roble","italic":false}}}}
#Pale Oak
execute if entity @s[tag=vexp.chair.pale_oak] run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:entity_data":{id:"minecraft:item_frame",Tags:["vexp.place_chair","vexp.place_chair.pale_oak"],Invisible:1b,Fixed:1b,Silent:1b,NoGravity:1b},"minecraft:custom_model_data":{strings:["vexp:pale_oak_chair"]},"minecraft:item_name":{"text":"Silla de Roble Pálido","italic":false}}}}

# Spruce
execute if entity @s[tag=vexp.chair.spruce] run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:entity_data":{id:"minecraft:item_frame",Tags:["vexp.place_chair","vexp.place_chair.spruce"],Invisible:1b,Fixed:1b,Silent:1b,NoGravity:1b},"minecraft:custom_model_data":{strings:["vexp:spruce_chair"]},"minecraft:item_name":{"text":"Silla de Abeto","italic":false}}}}
# Birch
execute if entity @s[tag=vexp.chair.birch] run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:entity_data":{id:"minecraft:item_frame",Tags:["vexp.place_chair","vexp.place_chair.birch"],Invisible:1b,Fixed:1b,Silent:1b,NoGravity:1b},"minecraft:custom_model_data":{strings:["vexp:birch_chair"]},"minecraft:item_name":{"text":"Silla de Abedul","italic":false}}}}
# Jungle
execute if entity @s[tag=vexp.chair.jungle] run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:entity_data":{id:"minecraft:item_frame",Tags:["vexp.place_chair","vexp.place_chair.jungle"],Invisible:1b,Fixed:1b,Silent:1b,NoGravity:1b},"minecraft:custom_model_data":{strings:["vexp:jungle_chair"]},"minecraft:item_name":{"text":"Silla de Jungla","italic":false}}}}
# Acacia
execute if entity @s[tag=vexp.chair.acacia] run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:entity_data":{id:"minecraft:item_frame",Tags:["vexp.place_chair","vexp.place_chair.acacia"],Invisible:1b,Fixed:1b,Silent:1b,NoGravity:1b},"minecraft:custom_model_data":{strings:["vexp:acacia_chair"]},"minecraft:item_name":{"text":"Silla de Acacia","italic":false}}}}
# Dark Oak
execute if entity @s[tag=vexp.chair.dark_oak] run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:entity_data":{id:"minecraft:item_frame",Tags:["vexp.place_chair","vexp.place_chair.dark_oak"],Invisible:1b,Fixed:1b,Silent:1b,NoGravity:1b},"minecraft:custom_model_data":{strings:["vexp:dark_oak_chair"]},"minecraft:item_name":{"text":"Silla de Roble Oscuro","italic":false}}}}
# Mangrove
execute if entity @s[tag=vexp.chair.mangrove] run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:entity_data":{id:"minecraft:item_frame",Tags:["vexp.place_chair","vexp.place_chair.mangrove"],Invisible:1b,Fixed:1b,Silent:1b,NoGravity:1b},"minecraft:custom_model_data":{strings:["vexp:mangrove_chair"]},"minecraft:item_name":{"text":"Silla de Manglar","italic":false}}}}
# Cherry
execute if entity @s[tag=vexp.chair.cherry] run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:entity_data":{id:"minecraft:item_frame",Tags:["vexp.place_chair","vexp.place_chair.cherry"],Invisible:1b,Fixed:1b,Silent:1b,NoGravity:1b},"minecraft:custom_model_data":{strings:["vexp:cherry_chair"]},"minecraft:item_name":{"text":"Silla de Cerezo","italic":false}}}}
# Bamboo
execute if entity @s[tag=vexp.chair.bamboo] run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:entity_data":{id:"minecraft:item_frame",Tags:["vexp.place_chair","vexp.place_chair.bamboo"],Invisible:1b,Fixed:1b,Silent:1b,NoGravity:1b},"minecraft:custom_model_data":{strings:["vexp:bamboo_chair"]},"minecraft:item_name":{"text":"Silla de Bambú","italic":false}}}}
# Crimson
execute if entity @s[tag=vexp.chair.crimson] run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:entity_data":{id:"minecraft:item_frame",Tags:["vexp.place_chair","vexp.place_chair.crimson"],Invisible:1b,Fixed:1b,Silent:1b,NoGravity:1b},"minecraft:custom_model_data":{strings:["vexp:crimson_chair"]},"minecraft:item_name":{"text":"Silla Carmesí","italic":false}}}}
# Warped
execute if entity @s[tag=vexp.chair.warped] run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:entity_data":{id:"minecraft:item_frame",Tags:["vexp.place_chair","vexp.place_chair.warped"],Invisible:1b,Fixed:1b,Silent:1b,NoGravity:1b},"minecraft:custom_model_data":{strings:["vexp:warped_chair"]},"minecraft:item_name":{"text":"Silla Distorsionada","italic":false}}}}

# 5. Efectos (Sonido + Partículas)
execute at @s run playsound minecraft:block.wood.break block @a ~ ~ ~ 1 1

execute if entity @s[tag=vexp.chair.oak] run particle block{block_state:{Name:"oak_planks"}} ~ ~0.5 ~ 0.15 0.35 0.15 1 50
execute if entity @s[tag=vexp.chair.pale_oak] run particle block{block_state:{Name:"pale_oak_planks"}} ~ ~0.5 ~ 0.15 0.35 0.15 1 50
execute if entity @s[tag=vexp.chair.spruce] run particle block{block_state:{Name:"spruce_planks"}} ~ ~0.5 ~ 0.15 0.35 0.15 1 50
execute if entity @s[tag=vexp.chair.birch] run particle block{block_state:{Name:"birch_planks"}} ~ ~0.5 ~ 0.15 0.35 0.15 1 50
execute if entity @s[tag=vexp.chair.jungle] run particle block{block_state:{Name:"jungle_planks"}} ~ ~0.5 ~ 0.15 0.35 0.15 1 50
execute if entity @s[tag=vexp.chair.acacia] run particle block{block_state:{Name:"acacia_planks"}} ~ ~0.5 ~ 0.15 0.35 0.15 1 50
execute if entity @s[tag=vexp.chair.dark_oak] run particle block{block_state:{Name:"dark_oak_planks"}} ~ ~0.5 ~ 0.15 0.35 0.15 1 50
execute if entity @s[tag=vexp.chair.mangrove] run particle block{block_state:{Name:"mangrove_planks"}} ~ ~0.5 ~ 0.15 0.35 0.15 1 50
execute if entity @s[tag=vexp.chair.cherry] run particle block{block_state:{Name:"cherry_planks"}} ~ ~0.5 ~ 0.15 0.35 0.15 1 50
execute if entity @s[tag=vexp.chair.bamboo] run particle block{block_state:{Name:"bamboo_planks"}} ~ ~0.5 ~ 0.15 0.35 0.15 1 50
execute if entity @s[tag=vexp.chair.crimson] run particle block{block_state:{Name:"crimson_planks"}} ~ ~0.5 ~ 0.15 0.35 0.15 1 50
execute if entity @s[tag=vexp.chair.warped] run particle block{block_state:{Name:"warped_planks"}} ~ ~0.5 ~ 0.15 0.35 0.15 1 50

# 6. Limpieza final
data remove entity @s attack
kill @s