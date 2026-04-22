# dungeons/sword/on_combo.mcfunction
# @s is the target entity

# Push wave
execute as @e[predicate=vexp:is_target,distance=..3.5] at @s positioned ~ ~1 ~ run function vexp:dungeons/sword/netherite/wave
# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_sword_hit
particle flash{color:-26073} ~ ~ ~ 0 0 0 0 0
particle lava ~ ~1 ~ .2 .2 .2 0 1

function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
