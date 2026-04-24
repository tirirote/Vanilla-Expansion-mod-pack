# dungeons/bow/arrows/types/common/on_tick.mcfunction
# @s is a common-quality bow arrow

particle entity_effect{color:-1973009586} ~ ~ ~ .25 .25 .25 0 1
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 0.8, dX: 0, dY: 0, dZ: 0, speed: 0.05, count: 3}
