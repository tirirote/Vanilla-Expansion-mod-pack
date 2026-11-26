# # Spellbook common on combo hook
# @s is the target entity

# Combo finisher
#function vexp:dungeons/weapons/spellbook/combo_finisher

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

# Visuals
$execute as @p[tag=vexp.attacker] at @s positioned ~ ~1 ~ positioned ^ ^0.75 ^$(reach) run function vexp:dungeons/fx/hits/diamond_hit
$execute as @p[tag=vexp.attacker] at @s positioned ~ ~1 ~ positioned ^ ^0.75 ^$(reach) run function vexp:utils/feedback/trail_particle {col:-291, duration:15, dX:0.5, dY:0.5, dZ:0.5, count:5, speed:0}
