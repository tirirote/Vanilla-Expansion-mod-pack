# dungeons/nether/projectile/on_tick.mcfunction
particle minecraft:entity_effect{color:2034972465} ~ ~ ~ 0.2 0 0.2 0 3
particle minecraft:crit ~ ~ ~ .2 .2 .2 0.2 5
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 0.8, dX: 0.2, dY: 0, dZ: 0.2, speed: 0.05, count: 1}
