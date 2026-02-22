# Projectile Setup
# Ejecutado AS @s (marker) AT @s

# Asignar ID
execute unless score #global vexp.id matches 1.. run scoreboard players set #global vexp.id 1
scoreboard players add #global vexp.id 1
scoreboard players operation @s vexp.id = #global vexp.id

# Copiar rotación del jugador
data modify entity @s Rotation set from entity @p[tag=vexp.tnt_thrower,limit=1] Rotation

# Crear el visual
summon item_display ~ ~ ~ {Tags:["vexp.tnt_display","vexp.temp_display"],item:{id:"minecraft:snowball",components:{"minecraft:custom_model_data":{strings:["vexp:tnt_stick"]}}},transformation:{translation:[0f,0f,.75f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.5f,0f,0f,1f],right_rotation:[0f,0f,0f,1f]},item_display:"head",teleport_duration:1,interpolation_duration:1}

# Asignar mismo ID al visual
execute as @e[tag=vexp.temp_display,distance=..1,sort=nearest,limit=1] run scoreboard players operation @s vexp.id = #global vexp.id
tag @e[tag=vexp.temp_display,distance=..1,sort=nearest,limit=1] remove vexp.temp_display

# Fusible (60 ticks = 3 segundos)
scoreboard players set @s vexp.fuse 30
# Estado: 0 = en vuelo, 1 = en suelo
scoreboard players set @s vexp.damage 0 

# Limpiar tags temporales
tag @s remove vexp.temp_projectile
