# On combo hook
# @s is the hitted mob

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-3.5, y:0.2}

# Mark mob
function vexp:dungeons/states/echo_marked

# Buff
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/echo_buffed

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit
