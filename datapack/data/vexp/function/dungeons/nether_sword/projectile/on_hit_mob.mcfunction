# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob
tag @s add vexp.prevent_despawn
# Apply mark
execute as @e[tag=vexp.proj_target,limit=1] run function vexp:dungeons/states/nether_marked
particle angry_villager ~ ~ ~ .2 .2 .2 0.1 1
particle large_smoke ~ ~ ~ .2 .2 .2 0.1 3
