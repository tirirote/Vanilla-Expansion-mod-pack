# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob
# Light AoE damage and nether mark in ..2
tag @s add vexp.prevent_despawn

execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s run function vexp:dungeons/states/echo_stunned
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s facing entity @p[tag=vexp.projectile_owner] eyes run function vexp:utils/motion/apply_knockback {strength:0.1, y:0.01}


particle sculk_charge_pop ~ ~ ~ .2 .2 .2 0.05 1
function vexp:utils/sound {sound: "minecraft:block.sculk.spread", type: "player"}
