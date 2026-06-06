# dungeons/glowing_axe/projectile/on_hit_mob.mcfunction
# @s is the proj

#Bleeding State
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s run function vexp:dungeons/states/bleeding
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s run function vexp:dungeons/states/glow_marked
# Small Knockback
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s run function vexp:utils/motion/apply_knockback {strength:-0.8, y:0.1}

function vexp:dungeons/fx/hits/glowing_hit
