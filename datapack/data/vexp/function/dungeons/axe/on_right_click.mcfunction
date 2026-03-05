# dungeons/axe/on_right_click.mcfunction
# @s is the player

# 1. Find nearest mob for shield stripping
execute as @e[type=!player,type=!item,distance=..4,limit=1,sort=nearest] at @s run function vexp:dungeons/axe/strip_shield

# 2. Visuals for player
particle minecraft:cloud ~ ~1.2 ~ 0.5 0.5 0.5 0.05 30
playsound minecraft:entity.iron_golem.damage player @a ~ ~ ~ 1 0.5
