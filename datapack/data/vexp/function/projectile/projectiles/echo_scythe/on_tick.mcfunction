# dungeons/echo_scythe/projectile/on_tick.mcfunction
particle entity_effect{color:2032356461} ~ ~ ~ .25 .25 .25 0 1
particle entity_effect{color:-1978951775} ~ ~ ~ .25 .25 .25 0 1

particle instant_effect{color:7733240} ~ ~ ~ 0.2 0.2 0.2 0.1 1
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.7, 0.7], scale: 1.7, dX: .1, dY: .1, dZ: .1, speed: 0.05, count: 3}
