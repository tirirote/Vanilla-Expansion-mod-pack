# When target hitted by special attack
# @s is the target
execute if block ^ ^1 ^-1 #replaceable run tp @s ^ ^1 ^-1
execute if block ^ ^1 ^-2 #replaceable run tp @s ^ ^1 ^-2
execute if block ^ ^1 ^-3 #replaceable run tp @s ^ ^1 ^-3

particle crit ~ ~1 ~ 0.35 0.35 0.35 0.3 15
particle gust ~ ~1 ~ 1 1 1 1 0

effect give @s slowness 5 2 true

function vexp:utils/sound {sound: "minecraft:entity.breeze.wind_burst", type: "player"}
