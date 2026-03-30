# dungeons/nether/projectile/on_tick.mcfunction
particle minecraft:crit ~ ~ ~ 0 0 0 0.01 3
function vexp:utils/feedback/dust_particle {initialColor: [0.8,0.8,0.8], finalColor: [0.9, 1.0, 1.0], scale: 0.8, dX: 0, dY: 0, dZ: 0, speed: 0.05, count: 5}
