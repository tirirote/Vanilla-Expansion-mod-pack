# Gauntlets combo finisher
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-1.5, y:1.5}
effect give @s slow_falling 1 0 true

tag @p[tag=vexp.attacker] add vexp.hitted.special

effect give @p[tag=vexp.attacker] minecraft:jump_boost 1 1 true
effect give @p[tag=vexp.attacker] strength 1 1 true
effect give @p[tag=vexp.attacker] speed 1 1 true
