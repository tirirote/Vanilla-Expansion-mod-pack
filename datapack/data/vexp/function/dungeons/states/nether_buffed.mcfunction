# dungeons/states/nether_buffed.mcfunction
# @s is the player to be buffed
tag @s add vexp.nether_buffed
scoreboard players set @s vexp.dstate 20

# Glowing color
team join vexp.dark_purple @s
