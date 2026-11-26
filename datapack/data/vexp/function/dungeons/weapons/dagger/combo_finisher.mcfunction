# Dagger combo finisher
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.2}

tag @p[tag=vexp.attacker] add vexp.hitted.special

effect give @p[tag=vexp.attacker] speed 1 2 true
