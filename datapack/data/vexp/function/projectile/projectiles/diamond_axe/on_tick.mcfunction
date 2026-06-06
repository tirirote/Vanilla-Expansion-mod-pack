# dungeons/nether/projectile/on_tick.mcfunction
particle minecraft:entity_effect{color:-2127926122} ~ ~ ~ 0.2 0.2 0.2 0 1
particle instant_effect{color:49358} ~ ~ ~ 0.5 0.1 0.5 0 1
particle enchanted_hit ~ ~ ~ 0.2 0.2 0.2 0.2 5
function vexp:utils/feedback/dust_particle {initialColor: [0.5, 0.7, 0.65], finalColor: [0.6, 0.9, 0.85], scale: 0.8, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 0.05, count: 1}
