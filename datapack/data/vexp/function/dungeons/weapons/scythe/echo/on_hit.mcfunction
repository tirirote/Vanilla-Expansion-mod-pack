# Scythe on hit hook
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:1.5, y:0.1}

# Mark Mob
function vexp:dungeons/states/echo_marked

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_echo_hit
