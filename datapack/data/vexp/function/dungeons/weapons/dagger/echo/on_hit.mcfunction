# @s is the player, @e[tag=vexp.hitted] is the mob

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.1}

execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_echo_hit
