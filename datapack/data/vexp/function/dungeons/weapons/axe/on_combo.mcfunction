# dungeons/axe/on_combo.mcfunction
# @s is the target entity (one of them)

# 2. Strong knockback for the primary target
function vexp:utils/motion/apply_knockback {strength:-0.4, y:0.2}

# Visual feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_sword_hit
