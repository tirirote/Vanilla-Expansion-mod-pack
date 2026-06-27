# Glow projectile hook on entity hit
execute as @p[tag=vexp.projectile_owner,limit=1] at @s if entity @e[predicate=vexp:is_target,tag=vexp.glow_marked,distance=..16,sort=nearest,limit=1] run function vexp:dungeons/states/diamond_buffed

execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

function vexp:dungeons/fx/hits/diamond_hit
