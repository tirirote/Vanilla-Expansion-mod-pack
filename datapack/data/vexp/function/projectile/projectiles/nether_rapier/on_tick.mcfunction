# dungeons/nether/projectile/on_tick.mcfunction
particle minecraft:trial_spawner_detection ~ ~ ~ .25 .25 .25 0.1 1
particle flame ~ ~ ~ .2 .2 .2 0.01 1
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.7, 0.55, 0.4], scale: 1.7, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 1, count: 3}
