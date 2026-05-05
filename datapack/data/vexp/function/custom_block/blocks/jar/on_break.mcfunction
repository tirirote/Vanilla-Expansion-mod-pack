# on_break.mcfunction
# Se ejecuta AS la interaction del jarrón

# 1. Guardar ID del jarrón para identificar sus items
scoreboard players operation #temp vexp.id = @s vexp.id

# 2. Soltar stack único según el contenido persistido del jar
execute if data entity @s data.vexp.jar_item_id if data entity @s data.vexp.item_count run summon item ~ ~ ~ {Tags:["vexp.jar.loot"],Item:{id:"minecraft:stone",count:1}}
execute if data entity @s data.vexp.jar_item_id if data entity @s data.vexp.item_count as @e[type=item,tag=vexp.jar.loot,sort=nearest,limit=1,distance=..1] run data modify entity @s Item.id set from entity @e[type=interaction,tag=vexp.custom_block.interact,sort=nearest,limit=1,distance=..1] data.vexp.jar_item_id
execute if data entity @s data.vexp.item_count as @e[type=item,tag=vexp.jar.loot,sort=nearest,limit=1,distance=..1] store result entity @s Item.count byte 1 run data get entity @e[type=interaction,tag=vexp.custom_block.interact,sort=nearest,limit=1,distance=..1] data.vexp.item_count
execute as @e[type=item,tag=vexp.jar.loot,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":100,"scale":0.001}
tag @e[type=item,tag=vexp.jar.loot,sort=nearest,limit=1,distance=..1] remove vexp.jar.loot
