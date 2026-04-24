# dungeons/nether/projectile/on_tick.mcfunction
particle minecraft:entity_effect{color:-2127926122} ~ ~ ~ 0.1 0.1 0.1 0 3
particle instant_effect{color:9437155} ~ ~ ~ 0.1 0.1 0.1 0 1
function vexp:utils/feedback/dust_particle {initialColor: [0.5, 0.7, 0.65], finalColor: [0.6, 0.9, 0.85], scale: 1.7, dX: 0.1, dY: 0.1, dZ: 0.1, speed: 0.05, count: 1}
