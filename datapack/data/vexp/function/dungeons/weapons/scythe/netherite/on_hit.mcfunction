# dungeons/scythe/netherite/on_hit.mcfunction
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:1.5, y:0.1}

# Mark Mob
function vexp:dungeons/states/nether_marked

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_netherite_hit
