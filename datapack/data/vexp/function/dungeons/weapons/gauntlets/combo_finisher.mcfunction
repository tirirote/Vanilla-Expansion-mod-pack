# Gauntlets combo finisher
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-1.5, y:1.5}
effect give @s slow_falling 1 0 true

tag @p[tag=vexp.attacker,limit=1] add vexp.hitted.special

effect give @p[tag=vexp.attacker,limit=1] minecraft:jump_boost 1 1 true
effect give @p[tag=vexp.attacker,limit=1] strength 1 1 true
effect give @p[tag=vexp.attacker,limit=1] speed 1 1 true
