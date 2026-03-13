# dungeons/scythe/projectile/on_tick.mcfunction
# Efectos visuales del proyectil de guadaña
# @s es el proyectil

# Partículas de rastro
particle minecraft:small_gust ~ ~ ~ 0.15 0.15 0.15 0.01 1
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, .2], finalColor: [0.5, 0.4, 0.5], scale: 1.7, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 0.05, count: 2}
