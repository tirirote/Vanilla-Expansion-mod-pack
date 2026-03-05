# dungeons/gauntlets/on_combo.mcfunction
# @s is the target entity

# Strong push away
function vexp:utils/motion/apply_knockback {strength:-2, y:1.5}

# Visuals
particle minecraft:gust ~ ~1.2 ~ 0 0 0 1 1
particle minecraft:cloud ~ ~1.2 ~ 0.5 0.5 0.5 0.05 3
playsound minecraft:entity.phantom.flap player @a[distance=..10] ~ ~ ~ 1 1
playsound minecraft:entity.player.attack.sweep player @a[distance=..10] ~ ~ ~ 1 1
