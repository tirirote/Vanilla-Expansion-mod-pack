# dungeons/sword/on_combo.mcfunction
# @s is the target entity

# Push wave
execute as @e[tag=vexp.hit_candidate,distance=..2] at @s positioned ~ ~1 ~ run function vexp:dungeons/sword/common_wave
# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_sword_hit
