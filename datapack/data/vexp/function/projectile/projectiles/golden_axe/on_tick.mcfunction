# dungeons/nether/projectile/on_tick.mcfunction
particle minecraft:entity_effect{color:1895811611} ~ ~ ~ 0.2 0.2 0.2 0 1
particle instant_effect{color:16763707} ~ ~ ~ 0.2 0.2 0.2 0 1
particle minecraft:crit ~ ~ ~ .2 .2 .2 0.2 5
function vexp:utils/feedback/dust_particle {initialColor: [0.75, 0.8, 0.2], finalColor: [0.85, 0.75, 0.3], scale: 0.8, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 0.05, count: 1}
