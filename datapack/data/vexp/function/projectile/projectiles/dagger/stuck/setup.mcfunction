# Stuck Setup
# Ejecutado AS @s (new marker) AT @s

# This marker already inherits projectile ID from on_hit_block

# Spawnear visual dinámico según material
execute if entity @s[tag=vexp.wood] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual","vexp.temp_stuck_visual"],item:{id:"minecraft:wooden_sword",components:{"minecraft:custom_model_data":{strings:["vexp:wooden_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.25f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]},interpolation_duration:1,teleport_duration:1}
execute if entity @s[tag=vexp.stone] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual","vexp.temp_stuck_visual"],item:{id:"minecraft:stone_sword",components:{"minecraft:custom_model_data":{strings:["vexp:stone_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.25f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]},interpolation_duration:1,teleport_duration:1}
execute if entity @s[tag=vexp.iron] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual","vexp.temp_stuck_visual"],item:{id:"minecraft:iron_sword",components:{"minecraft:custom_model_data":{strings:["vexp:iron_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.25f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]},interpolation_duration:1,teleport_duration:1}
execute if entity @s[tag=vexp.bone] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual","vexp.temp_stuck_visual"],item:{id:"minecraft:iron_sword",components:{"minecraft:custom_model_data":{strings:["vexp:bone_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.25f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]},interpolation_duration:1,teleport_duration:1}
execute if entity @s[tag=vexp.gold] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual","vexp.temp_stuck_visual"],item:{id:"minecraft:golden_sword",components:{"minecraft:custom_model_data":{strings:["vexp:golden_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.25f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]},interpolation_duration:1,teleport_duration:1}

execute if entity @s[tag=vexp.diamond] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual","vexp.temp_stuck_visual"],item:{id:"minecraft:diamond_sword",components:{"minecraft:custom_model_data":{strings:["vexp:diamond_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.5f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]},interpolation_duration:1,teleport_duration:1}
execute if entity @s[tag=vexp.glowing] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual","vexp.temp_stuck_visual"],item:{id:"minecraft:diamond_sword",components:{"minecraft:custom_model_data":{strings:["vexp:glowing_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.25f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]},interpolation_duration:1,teleport_duration:1}

execute if entity @s[tag=vexp.copper] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual","vexp.temp_stuck_visual"],item:{id:"minecraft:copper_sword",components:{"minecraft:custom_model_data":{strings:["vexp:copper_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.25f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]},interpolation_duration:1,teleport_duration:1}
execute if entity @s[tag=vexp.netherite] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual","vexp.temp_stuck_visual"],item:{id:"minecraft:netherite_sword",components:{"minecraft:custom_model_data":{strings:["vexp:netherite_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.25f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]},interpolation_duration:1,teleport_duration:1}
execute if entity @s[tag=vexp.echo] run summon item_display ~ ~ ~ {Tags:["vexp.dagger_stuck_visual","vexp.temp_stuck_visual"],item:{id:"minecraft:netherite_sword",components:{"minecraft:custom_model_data":{strings:["vexp:resonance_dagger"]}}},transformation:{translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f],left_rotation:[-.25f,.5f,.5f,0f],right_rotation:[0f,0f,0f,1f]},interpolation_duration:1,teleport_duration:1}

execute run summon interaction ~ ~ ~ {Tags:["vexp.dagger_stuck_interact","vexp.temp_stuck_interact"],width:0.8f,height:1.5f}

# Rotar el visual para que apunte hacia adelante (Copiando del marcador @s)
data modify entity @e[type=item_display,tag=vexp.temp_stuck_visual,sort=nearest,distance=..0.5,limit=1] Rotation set from entity @s Rotation

# Vincular visual e interacción al marker por ID (Usamos @s que es el marcador ejecutando el setup)
scoreboard players operation @e[type=item_display,tag=vexp.temp_stuck_visual,distance=..1.5,limit=1] vexp.id = @s vexp.id
scoreboard players operation @e[type=interaction,tag=vexp.temp_stuck_interact,distance=..1.5,limit=1] vexp.id = @s vexp.id

tag @e[tag=vexp.temp_stuck_visual,distance=..1.5] remove vexp.temp_stuck_visual
tag @e[tag=vexp.temp_stuck_interact,distance=..1.5] remove vexp.temp_stuck_interact

# Limpiar tags temporales
tag @e[tag=vexp.dagger_target,sort=nearest,limit=1] remove vexp.dagger_target
tag @s remove vexp.temp_stuck

# Inicializar animación
scoreboard players set @s vexp.anim_frame 0

# Inicializar temporizador de sangrado para este marker clavado.
scoreboard players set @s vexp.timer 20
