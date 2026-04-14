# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob
# Small Knockback
tag @s add vexp.prevent_despawn

execute as @e[tag=vexp.proj_target] at @s facing entity @p[tag=vexp.projectile_owner,limit=1] eyes run function vexp:utils/motion/apply_knockback {strength:-0.25, y:0.05}
