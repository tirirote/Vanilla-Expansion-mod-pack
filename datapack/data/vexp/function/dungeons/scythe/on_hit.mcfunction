# dungeons/scythe/on_hit.mcfunction
# @s is the target entity

# Pull towards the player
function vexp:utils/motion/apply_knockback {strength:-0.8, y:0}

# Visuals
particle minecraft:small_gust ~ ~1.2 ~ 0 0 0 0.05 1
playsound minecraft:entity.player.attack.weak player @a ~ ~ ~ 1 0.5
