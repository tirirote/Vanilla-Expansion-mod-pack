# Axe on combo hook
# @s is the target entity (one of them)

# Mark mob
function vexp:dungeons/states/glow_marked

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

# Buff
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/glow_buffed

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/glowing_hit
