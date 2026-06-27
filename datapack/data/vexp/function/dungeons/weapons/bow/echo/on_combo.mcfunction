# dungeons/bow/resonance/on_combo.mcfunction
# @s is the target entity

# Mark the target
function vexp:dungeons/states/echo_marked

# Custom knockback
function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

# Player pushback
execute as @p[tag=vexp.attacker,limit=1] at @s run function vexp:dungeons/weapons/bow/player_pushback

# Feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit
