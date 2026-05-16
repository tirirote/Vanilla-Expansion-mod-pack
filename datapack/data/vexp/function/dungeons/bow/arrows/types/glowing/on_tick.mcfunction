# dungeons/bow/arrows/types/common/on_tick.mcfunction
# @s is a common-quality bow arrow

# dungeons/echo_scythe/projectile/on_tick.mcfunction
particle entity_effect{color:2030851403} ~ ~ ~ .25 .25 .25 0 1
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.2, 0.3], finalColor: [0.4, 0.8, 0.65], scale: 0.8, dX: 0, dY: 0, dZ: 0, speed: 0.05, count: 3}

