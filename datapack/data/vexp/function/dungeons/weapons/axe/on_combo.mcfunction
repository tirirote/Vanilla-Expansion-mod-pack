# Axe on combo common hook
# @s is the target entity (one of them)

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

# Visual feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_sword_hit
