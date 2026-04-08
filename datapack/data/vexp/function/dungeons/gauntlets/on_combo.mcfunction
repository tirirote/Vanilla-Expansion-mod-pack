# dungeons/gauntlets/on_combo.mcfunction
# @s is the target entity

# Strong push away
function vexp:utils/motion/apply_knockback {strength:-2.5, y:2.5}

# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/punch_hit
