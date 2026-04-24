# dungeons/bow/arrows/types/resonance/on_tick_charged.mcfunction
# @s is a resonance-quality bow arrow, fully charged

# dungeons/echo_scythe/projectile/on_tick.mcfunction
particle entity_effect{color:2032356461} ~ ~ ~ .1 .1 .1 0 1
particle entity_effect{color:-1978951775} ~ ~ ~ .1 .1 .1 0 1

particle glow ~ ~ ~ 0.2 0.2 0.2 0.1 1
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.7, 0.7], scale: 1.7, dX: 0, dY: 0, dZ: 0, speed: 0.05, count: 1}
