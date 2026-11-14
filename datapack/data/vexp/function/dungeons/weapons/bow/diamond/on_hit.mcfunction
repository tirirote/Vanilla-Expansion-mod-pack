# Bow on hit hook
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

# Feedback
execute as @p[tag=vexp.attacker] at @s run function vexp:dungeons/fx/hits/weak_diamond_hit
