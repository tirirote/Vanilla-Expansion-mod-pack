# dungeons/dagger/on_combo.mcfunction
# @s is the target entity

# Strong pushback to target
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.1}

#Subtle buff
effect give @s minecraft:speed 3 1 true

# Visual/Sound
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_sword_hit
