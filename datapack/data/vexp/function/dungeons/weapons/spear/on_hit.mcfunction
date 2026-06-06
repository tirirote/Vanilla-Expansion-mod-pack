# dungeons/spear/on_hit.mcfunction
# @s is the target entity

# Forward thrust knockback
function vexp:utils/motion/apply_knockback {strength:-0.6, y:0.1}

# Visuals
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_sword_hit
