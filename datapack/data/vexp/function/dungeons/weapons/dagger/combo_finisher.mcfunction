# Custom combo finisher

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

tag @p[tag=vexp.attacker,limit=1] add vexp.hitted.special

effect give @p[tag=vexp.attacker,limit=1] speed 1 2 true
