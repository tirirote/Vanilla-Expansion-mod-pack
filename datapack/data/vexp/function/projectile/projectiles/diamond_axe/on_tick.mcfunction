# dungeons/nether/projectile/on_tick.mcfunction
particle minecraft:entity_effect{color:-2127926122} ~ ~ ~ 0.2 0 0.2 0 3
particle instant_effect{color:49358} ~ ~ ~ 0.5 0.1 0.5 0 1

execute if score @s vexp.proj_lifetime matches 19.. run particle flash{color:-7340061} ~ ~ ~ 0.0 0.0 0.0 1 0

execute if score @s vexp.proj_lifetime matches ..5 run particle end_rod ~ ~ ~ .2 0 .2 0.1 1
execute if score @s vexp.proj_lifetime matches ..5 run particle instant_effect{color:9437155} ~ ~ ~ 0.5 0.1 0.5 0 3

execute if score @s vexp.proj_lifetime matches ..10 run particle enchanted_hit ~ ~ ~ 0.5 0 0.5 0.5 25
execute if score @s vexp.proj_lifetime matches 10.. run particle enchanted_hit ~ ~ ~ 0.2 0 0.2 0.1 3

execute if score @s vexp.proj_lifetime matches 10.. run function vexp:utils/feedback/dust_particle {initialColor: [0.5, 0.7, 0.65], finalColor: [0.6, 0.9, 0.85], scale: 0.8, dX: 0.2, dY: 0, dZ: 0.2, speed: 0.05, count: 5}
execute if score @s vexp.proj_lifetime matches ..10 run function vexp:utils/feedback/dust_particle {initialColor: [0.5, 0.7, 0.65], finalColor: [0.6, 0.9, 0.85], scale: 1.7, dX: 0.5, dY: 0, dZ: 0.5, speed: 0.05, count: 10}
