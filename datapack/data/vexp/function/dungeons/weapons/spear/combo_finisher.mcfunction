# Spear combo finisher
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ if block ^ ^ ^-1 #replaceable positioned ~ ~-1.5 ~ run tp @s ^ ^ ^-1
