# dungeons/bow/arrows/types/netherite/on_tick_charged.mcfunction
# @s is a netherite-quality bow arrow, fully charged

particle entity_effect{color:2034972465} ~ ~ ~ 0.1 0.1 0.1 0 1
particle entity_effect{color:-1973009586} ~ ~ ~ 0.1 0.1 0.1 0 1
particle flame ~ ~ ~ .2 .2 .2 0.01 1
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 1.7, dX: 0, dY: 0, dZ: 0, speed: 0.05, count: 1}
