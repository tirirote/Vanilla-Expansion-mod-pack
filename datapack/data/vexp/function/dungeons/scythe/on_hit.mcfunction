# dungeons/scythe/on_hit.mcfunction
# @s is the target entity

# Pull towards the player
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.2}

# Visuals
particle minecraft:crit ~ ~1 ~ .25 .25 .25 0.2 15
function vexp:utils/sound {sound: "minecraft:item.trident.hit", type: "player"}
