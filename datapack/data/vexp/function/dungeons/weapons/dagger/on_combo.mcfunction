# dungeons/dagger/on_combo.mcfunction
# @s is the target entity

# Custom combo finisher
function vexp:dungeons/weapons/dagger/combo_finisher

# Visual/Sound
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_sword_hit
