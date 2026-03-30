# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob
tag @s add vexp.prevent_despawn
# Small Knockback
execute as @e[tag=vexp.proj_target] at @s run function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 0.2 1
particle minecraft:flash{color:-10066330} ~ ~ ~ 0 0 0 1 1
