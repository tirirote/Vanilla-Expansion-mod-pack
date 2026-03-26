# dungeons/echo_scythe/projectile/on_tick.mcfunction
particle minecraft:ominous_spawning ~ ~ ~ .2 .2 .2 0.01 1
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.7, 0.7], scale: 1.7, dX: 0, dY: 0, dZ: 0, speed: 0.05, count: 1}
