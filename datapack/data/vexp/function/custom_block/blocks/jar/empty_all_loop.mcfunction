# Loop recursivo: suelta 1 item por iteracion con motion aleatorio
# Requiere: vexp:custom_block jar_drop.id con el id del item
# Requiere: #count vexp.math con el numero de items restantes
# Se ejecuta AT la posicion del jar

# 1. Invocar el item y asignarle el id correcto
summon item ~ ~ ~ {Tags:["vexp.jar.loot"],Item:{id:"minecraft:stone",count:1}}
execute as @e[type=item,tag=vexp.jar.loot,sort=nearest,limit=1,distance=..1] run data modify entity @s Item.id set from storage vexp:custom_block jar_drop.id

# 2. Aplicar motion aleatorio y limpiar tag
execute as @e[type=item,tag=vexp.jar.loot,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":100,"scale":0.001}
tag @e[type=item,tag=vexp.jar.loot,sort=nearest,limit=1,distance=..1] remove vexp.jar.loot

# 3. Decrementar y continuar si quedan items
scoreboard players remove #count vexp.math 1
execute if score #count vexp.math matches 1.. run function vexp:custom_block/blocks/jar/empty_all_loop
