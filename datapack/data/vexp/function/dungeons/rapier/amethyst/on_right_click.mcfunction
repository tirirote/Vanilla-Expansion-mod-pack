# dungeons/rapier/amethyst/on_right_click.mcfunction
# @s is the player

# Buffs
effect give @s minecraft:speed 2 1 true
effect give @s minecraft:levitation 1 0 true

# Dash
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^ ^1
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^ ^1
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^ ^1
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^ ^1

# Visual
particle minecraft:amethyst_cluster ~ ~1 ~ 1 0.5 1 0.1 20
