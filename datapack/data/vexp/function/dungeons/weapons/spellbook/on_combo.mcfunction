# # Spellbook common on combo hook
# @s is the target entity

# Combo finisher
#function vexp:dungeons/weapons/spellbook/combo_finisher

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

# Visuals
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_punch_hit
execute positioned ~ ~1 ~ run function vexp:utils/feedback/trail_particle {col:-291, duration:7, dX:1, dY:1, dZ:1, count:15, speed:1}
