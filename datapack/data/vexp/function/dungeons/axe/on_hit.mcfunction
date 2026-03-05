# dungeons/axe/on_hit.mcfunction
# @s is the target entity

# Slight pushback
function vexp:utils/motion/apply_knockback {strength:1, y:0.25}

# Visuals
particle minecraft:sweep_attack ~ ~1.2 ~ 0 0 0 0 1
playsound minecraft:entity.player.attack.weak player @a ~ ~ ~ 1 0.6
