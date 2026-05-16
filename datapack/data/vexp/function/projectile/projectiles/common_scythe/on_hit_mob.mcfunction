# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob
# Small Knockback
tag @s add vexp.prevent_despawn
execute as @e[predicate=vexp:is_target,distance=..2.5,sort=nearest,limit=1] run function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.2}
