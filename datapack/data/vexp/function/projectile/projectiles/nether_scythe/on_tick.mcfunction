# dungeons/nether/projectile/on_tick.mcfunction
particle minecraft:ash ~ ~ ~ .1 .1 .1 0.01 1
particle flame ~ ~ ~ .2 .2 .2 0.01 1
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 1.7, dX: 0.1, dY: 0.1, dZ: 0.1, speed: 0.05, count: 3}
