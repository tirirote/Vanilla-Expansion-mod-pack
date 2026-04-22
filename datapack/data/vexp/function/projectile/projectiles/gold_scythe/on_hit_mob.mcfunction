# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob
# Small Knockback
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s facing entity @p[tag=vexp.projectile_owner,limit=1] eyes run function vexp:utils/motion/apply_knockback {strength:3, y:0.2}
