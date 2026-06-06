# dungeons/glowing_axe/projectile/on_tick.mcfunction
particle glow ~ ~ ~ 0.2 0.2 0.2 0 1
particle enchanted_hit ~ ~ ~ 0.2 0.2 0.2 0.2 5
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.1, 0.1], finalColor: [0.4, 0.8, 0.65], scale: 2.1, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 0.05, count: 1}
