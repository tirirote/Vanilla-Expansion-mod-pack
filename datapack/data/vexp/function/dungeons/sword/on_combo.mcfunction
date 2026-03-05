# dungeons/sword/on_combo.mcfunction
# @s is the target entity

# Strong push away
function vexp:utils/motion/apply_knockback {strength:1.8, y:0.4}

# Visuals
particle minecraft:sweep_attack ~ ~1.2 ~ 0.5 0.5 0.5 0 1
playsound minecraft:entity.player.attack.sweep player @a ~ ~ ~ 1 1.0
