# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob
tag @s add vexp.prevent_despawn
# Apply mark
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] run function vexp:dungeons/states/echo_stunned
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s facing entity @p[tag=vexp.projectile_owner] feet run function vexp:utils/motion/apply_knockback {strength:-1, y:0.15}
particle sculk_soul ~ ~ ~ .2 .2 .2 0.1 1
particle large_smoke ~ ~ ~ .2 .2 .2 0.1 1
