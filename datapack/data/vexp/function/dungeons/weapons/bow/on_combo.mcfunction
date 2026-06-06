# dungeons/bow/on_combo.mcfunction
# @s is the target entity

# Default combo impact feedback for bows
function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}
execute as @p[tag=vexp.attacker,limit=1] at @s run function vexp:dungeons/weapons/bow/player_pushback

execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_punch_hit
