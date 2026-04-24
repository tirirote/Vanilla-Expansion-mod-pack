# dungeons/bow/arrows/types/common/on_tick.mcfunction
# @s is a common-quality bow arrow

# dungeons/echo_scythe/projectile/on_tick.mcfunction
particle entity_effect{color:-1978951775} ~ ~ ~ .25 .25 .25 0 1
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.7, 0.7], scale: 0.8, dX: 0, dY: 0, dZ: 0, speed: 0.05, count: 3}

