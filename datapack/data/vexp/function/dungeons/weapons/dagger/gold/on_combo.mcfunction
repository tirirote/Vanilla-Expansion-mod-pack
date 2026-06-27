# dungeons/dagger/on_combo.mcfunction
# @s is the target entity

# Custom combo finisher
function vexp:dungeons/weapons/dagger/combo_finisher

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/gold_hit
