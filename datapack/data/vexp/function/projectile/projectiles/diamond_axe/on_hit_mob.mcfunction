# dungeons/diamond_axe/projectile/on_hit_mob.mcfunction
# @s is the proj

# Small Knockback
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.2}

function vexp:dungeons/fx/hits/diamond_hit
