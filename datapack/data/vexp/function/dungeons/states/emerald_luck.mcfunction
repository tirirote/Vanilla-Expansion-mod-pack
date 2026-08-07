# dungeons/states/emerald_luck.mcfunction
# @s is the player to be buffed
tag @s add vexp.emerald_luck
scoreboard players set @s vexp.dstate 60

# Glowing color
team join vexp.green @s
