# dungeons/nether/projectile/on_tick.mcfunction
particle minecraft:entity_effect{color:2130688031} ~ ~1 ~ 0.25 0.25 0.25 0.05 3
particle instant_effect{color:16776562} ~ ~ ~ 0.1 0.1 0.1 0 1
particle instant_effect{color:16763707} ~ ~ ~ 0.1 0.1 0.1 0 1
function vexp:utils/feedback/dust_particle {initialColor: [0.75, 0.7, 0.4], finalColor: [0.9, 0.9, 0.75], scale: 1.7, dX: 0.1, dY: 0.1, dZ: 0.1, speed: 0.05, count: 1}
