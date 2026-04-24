# dungeons/nether/projectile/on_tick.mcfunction
particle minecraft:entity_effect{color:2032356461} ~ ~ ~ 0.2 0 0.2 0 3
particle minecraft:entity_effect{color:-1978951775} ~ ~ ~ 0.2 0 0.2 0 3

execute if score @s vexp.proj_lifetime matches ..10 run particle glow ~ ~ ~ 0.5 0.1 0.5 0 1

execute if score @s vexp.proj_lifetime matches ..15 run particle ominous_spawning ~ ~ ~ 0.5 0.1 0.5 0.02 1
execute if score @s vexp.proj_lifetime matches ..15 run particle squid_ink ~ ~ ~ 0.5 0 0.5 0.02 1
execute if score @s vexp.proj_lifetime matches ..15 run particle instant_effect{color:7733213} ~ ~ ~ 0.5 0 0.5 0.1 1

execute if score @s vexp.proj_lifetime matches 15.. run function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.7, 0.7], scale: 0.8, dX: 0.2, dY: 0, dZ: 0.2, speed: 0.05, count: 5}
execute if score @s vexp.proj_lifetime matches ..15 run function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.7, 0.7], scale: 1.7, dX: 0.5, dY: 0, dZ: 0.5, speed: 0.05, count: 15}
