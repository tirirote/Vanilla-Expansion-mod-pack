# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob
tag @s add vexp.prevent_despawn
# Apply mark
execute as @e[tag=vexp.proj_target] at @s run function vexp:dungeons/states/nether_marked
execute as @e[tag=vexp.proj_target] at @s run function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

particle flame ~ ~ ~ .2 .2 .2 0.05 1
particle large_smoke ~ ~ ~ .2 .2 .2 0.1 5
particle minecraft:flash{color:1241474560} ~ ~ ~ 0 0 0 0.05 1
