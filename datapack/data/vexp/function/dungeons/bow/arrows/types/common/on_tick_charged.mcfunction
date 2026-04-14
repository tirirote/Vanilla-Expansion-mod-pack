# dungeons/bow/arrows/types/common/on_tick_charged.mcfunction
# @s is a common-quality bow arrow, fully charged

particle firework ~ ~ ~ 0.0 0.0 0.0 0 0
function vexp:utils/feedback/dust_particle {initialColor: [0.8,0.8,0.8], finalColor: [0.9, 1.0, 1.0], scale: 0.8, dX: 0, dY: 0, dZ: 0, speed: 0.05, count: 1}
