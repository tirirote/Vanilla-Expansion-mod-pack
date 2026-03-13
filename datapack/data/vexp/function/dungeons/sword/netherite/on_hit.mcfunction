# dungeons/sword/netherite/on_hit.mcfunction

function vexp:dungeons/states/nether_marked

# Knockback {strength:0.6, y:0.2}
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.1}
effect give @p[tag=vexp.attacker] minecraft:resistance 2 0 true
effect give @p[tag=vexp.attacker] minecraft:slowness 2 0 true