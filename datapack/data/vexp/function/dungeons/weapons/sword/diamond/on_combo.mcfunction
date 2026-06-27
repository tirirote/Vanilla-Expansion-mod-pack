# dungeons/sword/on_combo.mcfunction
# @s is the target entity

# Combo finisher
function vexp:dungeons/weapons/sword/combo_finisher

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/diamond_hit
