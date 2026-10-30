# Sword on special hit hook
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-3.5, y:0.05}

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_sword_hit

# Remove tag
execute as @p[tag=vexp.attacker,limit=1] if entity @s[tag=vexp.hitted.special] run tag @s remove vexp.hitted.special
