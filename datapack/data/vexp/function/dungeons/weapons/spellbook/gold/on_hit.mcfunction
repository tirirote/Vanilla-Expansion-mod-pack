# Spellbook common on hit hook
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-0.2, y:0.1}

# Visuals
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_gold_hit
