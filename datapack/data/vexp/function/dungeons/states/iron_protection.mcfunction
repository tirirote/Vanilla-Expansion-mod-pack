# dungeons/states/iron_protection.mcfunction
# @s is the player to be buffed
tag @s add vexp.iron_protection
scoreboard players set @s vexp.dstate 20

# Glowing color
team join vexp.white @s

