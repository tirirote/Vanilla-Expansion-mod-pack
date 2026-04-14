# dungeons/bow/on_hit.mcfunction
# @s is the target entity

function vexp:utils/motion/apply_knockback {strength:-0.1, y:0.1}
execute positioned ~ ~1 ~ run function vexp:utils/hits/weak_punch_hit
