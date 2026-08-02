# Sword on hit hook
# @s is the target entity

# Mark mob
function vexp:dungeons/states/echo_marked

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

# Visuals
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_echo_hit
