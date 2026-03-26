# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob
# Light AoE damage and nether mark in ..2
tag @s add vexp.prevent_despawn

execute as @e[tag=vexp.proj_target] at @s run function vexp:dungeons/states/nether_marked

particle flame ~ ~ ~ .1 .1 .1 0.1 1
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.4, 0.35, 0.3], scale: 1.7, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 0.05, count: 1}
