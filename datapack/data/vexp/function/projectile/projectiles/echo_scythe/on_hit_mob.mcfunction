# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob
# Light AoE damage and nether mark in ..2
tag @s add vexp.prevent_despawn

execute as @e[predicate=vexp:is_target,distance=..2.5] run function vexp:dungeons/states/echo_marked
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s facing entity @p[tag=vexp.projectile_owner,limit=1] eyes run function vexp:utils/motion/apply_knockback {strength:-1.0, y:0.1}
particle sculk_charge_pop ~ ~ ~ .2 .2 .2 0.1 3
function vexp:utils/sound {sound: "minecraft:block.sculk.spread", type: "player"}
