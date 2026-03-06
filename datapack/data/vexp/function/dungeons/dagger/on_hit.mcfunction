# dungeons/dagger/on_hit.mcfunction
# @s is the target entity

# Lightweight knockback
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.1}

# Visual feedback
particle minecraft:crit ~ ~ ~ .1 .1 .1 0.2 5
playsound minecraft:item.trident.throw player @a ~ ~ ~ 1 1
