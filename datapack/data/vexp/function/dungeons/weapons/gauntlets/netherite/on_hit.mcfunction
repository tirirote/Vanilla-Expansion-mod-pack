# Gauntlets on hit hook
# @s is the target entity

# Mark mob
function vexp:dungeons/states/nether_marked

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.2}

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_netherite_hit
