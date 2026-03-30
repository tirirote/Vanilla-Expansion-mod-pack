# dungeons/nether/projectile/on_tick.mcfunction
particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1
particle minecraft:large_smoke ~ ~ ~ 0.1 0.1 0.1 0.02 1
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.5, 0.45, 0.35], scale: 1.7, dX: 0, dY: 0, dZ: 0, speed: 0.05, count: 3}
