# Waiting for special attack
# @s is the custom mob
execute if score @s vexp.rand matches ..49 if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^ ~45 ~12
execute if score @s vexp.rand matches 50.. if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^ ~-45 ~12

execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.5,0.4,0.2], finalColor: [0.15, 0.1, 0.1], scale: 0.8, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 1, count: 1}

