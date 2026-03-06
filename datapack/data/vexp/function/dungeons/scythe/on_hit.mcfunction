# dungeons/scythe/on_hit.mcfunction
# @s is the target entity

# Pull towards the player
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.2}

# Visuals
particle minecraft:enchanted_hit ~ ~ ~ .25 .25 .25 0.2 25
playsound minecraft:item.trident.hit player @a[distance=..10] ~ ~ ~ 1 0.5
