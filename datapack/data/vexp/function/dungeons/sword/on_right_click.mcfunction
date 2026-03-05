# dungeons/sword/on_right_click.mcfunction
# @s is the player

# 1. Disarm nearest mob in front
# We use a distance check for the nearest entity in front (~4 blocks)
execute as @e[type=!player,type=!item,distance=..4,limit=1,sort=nearest] at @s run function vexp:dungeons/sword/disarm_target

# 2. Visuals for player
particle minecraft:cloud ~ ~1.2 ~ 0.5 0.5 0.5 0.05 30
playsound minecraft:entity.iron_golem.repair player @a ~ ~ ~ 1 1.5
