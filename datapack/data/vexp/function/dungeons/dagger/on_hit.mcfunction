# dungeons/dagger/on_hit.mcfunction
# @s is the target entity

# Lightweight knockback
function vexp:utils/motion/apply_knockback {strength:0.3, y:0.1}

# Visual feedback
particle minecraft:sweep_attack ~ ~1.2 ~ 0 0 0 0 1
playsound minecraft:entity.player.attack.sweep player @a ~ ~ ~ 1 1.5
