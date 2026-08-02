# Dagger on combo hook
# @s is the target entity

# Custom combo finisher
function vexp:dungeons/weapons/dagger/combo_finisher

# Mark mob
function vexp:dungeons/states/glow_marked

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/glowing_hit
