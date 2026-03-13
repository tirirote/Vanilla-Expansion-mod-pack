# spawn.mcfunction
# Macro para spawnear un bloque personalizado basado en datos
# Input: $(id), $(model), $(item_model), $(width), $(height), $(type), $(name), $(s_place), $(s_break), $(p_break)

# 1. Spawn Visual (item_display)
# Lo colocamos alineado en el centro del bloque
$execute at @s run summon item_display ~ ~ ~ {Tags:["vexp.custom_block.display","vexp.temp"],item:{id:"minecraft:item_frame",count:1,components:{"minecraft:custom_model_data":{strings:["$(model)"]}}},transformation:{left_rotation:[0f,1f,0f,0f],right_rotation:[0f,0f,0f,1f],translation:[0f,.5f,0f],scale:[1f,1f,1f]},teleport_duration:1,interpolation_duration:1}

# 2. Rotación: Copiar del Jugador y girar 180 (para que mire al jugador)
execute as @e[tag=vexp.temp,sort=nearest,distance=..1,limit=1] run data modify entity @s Rotation[0] set from entity @p[limit=1] Rotation[0]
# 3. Vincular ID global
execute unless score #global vexp.id matches 1.. run scoreboard players set #global vexp.id 1
scoreboard players add #global vexp.id 1
execute as @e[tag=vexp.temp,sort=nearest,distance=..1,limit=1] run scoreboard players operation @s vexp.id = #global vexp.id

# 4. Spawn Interaction (Hitbox)
# Alineado igual que el display
$execute at @s run summon interaction ~ ~ ~ {Tags:["vexp.custom_block.interact","vexp.temp_interact"],width:$(width),height:$(height)}

# 5. Configurar Interaction
execute as @e[tag=vexp.temp_interact,sort=nearest,distance=..1,limit=1] run scoreboard players operation @s vexp.id = #global vexp.id
# Copiar rotación del display a la interacción
execute as @e[tag=vexp.temp_interact,sort=nearest,distance=..1,limit=1] run data modify entity @s Rotation set from entity @e[tag=vexp.custom_block.display,tag=vexp.temp,sort=nearest,distance=..1,limit=1] Rotation

# 6. Guardar metadatos en la interacción (para Break e Interacción)
execute as @e[tag=vexp.temp_interact,sort=nearest,distance=..1,limit=1] run data modify entity @s data.vexp set from storage vexp:custom_block placement

# 7. Limpieza y Sonido
tag @e[tag=vexp.temp,sort=nearest,distance=..1,limit=1] remove vexp.temp
tag @e[tag=vexp.temp_interact,sort=nearest,distance=..1,limit=1] remove vexp.temp_interact

# Hook para lógica específica de spawn (opcional)
$function vexp:custom_block/blocks/$(type)/on_spawn

# Sonido de colocación genérico
$function vexp:custom_block/macro/sound {sound:"$(s_place)"}