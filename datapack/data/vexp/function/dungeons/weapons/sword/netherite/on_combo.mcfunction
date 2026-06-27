# dungeons/sword/on_combo.mcfunction
# @s is the target entity

# Combo finisher
function vexp:dungeons/weapons/sword/combo_finisher

# Mark mob
function vexp:dungeons/states/nether_marked

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/netherite_hit
