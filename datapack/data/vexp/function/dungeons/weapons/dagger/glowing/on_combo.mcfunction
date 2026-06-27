# dungeons/dagger/glowing/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Custom combo finisher
function vexp:dungeons/weapons/dagger/combo_finisher

# Mark mob
function vexp:dungeons/states/glow_marked

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/glowing_hit
