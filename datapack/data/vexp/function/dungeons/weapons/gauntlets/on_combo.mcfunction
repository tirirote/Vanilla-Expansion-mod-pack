# dungeons/gauntlets/on_combo.mcfunction
# @s is the target entity

# Custom combo finisher
function vexp:dungeons/weapons/gauntlets/combo_finisher

# Visuals
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_punch_hit
