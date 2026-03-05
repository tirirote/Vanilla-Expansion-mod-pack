# Projectile Setup
# Ejecutado AS @s (marker) AT @s

# Añadir tag de proyectil
tag @s add vexp.dagger_projectile

# Copiar posición y rotación exacta del jugador (ojos)
data modify entity @s Rotation set from entity @p[tag=vexp.throwing,limit=1] Rotation
# Crear el visual basado en el tag de material
execute if entity @s[tag=vexp.iron] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_display","vexp.temp_display"],item:{id:"minecraft:iron_sword",components:{"minecraft:custom_model_data":{strings:["vexp:iron_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[.7f,.50f,-.30f,1f],right_rotation:[0f,0f,0f,1f]},item_display:"none",teleport_duration:1}
execute if entity @s[tag=vexp.wood] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_display","vexp.temp_display"],item:{id:"minecraft:wooden_sword",components:{"minecraft:custom_model_data":{strings:["vexp:wooden_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[.7f,.50f,-.30f,1f],right_rotation:[0f,0f,0f,1f]},item_display:"none",teleport_duration:1}
execute if entity @s[tag=vexp.stone] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_display","vexp.temp_display"],item:{id:"minecraft:stone_sword",components:{"minecraft:custom_model_data":{strings:["vexp:stone_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[.7f,.50f,-.30f,1f],right_rotation:[0f,0f,0f,1f]},item_display:"none",teleport_duration:1}
execute if entity @s[tag=vexp.gold] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_display","vexp.temp_display"],item:{id:"minecraft:golden_sword",components:{"minecraft:custom_model_data":{strings:["vexp:golden_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[.7f,.50f,-.30f,1f],right_rotation:[0f,0f,0f,1f]},item_display:"none",teleport_duration:1}
execute if entity @s[tag=vexp.diamond] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_display","vexp.temp_display"],item:{id:"minecraft:diamond_sword",components:{"minecraft:custom_model_data":{strings:["vexp:diamond_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[.7f,.50f,-.30f,1f],right_rotation:[0f,0f,0f,1f]},item_display:"none",teleport_duration:1}
execute if entity @s[tag=vexp.copper] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_display","vexp.temp_display"],item:{id:"minecraft:copper_sword",components:{"minecraft:custom_model_data":{strings:["vexp:copper_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[.7f,.50f,-.30f,1f],right_rotation:[0f,0f,0f,1f]},item_display:"none",teleport_duration:1}
execute if entity @s[tag=vexp.netherite] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_display","vexp.temp_display"],item:{id:"minecraft:netherite_sword",components:{"minecraft:custom_model_data":{strings:["vexp:netherite_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[.7f,.50f,-.30f,1f],right_rotation:[0f,0f,0f,1f]},item_display:"none",teleport_duration:1}

# Montar el visual sobre el marker (@s es el marker)
tag @e[tag=vexp.temp_display] remove vexp.temp_display

# Vida del proyectil (para que no vuele infinito)
scoreboard players set @s vexp.id 10

# Quitar tag temporal al lanzador
tag @s remove vexp.temp_projectile