# @s is the player, @e[tag=vexp.hitted] is the mob

# Custom combo finisher
function vexp:dungeons/weapons/dagger/combo_finisher

# Mark mob
function vexp:dungeons/states/echo_marked

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/netherite_hit
