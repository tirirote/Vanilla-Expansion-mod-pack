# Se ejecuta AS el item_display de la crate

summon item ~ ~ ~ {Tags:["vexp.crate.loot"],Item:{id:"minecraft:stone",count:1}}
execute as @e[type=item,tag=vexp.crate.loot,limit=1,distance=..1] at @s run data modify entity @s Item set from entity @n item
execute as @e[type=item,tag=vexp.crate.loot,limit=1,distance=..1] at @s run function vexp:utils/apply_random_motion {"range":100,"scale":0.001}
tag @e[type=item,tag=vexp.crate.loot,sort=nearest,limit=1,distance=..1] remove vexp.crate.loot
kill @s
