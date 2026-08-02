# Scythe on hit hook
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:1.5, y:0.1}

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_diamond_hit
