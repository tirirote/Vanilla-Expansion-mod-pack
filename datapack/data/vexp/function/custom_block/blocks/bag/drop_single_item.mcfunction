# Macro: summonea un item en la posición actual desde el NBT almacenado
# Se ejecuta AT la posición de la interaction
# Requiere: bag_item_id en data.vexp

$summon item ~ ~ ~ {Tags:["vexp.bag.loot"],Item:{id:"$(bag_item_id)",count:1}}

execute as @e[type=item,tag=vexp.bag.loot,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":10,"scale":0.01}

tag @e[type=item,tag=vexp.bag.loot,sort=nearest,limit=1,distance=..1] remove vexp.bag.loot
