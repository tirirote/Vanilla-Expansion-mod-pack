# @s is the target entity

# Slight pushback
function vexp:utils/motion/apply_knockback {strength:-0.2, y:0.1}

# Visual feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_sword_hit
