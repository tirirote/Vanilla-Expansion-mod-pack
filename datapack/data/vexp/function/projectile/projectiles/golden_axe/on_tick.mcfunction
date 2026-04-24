# dungeons/nether/projectile/on_tick.mcfunction
particle minecraft:entity_effect{color:2130688031} ~ ~ ~ 0.2 0 0.2 0 3
particle instant_effect{color:16763707} ~ ~ ~ 0.5 0.1 0.5 0 1

execute if score @s vexp.proj_lifetime matches 19.. run particle flash{color:-655515} ~ ~ ~ 0.0 0.0 0.0 1 0

execute if score @s vexp.proj_lifetime matches ..5 run particle end_rod ~ ~ ~ .2 0 .2 0.1 1
execute if score @s vexp.proj_lifetime matches ..5 run particle instant_effect{color:16776562} ~ ~ ~ 0.5 0.1 0.5 0 3

execute if score @s vexp.proj_lifetime matches ..10 run particle crit ~ ~ ~ 0.5 0 0.5 0.5 25
execute if score @s vexp.proj_lifetime matches 10.. run particle crit ~ ~ ~ 0.2 0 0.2 0.1 3

execute if score @s vexp.proj_lifetime matches 10.. run function vexp:utils/feedback/dust_particle {initialColor: [0.75, 0.7, 0.4], finalColor: [0.9, 0.9, 0.75], scale: 0.8, dX: 0.2, dY: 0, dZ: 0.2, speed: 0.05, count: 5}
execute if score @s vexp.proj_lifetime matches ..10 run function vexp:utils/feedback/dust_particle {initialColor: [0.75, 0.7, 0.4], finalColor: [0.9, 0.9, 0.75], scale: 1.7, dX: 0.5, dY: 0, dZ: 0.5, speed: 0.05, count: 10}
