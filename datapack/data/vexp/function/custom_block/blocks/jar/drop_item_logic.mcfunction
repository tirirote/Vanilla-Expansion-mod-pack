# drop_item_logic.mcfunction
# Se ejecuta AS el item_display

# 1. Spawnear entidad ítem
summon item ~ ~ ~ {Tags:["vexp.jar.loot"],Item:{id:"minecraft:stone",count:1}}

# 2. Copiar datos del ítem del display al ítem físico
execute as @e[type=item,tag=vexp.jar.loot,limit=1,distance=..1] at @s run data modify entity @s Item set from entity @n item

execute as @e[type=item,tag=vexp.jar.loot,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":100,"scale":0.001}
# 3. Limpieza final
tag @e[tag=vexp.jar.loot,sort=nearest,limit=1,distance=..1] remove vexp.jar.loot
kill @s
