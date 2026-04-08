# dungeons/sword/on_hit.mcfunction
# @s is the target entity

function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/sword_hit
