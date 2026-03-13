# dungeons/gauntlets/amethyst/telekinesis.mcfunction
# TP marked mob to ^ ^ ^3 in front of player

execute at @s run tp @e[tag=vexp.amethyst_target,sort=nearest,limit=1] ^ ^ ^3

# Visual
particle minecraft:amethyst_cluster ~ ~ ~ 0.5 0.5 0.5 0.1 20
playsound minecraft:block.amethyst_block.chime ambient @a ~ ~ ~ 1 1.5

# Cleanup
tag @e[tag=vexp.amethyst_target] remove vexp.amethyst_target
