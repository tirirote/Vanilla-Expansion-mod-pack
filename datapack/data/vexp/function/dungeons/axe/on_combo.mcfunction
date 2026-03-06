# dungeons/axe/on_combo.mcfunction
# @s is the target entity (one of them)

# 2. Strong knockback for the primary target
function vexp:utils/motion/apply_knockback {strength:0.5, y:-1}

# Visuals
particle enchanted_hit ~ ~ ~ .2 .2 .2 .2 15
execute positioned ~ ~-1.25 ~ run function vexp:utils/feedback/block_hit
playsound minecraft:item.trident.throw player @a ~ ~ ~ 1 0.5
