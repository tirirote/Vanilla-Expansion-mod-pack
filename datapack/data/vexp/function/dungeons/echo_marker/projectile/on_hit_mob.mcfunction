# dungeons/echo_marker/projectile/on_hit_mob.mcfunction
# @s is the proj, @e[tag=vexp.proj_target] is the mob
execute as @e[tag=vexp.proj_target,limit=1] run tag @s add vexp.echo_target
particle minecraft:sculk_charge_pop ~ ~ ~ 0.5 0.5 0.5 0.1 10
