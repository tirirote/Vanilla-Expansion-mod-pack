# dungeons/gauntlets/on_right_click.mcfunction
# @s is the player

# 1. Give resistance 5 to cancel immediate damage
effect give @s minecraft:resistance 1 4 true

# 2. Add parry tag for 5 ticks (listener in tick loop)
tag @s add vexp.gauntlets.parry
scoreboard players set @s vexp.dummy 5

# 3. Visuals
particle minecraft:spark ~ ~1.2 ~ 0.5 0.5 0.5 0.1 20
playsound minecraft:item.shield.block player @a ~ ~ ~ 1 1.5
