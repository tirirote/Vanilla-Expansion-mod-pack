# Waiting for special attack
# @s is the custom mob
execute if block ^ ^0.1 ^0.1 #replaceable run tp @s ^ ^ ^0.01 facing entity @p[limit=1] eyes
execute unless block ^ ^0.1 ^0.1 #replaceable run tp @s ^ ^ ^-0.01 facing entity @p[limit=1] eyes

# Feedback
execute positioned ~ ~0.35 ~ positioned ^ ^ ^0.75 run function vexp:utils/feedback/dust_particle {initialColor: [0.5,0.4,0.2], finalColor: [0.15, 0.1, 0.1], scale: 1.7, dX: 0, dY: 0, dZ: 0, speed: 1, count: 1}
execute if block ~ ~-0.5 ~ #soul_fire_base_blocks positioned ~ ~0.45 ~ run particle soul_fire_flame ^ ^ ^0.85 0 0 0 0 0
execute unless block ~ ~-0.5 ~ #soul_fire_base_blocks positioned ~ ~0.45 ~ run particle flame ^ ^ ^0.85 0 0 0 0 0
