# dungeons/scythe/on_combo.mcfunction
# @s is the target entity

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-3.5, y:0.2}

# Buff
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/gold_buffed

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/gold_hit
