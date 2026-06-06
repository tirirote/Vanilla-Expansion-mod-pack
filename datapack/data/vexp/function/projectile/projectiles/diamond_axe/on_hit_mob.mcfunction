# dungeons/diamond_axe/projectile/on_hit_mob.mcfunction
# @s is the proj

#Bleeding State
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s run function vexp:dungeons/states/bleeding

# Small Knockback
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s run function vexp:utils/motion/apply_knockback {strength:-0.8, y:0.1}

function vexp:dungeons/fx/hits/diamond_hit
