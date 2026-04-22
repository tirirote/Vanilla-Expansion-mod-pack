# dungeons/dagger/on_combo.mcfunction
# @s is the target entity

# Strong pushback to target
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.1}

# Dash
effect give @s minecraft:speed 3 1 true

# Visual/Sound
execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_sword_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/gold_hit
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
