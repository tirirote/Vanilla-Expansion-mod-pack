# dungeons/nether/projectile/on_tick.mcfunction
particle minecraft:entity_effect{color:2034972465} ~ ~ ~ 0.2 0 0.2 0 3
particle ash ~ ~ ~ 0.5 0.0 0.5 0.1 5

execute if score @s vexp.proj_lifetime matches ..10 run particle lava ~ ~ ~ 0.5 0.1 0.5 0 1

execute if score @s vexp.proj_lifetime matches ..15 run particle flame ~ ~ ~ 0.2 0.1 0.2 0.02 1
execute if score @s vexp.proj_lifetime matches ..15 run particle minecraft:campfire_cosy_smoke ~ ~ ~ 0.5 0 0.5 0 1
execute if score @s vexp.proj_lifetime matches ..15 run particle minecraft:large_smoke ~ ~ ~ 0.5 0 0.5 0.02 1

execute if score @s vexp.proj_lifetime matches 15.. run function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 0.8, dX: 0.2, dY: 0, dZ: 0.2, speed: 0.05, count: 5}
execute if score @s vexp.proj_lifetime matches ..15 run function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 1.7, dX: 0.5, dY: 0, dZ: 0.5, speed: 0.05, count: 15}
