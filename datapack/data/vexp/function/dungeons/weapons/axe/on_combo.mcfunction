# dungeons/axe/on_combo.mcfunction
# @s is the target entity (one of them)

# 2. Strong knockback for the primary target
function vexp:utils/motion/apply_knockback {strength:-0.2, y:1}

# Visual feedback
execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_sword_hit
