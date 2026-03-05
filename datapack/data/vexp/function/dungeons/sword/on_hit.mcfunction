# dungeons/sword/on_hit.mcfunction
# @s is the target entity

# Slowness
effect give @s minecraft:slowness 2 1 true

# Visuals
particle minecraft:small_gust ~ ~1.2 ~ 0 0 0 0.05 1
playsound minecraft:entity.player.attack.weak player @a ~ ~ ~ 1 1.0
