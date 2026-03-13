# dungeons/nether/projectile/on_tick.mcfunction
particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.05 1
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.4, 0.35, 0.3], scale: 1.7, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 0.05, count: 1}