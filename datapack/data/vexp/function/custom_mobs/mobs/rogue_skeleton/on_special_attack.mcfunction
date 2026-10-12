#On special attack
execute store result score #skeleton_highguard_dash vexp.math run random value 0..3

#Sideways dash
execute if score #skeleton_highguard_dash vexp.math matches 1 if block ^-1 ^ ^ #replaceable run tp @s ^-1 ^ ^ facing entity @p
execute if score #skeleton_highguard_dash vexp.math matches 1 if block ^-2 ^ ^ #replaceable run tp @s ^-2 ^ ^ facing entity @p

execute if score #skeleton_highguard_dash vexp.math matches 2 if block ^1 ^ ^ #replaceable run tp @s ^1 ^ ^ facing entity @p
execute if score #skeleton_highguard_dash vexp.math matches 2 if block ^2 ^ ^ #replaceable run tp @s ^2 ^ ^ facing entity @p
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player", pitch:1}
