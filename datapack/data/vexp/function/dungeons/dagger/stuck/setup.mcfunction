# Stuck Setup
# Ejecutado AS @s (new marker) AT @s

# 1. Vincular al mob (usamos IDs o simplemente cercanía para el setup)
# Buscamos al mob con el tag temporal
execute as @e[tag=vexp.dagger_target,limit=1,sort=nearest] run scoreboard players operation @s vexp.id = #global vexp.id
# No, mejor usamos una táctica más simple: el marker se teleporta al mob.

# Asignar ID único para este "stuck"
scoreboard players add #global vexp.id 1
scoreboard players operation @s vexp.id = #global vexp.id

# Spawnear visual dinámico según material
execute if entity @s[tag=vexp.wood] positioned ~ ~-.35 ~ run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual"],item:{id:"minecraft:wooden_sword",components:{"minecraft:custom_model_data":{strings:["vexp:wooden_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.25f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]}}
execute if entity @s[tag=vexp.stone] positioned ~ ~-.35 ~ run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual"],item:{id:"minecraft:stone_sword",components:{"minecraft:custom_model_data":{strings:["vexp:stone_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.25f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]}}
execute if entity @s[tag=vexp.iron] positioned ~ ~-.35 ~ run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual"],item:{id:"minecraft:iron_sword",components:{"minecraft:custom_model_data":{strings:["vexp:iron_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.25f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]}}
execute if entity @s[tag=vexp.gold] positioned ~ ~-.35 ~ run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual"],item:{id:"minecraft:golden_sword",components:{"minecraft:custom_model_data":{strings:["vexp:golden_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.25f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]}}
execute if entity @s[tag=vexp.diamond] positioned ~ ~-.35 ~ run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual"],item:{id:"minecraft:diamond_sword",components:{"minecraft:custom_model_data":{strings:["vexp:diamond_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.25f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]}}
execute if entity @s[tag=vexp.copper] positioned ~ ~-.35 ~ run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual"],item:{id:"minecraft:copper_sword",components:{"minecraft:custom_model_data":{strings:["vexp:copper_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.25f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]}}
execute if entity @s[tag=vexp.netherite] positioned ~ ~-.35 ~ run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual"],item:{id:"minecraft:netherite_sword",components:{"minecraft:custom_model_data":{strings:["vexp:netherite_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.25f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]}}

execute positioned ~ ~-.35 ~ run summon interaction ~ ~ ~ {Tags:["vexp.dagger_stuck_interact"],width:0.8f,height:1.5f}

# Rotar el visual para que apunte hacia adelante (Copiando del marcador @s)
data modify entity @e[tag=vexp.dagger_stuck_visual,sort=nearest,distance=..0.5,limit=1] Rotation set from entity @s Rotation

# Vincular visual e interacción al marker por ID (Usamos @s que es el marcador ejecutando el setup)
scoreboard players operation @e[tag=vexp.dagger_stuck_visual,distance=..1,limit=1] vexp.id = @s vexp.id
scoreboard players operation @e[tag=vexp.dagger_stuck_interact,distance=..1,limit=1] vexp.id = @s vexp.id


# Limpiar tags temporales
tag @e[tag=vexp.dagger_target,sort=nearest,limit=1] remove vexp.dagger_target
tag @s remove vexp.temp_stuck

# Intervalo de desangrado (20 ticks = 1 seg)
scoreboard players set @s vexp.dagger_cooldown 20
