# Spellbook common on hit hook
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-0.2, y:0.1}

# Visuals
$execute as @p[tag=vexp.attacker] at @s positioned ~ ~1 ~ positioned ^ ^0.75 ^$(reach) run function vexp:dungeons/fx/hits/weak_echo_hit
$execute as @p[tag=vexp.attacker] at @s positioned ~ ~1 ~ positioned ^ ^0.75 ^$(reach) run function vexp:utils/feedback/trail_particle {col:-291, duration:15, dX:0.5, dY:0.5, dZ:0.5, count:5, speed:0}
