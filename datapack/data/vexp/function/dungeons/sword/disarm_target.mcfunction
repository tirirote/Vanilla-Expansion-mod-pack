# dungeons/sword/disarm_target.mcfunction
# @s is the target to disarm

# 1. Strip weapon
item replace entity @s weapon.mainhand with air

# 2. Knockback
function vexp:utils/motion/apply_knockback {strength:2, y:0.4}

# 3. Visuals
particle minecraft:cloud ~ ~1.2 ~ 0.5 0.5 0.5 0.1 20
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 1 1.2
playsound minecraft:entity.item.break player @a ~ ~ ~ 1 1.0
