# dungeons/sword/glowing/on_combo.mcfunction
# @s is the target entity (one of them)

# Combo finisher
function vexp:dungeons/weapons/sword/combo_finisher

# Mark mob
function vexp:dungeons/states/glow_marked

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/glowing_hit
