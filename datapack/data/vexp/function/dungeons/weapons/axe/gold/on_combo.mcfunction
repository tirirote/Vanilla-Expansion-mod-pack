# dungeons/axe/on_combo.mcfunction
# @s is the target entity (one of them)

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

# Player buff
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/gold_buffed

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/gold_hit
