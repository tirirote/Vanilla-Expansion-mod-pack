# dungeons/amethyst_marker/projectile/on_hit_mob.mcfunction
# @s is the proj, @e[tag=vexp.proj_target] is the mob
execute as @e[tag=vexp.proj_target,limit=1] run tag @s add vexp.amethyst_target
particle minecraft:block{block_state:{Name:"minecraft:amethyst_cluster"}} ~ ~ ~ 0.5 0.5 0.5 0.1 10
