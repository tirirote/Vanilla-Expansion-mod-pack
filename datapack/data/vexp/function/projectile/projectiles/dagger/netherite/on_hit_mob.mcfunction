# Netherite projectile hook on entity hit
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] run function vexp:dungeons/states/nether_marked
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

function vexp:dungeons/fx/hits/netherite_hit
