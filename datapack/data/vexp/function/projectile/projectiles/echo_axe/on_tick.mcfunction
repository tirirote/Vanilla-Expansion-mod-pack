# dungeons/nether/projectile/on_tick.mcfunction
particle minecraft:entity_effect{color:-1978951775} ~ ~ ~ 0.2 0.2 0.2 0 1
particle sculk_charge_pop ~ ~ ~ 0.2 0.2 0.2 0.05 5
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.7, 0.7], scale: 2.1, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 0.05, count: 1}
