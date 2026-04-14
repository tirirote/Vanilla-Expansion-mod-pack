# dungeons/dagger/on_hit.mcfunction
# @s is the target entity

# Lightweight knockback
function vexp:utils/motion/apply_knockback {strength:0.05, y:0.1}

# Visual feedback
execute positioned ~ ~1 ~ run function vexp:utils/hits/weak_sword_hit
