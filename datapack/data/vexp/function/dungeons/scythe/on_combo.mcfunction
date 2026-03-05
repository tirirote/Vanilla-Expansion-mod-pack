# dungeons/scythe/on_combo.mcfunction
# @s is the target entity

# Strong push away
function vexp:utils/motion/apply_knockback {strength:-5, y:0.2}

# Visuals
particle minecraft:cloud ~ ~ ~ 0.5 0.5 0.5 0.1 5
playsound minecraft:entity.player.attack.sweep player @a ~ ~ ~ 1 0.5
playsound entity.phantom.flap player @a[distance=..10] ~ ~ ~ 1 0.5
