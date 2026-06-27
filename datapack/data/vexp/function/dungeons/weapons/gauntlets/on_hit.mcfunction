# dungeons/gauntlets/on_hit.mcfunction
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.2}

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_punch_hit
