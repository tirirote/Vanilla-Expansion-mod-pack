# dungeons/gauntlets/netherite/on_combo.mcfunction
# @s is the target entity

#Mark target
function vexp:dungeons/states/echo_marked

# Custom combo finisher
function vexp:dungeons/weapons/gauntlets/combo_finisher

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit
