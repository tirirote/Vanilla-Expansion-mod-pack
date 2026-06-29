# On special attack feedback hook
# @s is the custom mob

execute if block ^ ^0.1 ^-0.1 #replaceable run tp @s ^ ^0.5 ^-0.5 facing entity @p[limit=1] eyes

execute positioned ~ ~0.35 ~ run particle flash{color:-4637952} ^ ^ ^1 1 1 1 1 0

execute positioned ~ ~0.35 ~ positioned ^ ^ ^1.5 run function vexp:utils/feedback/dust_particle {initialColor: [0.5,0.4,0.2], finalColor: [0.15, 0.1, 0.1], scale: 1.7, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 1, count: 3}
execute positioned ~ ~0.35 ~ positioned ^ ^ ^2 run function vexp:utils/feedback/dust_particle {initialColor: [0.5,0.4,0.2], finalColor: [0.15, 0.1, 0.1], scale: 1.7, dX: 0.1, dY: 0.1, dZ: 0.1, speed: 1, count: 2}
execute positioned ~ ~0.35 ~ positioned ^ ^ ^2.5 run function vexp:utils/feedback/dust_particle {initialColor: [0.5,0.4,0.2], finalColor: [0.15, 0.1, 0.1], scale: 1.7, dX: 0.1, dY: 0.1, dZ: 0.1, speed: 1, count: 2}
execute positioned ~ ~0.35 ~ positioned ^ ^ ^3 run function vexp:utils/feedback/dust_particle {initialColor: [0.5,0.4,0.2], finalColor: [0.15, 0.1, 0.1], scale: 1.7, dX: 0.1, dY: 0.1, dZ: 0.1, speed: 1, count: 2}
execute positioned ~ ~0.35 ~ positioned ^ ^ ^3.5 run function vexp:utils/feedback/dust_particle {initialColor: [0.5,0.4,0.2], finalColor: [0.15, 0.1, 0.1], scale: 1.7, dX: 0.1, dY: 0.1, dZ: 0.1, speed: 1, count: 2}

execute if block ~ ~-0.5 ~ #soul_fire_base_blocks positioned ~ ~0.35 ~ run particle soul_fire_flame ^ ^ ^1.5 0.1 0.1 0.1 0.05 1
execute if block ~ ~-0.5 ~ #soul_fire_base_blocks positioned ~ ~0.35 ~ run particle soul_fire_flame ^ ^ ^2 0 0 0 0 0
execute if block ~ ~-0.5 ~ #soul_fire_base_blocks positioned ~ ~0.35 ~ run particle soul_fire_flame ^ ^ ^2.5 0 0 0 0 0
execute if block ~ ~-0.5 ~ #soul_fire_base_blocks positioned ~ ~0.35 ~ run particle soul_fire_flame ^ ^ ^3 0 0 0 0 0
execute if block ~ ~-0.5 ~ #soul_fire_base_blocks positioned ~ ~0.35 ~ run particle soul_fire_flame ^ ^ ^3.5 0 0 0 0 0

execute unless block ~ ~-0.5 ~ #soul_fire_base_blocks positioned ~ ~0.35 ~ run particle flame ^ ^ ^1.5 0.1 0.1 0.1 0.05 1
execute unless block ~ ~-0.5 ~ #soul_fire_base_blocks positioned ~ ~0.35 ~ run particle flame ^ ^ ^2 0 0 0 0 0
execute unless block ~ ~-0.5 ~ #soul_fire_base_blocks positioned ~ ~0.35 ~ run particle flame ^ ^ ^2.5 0 0 0 0 0
execute unless block ~ ~-0.5 ~ #soul_fire_base_blocks positioned ~ ~0.35 ~ run particle flame ^ ^ ^3 0 0 0 0 0
execute unless block ~ ~-0.5 ~ #soul_fire_base_blocks positioned ~ ~0.35 ~ run particle flame ^ ^ ^3.5 0 0 0 0 0


execute positioned ~ ~0.35 ~ run particle crit ^ ^ ^1.5 0.1 0.1 0.1 0.2 1
execute positioned ~ ~0.35 ~ run particle crit ^ ^ ^2 0.1 0.1 0.1 0.2 1
execute positioned ~ ~0.35 ~ run particle crit ^ ^ ^2.5 0.1 0.1 0.1 0.2 1
execute positioned ~ ~0.35 ~ run particle crit ^ ^ ^3 0.1 0.1 0.1 0.2 1
execute positioned ~ ~0.35 ~ run particle crit ^ ^ ^3.5 0.1 0.1 0.1 0.2 5

# Fire
execute positioned ^ ^ ^2.5 if block ~ ~ ~ #replaceable run setblock ~ ~ ~ fire
execute positioned ^ ^ ^4.5 if block ~ ~ ~ #replaceable run setblock ~ ~ ~ fire

function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
