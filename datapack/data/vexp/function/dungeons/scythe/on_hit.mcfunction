# dungeons/scythe/on_hit.mcfunction
# @s is the target entity

# Pull towards the player
function vexp:utils/motion/apply_knockback {strength:2, y:0.05}

# Visuals
particle minecraft:crit ~ ~1.2 ~ .1 .1 .1 0.1 5
playsound minecraft:entity.player.attack.strong player @a ~ ~ ~ 1 0.5
