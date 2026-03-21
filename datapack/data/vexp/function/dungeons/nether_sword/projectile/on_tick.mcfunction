# dungeons/nether/projectile/on_tick.mcfunction
particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1
particle large_smoke ~ ~ ~ 0.1 0.1 0.1 0.02 3
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.5, 0.45, 0.35], scale: 2.1, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 0.05, count: 5}
