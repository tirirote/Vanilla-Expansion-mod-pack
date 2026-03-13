# @s is the hit mob

function vexp:dungeons/states/nether_marked

# Knockback {strength:0.6, y:0.2}
function vexp:utils/motion/apply_knockback {strength:1, y:0.1}
effect give @p[tag=vexp.attacker,limit=1] minecraft:resistance 2 0 true
effect give @p[tag=vexp.attacker,limit=1] minecraft:slowness 2 0 true
