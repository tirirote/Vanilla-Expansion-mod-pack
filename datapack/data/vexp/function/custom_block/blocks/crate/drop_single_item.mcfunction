# Macro: summonea un item en la posición actual desde el NBT almacenado
# Se ejecuta AT la posición de la interaction
# Requiere: crate_break.current = compound de item {id:..., count:..., [components:...]}

$summon item ~ ~ ~ {Tags:["vexp.crate.loot"],Item:$(current)}
execute as @e[type=item,tag=vexp.crate.loot,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":10,"scale":0.01}
tag @e[type=item,tag=vexp.crate.loot,sort=nearest,limit=1,distance=..1] remove vexp.crate.loot
