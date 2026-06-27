# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.1}

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_netherite_hit
