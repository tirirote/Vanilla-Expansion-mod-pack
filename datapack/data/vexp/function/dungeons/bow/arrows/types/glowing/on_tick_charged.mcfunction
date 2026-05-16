# dungeons/bow/arrows/types/resonance/on_tick_charged.mcfunction
# @s is a resonance-quality bow arrow, fully charged

# dungeons/echo_scythe/projectile/on_tick.mcfunction
particle entity_effect{color:-1978949253} ~ ~ ~ .1 .1 .1 0 1

particle glow ~ ~ ~ 0.2 0.2 0.2 0.1 1
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.2, 0.3], finalColor: [0.4, 0.8, 0.65], scale: 1.7, dX: 0, dY: 0, dZ: 0, speed: 0.05, count: 1}
