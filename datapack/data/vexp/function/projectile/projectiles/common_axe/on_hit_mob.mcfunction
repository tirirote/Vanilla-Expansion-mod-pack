# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob
tag @s add vexp.prevent_despawn
# Small Knockback
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s run function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.1}

particle minecraft:crit ~ ~ ~ .2 .2 .2 0.5 3
particle minecraft:flash{color:-2833519} ~ ~ ~ 0 0 0 0 0
function vexp:utils/sound {sound: "minecraft:entity.player.attack.nodamage", type: "player"}
