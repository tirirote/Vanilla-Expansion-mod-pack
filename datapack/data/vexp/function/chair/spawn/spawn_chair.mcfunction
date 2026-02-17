# Macro para spawnear cualquier silla
# Input variable: $(wood) -> "oak", "spruce", etc.

$summon item_display ~ ~ ~ {Tags:["vexp.chair","vexp.chair.$(wood)","vexp.temp"],item:{id:"minecraft:item_frame",components:{"minecraft:custom_model_data":{strings:["vexp:$(wood)_chair"]}}}}

# Setup común
execute as @e[tag=vexp.temp,sort=nearest,limit=1,distance=..0.5] at @s run function vexp:chair/setup

# Transferir tag de variante a la interacción
$execute as @e[type=interaction,tag=vexp.temp_interact,sort=nearest,limit=1,distance=..0.5] run tag @s add vexp.chair.$(wood)
