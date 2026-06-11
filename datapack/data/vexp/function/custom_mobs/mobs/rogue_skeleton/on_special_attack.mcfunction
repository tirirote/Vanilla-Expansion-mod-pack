#On special attack
execute store result score #skeleton_highguard_dash vexp.math run random value 0..3

function vexp:utils/feedback/dust_particle {initialColor:[0.5,0.5,0.35],finalColor:[1.0,1.0,1.0],scale:1.7,dX:0.1,dY:0.0,dZ:0.1,speed:0.2,count:3}

#Sideways dash
execute if score #skeleton_highguard_dash vexp.math matches 1 if block ^-1 ^ ^ #replaceable run tp @s ^-1 ^ ^ facing entity @p
execute if score #skeleton_highguard_dash vexp.math matches 1 if block ^-2 ^ ^ #replaceable run tp @s ^-2 ^ ^ facing entity @p

execute if score #skeleton_highguard_dash vexp.math matches 2 if block ^1 ^ ^ #replaceable run tp @s ^1 ^ ^ facing entity @p
execute if score #skeleton_highguard_dash vexp.math matches 2 if block ^2 ^ ^ #replaceable run tp @s ^2 ^ ^ facing entity @p
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
