# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob
# Small Knockback
execute as @e[tag=vexp.proj_target] at @s run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}
