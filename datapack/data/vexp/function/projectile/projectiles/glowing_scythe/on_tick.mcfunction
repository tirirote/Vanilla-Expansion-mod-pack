# dungeons/glowing_scythe/projectile/on_tick.mcfunction
particle glow ~ ~ ~ 0.2 0.2 0.2 0.5 1
particle enchanted_hit ~ ~ ~ 0.1 0.1 0.1 0.2 5
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.1, 0.1], finalColor: [0.4, 0.8, 0.65], scale: 1.7, dX: .1, dY: .1, dZ: .1, speed: 0.05, count: 1}
