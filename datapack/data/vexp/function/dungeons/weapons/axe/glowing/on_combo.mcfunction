# dungeons/axe/glowing/on_combo.mcfunction
# @s is the target entity (one of them)

# Strong knockback for the primary target
function vexp:utils/motion/apply_knockback {strength:-0.4, y:1}

# Visual feedback
execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_sword_hit
