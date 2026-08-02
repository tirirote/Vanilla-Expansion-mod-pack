# # Spellbook common on combo hook
# @s is the target entity

# Combo finisher
#function vexp:dungeons/weapons/spellbook/combo_finisher

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

# Visuals
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/glowing_hit
