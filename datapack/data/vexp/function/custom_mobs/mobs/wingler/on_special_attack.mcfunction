# On special attack feedback hook
# @s is the custom mob

execute positioned ^ ^1 ^1 if block ^ ^-0.5 ^ #replaceable run tp @s ^ ^-0.5 ^ facing entity @e[tag=vexp.mob_target,sort=nearest,limit=1]
execute positioned ^ ^1 ^2 if block ^ ^-0.5 ^ #replaceable run tp @s ^ ^-0.5 ^ facing entity @e[tag=vexp.mob_target,sort=nearest,limit=1]
execute positioned ^ ^1 ^3 if block ^ ^-0.5 ^ #replaceable run tp @s ^ ^-0.5 ^ facing entity @e[tag=vexp.mob_target,sort=nearest,limit=1]
execute positioned ^ ^1 ^4 if block ^ ^-0.5 ^ #replaceable run tp @s ^ ^-0.5 ^ facing entity @e[tag=vexp.mob_target,sort=nearest,limit=1]
execute positioned ^ ^1 ^5 if block ^ ^-0.5 ^ #replaceable run tp @s ^ ^-0.5 ^ facing entity @e[tag=vexp.mob_target,sort=nearest,limit=1]
execute positioned ^ ^1 ^6 if block ^ ^-0.5 ^ #replaceable run tp @s ^ ^-0.5 ^ facing entity @e[tag=vexp.mob_target,sort=nearest,limit=1]

function vexp:utils/sound {sound: "minecraft:entity.breeze.jump", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.parrot.imitate.phantom", type: "player", pitch:1}
