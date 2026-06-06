# dungeons/spear/netherite/on_combo.mcfunction
# @s is the target entity

function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.2}

# Push wave
execute as @e[predicate=vexp:is_target,distance=..3.5] at @s run function vexp:dungeons/weapons/sword/netherite/wave

# Visuals
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_sword_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/netherite_hit
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
