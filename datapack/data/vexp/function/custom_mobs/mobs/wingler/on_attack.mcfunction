# On attack custom feedback
# @s is the custom mob
#execute positioned ^ ^0.5 ^1 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^
#execute positioned ^ ^0.5 ^2 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^
#execute positioned ^ ^0.5 ^3 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^

execute positioned ~ ~0.5 ~ run particle crit ^ ^ ^0.5 0.2 0.2 0.2 0.3 5

function vexp:utils/sound {sound: "minecraft:entity.parrot.hurt", type: "player", pitch:1}
