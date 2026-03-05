# dungeons/axe/strip_shield.mcfunction
# @s is the target candidate

# 1. Strip offhand
item replace entity @s weapon.offhand with air

# 2. Strong knockback
function vexp:utils/motion/apply_knockback {strength:2, y:0.4}

# 3. Visuals
particle minecraft:cloud ~ ~1.2 ~ 0.5 0.5 0.5 0.1 20
playsound minecraft:entity.zombie.break_wooden_door player @a ~ ~ ~ 1 1.2
playsound minecraft:entity.item.break player @a ~ ~ ~ 1 0.5
