# dungeons/sword/on_combo.mcfunction
# @s is the target entity

# Push wave
execute as @e[predicate=vexp:is_target,distance=..3.5] at @s run function vexp:dungeons/weapons/sword/common_wave
# Visuals
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_sword_hit
