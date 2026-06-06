# dungeons/rapier/glowing/on_hit.mcfunction
# @s is the target entity

# Slight pushback
function vexp:utils/motion/apply_knockback {strength:-0.1, y:0.0}

# Visuals
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_sword_hit
