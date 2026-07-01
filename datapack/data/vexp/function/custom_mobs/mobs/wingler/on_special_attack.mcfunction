# On special attack feedback hook
# @s is the custom mob
execute positioned ~ ~0.5 ~ run particle gust ^ ^ ^1 1 1 1 1 0

execute positioned ^ ^1 ^1 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^ facing entity @p[limit=1]
execute positioned ^ ^1 ^2 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^ facing entity @p[limit=1]
execute positioned ^ ^1 ^3 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^ facing entity @p[limit=1]
execute positioned ^ ^1 ^4 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^ facing entity @p[limit=1]
execute positioned ^ ^1 ^5 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^ facing entity @p[limit=1]
execute positioned ^ ^1 ^6 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^ facing entity @p[limit=1]
execute positioned ^ ^1 ^8 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^ facing entity @p[limit=1]
execute positioned ^ ^1 ^9 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^ facing entity @p[limit=1]
execute positioned ^ ^1 ^10 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^ facing entity @p[limit=1]
execute positioned ^ ^1 ^11 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^ facing entity @p[limit=1]
execute positioned ^ ^1 ^12 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^ facing entity @p[limit=1]

function vexp:utils/sound {sound: "minecraft:entity.wind_charge.wind_burst", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.parrot.imitate.phantom", type: "player"}
