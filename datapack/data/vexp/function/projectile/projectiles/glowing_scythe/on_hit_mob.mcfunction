# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob
# Light AoE damage and nether mark in ..2
tag @s add vexp.prevent_despawn
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/states/glow_marked
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s facing entity @p[tag=vexp.projectile_owner,limit=1] eyes run function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}
