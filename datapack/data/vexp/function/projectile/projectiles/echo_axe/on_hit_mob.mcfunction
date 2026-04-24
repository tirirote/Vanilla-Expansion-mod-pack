# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob
tag @s add vexp.prevent_despawn
#Mark
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s run function vexp:dungeons/states/echo_marked
# Small Knockback
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s run function vexp:utils/motion/apply_knockback {strength:-3.5, y:0.2}

particle flash{color:-8454162} ~ ~ ~ 0.0 0.0 0.0 1 0
particle glow ~ ~ ~ .25 .25 .25 0.01 3
