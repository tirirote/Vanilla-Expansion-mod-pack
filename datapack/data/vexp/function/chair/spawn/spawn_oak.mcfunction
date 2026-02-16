# Summon the chair model (The "Root" entity)
summon item_display ~ ~ ~ {Tags:["vexp.chair","vexp.chair.oak","vexp.temp"],item:{id:"minecraft:item_frame",components:{"minecraft:custom_model_data":{strings:["vexp:oak_chair"]}}}}

# Delegate common setup
execute as @e[tag=vexp.temp,sort=nearest,limit=1,distance=..0.5] at @s run function vexp:chair/setup