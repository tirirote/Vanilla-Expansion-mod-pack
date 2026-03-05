# dungeons/rapier/on_hit.mcfunction
# @s is the target entity

# Freeze the mob (rapier thrust)
tp @s ~ ~ ~

# Blindness
effect give @s minecraft:blindness 1 0 true

# Visuals
particle minecraft:spark ~ ~1.2 ~ 0.1 0.1 0.1 0.05 3
playsound minecraft:entity.player.attack.sweep player @a ~ ~ ~ 1 1.8
