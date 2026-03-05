# dungeons/scythe/on_combo.mcfunction
# @s is the target entity

# Strong push away
function vexp:utils/motion/apply_knockback {strength:2, y:0.4}

# Visuals
particle minecraft:cloud ~ ~1.2 ~ 0.5 0.5 0.5 0.05 10
playsound minecraft:entity.player.attack.knockback player @a ~ ~ ~ 1 0.5
