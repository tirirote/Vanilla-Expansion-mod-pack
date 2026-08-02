# Gauntlets on special hit hook
# @s is the target entity

#Mark target
function vexp:dungeons/states/echo_marked

#Buff
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/echo_buffed

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-2.5, y:-0.5}

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit

# Remove tag
execute as @p[tag=vexp.attacker,limit=1] if entity @s[tag=vexp.hitted.special] run tag @s remove vexp.hitted.special
