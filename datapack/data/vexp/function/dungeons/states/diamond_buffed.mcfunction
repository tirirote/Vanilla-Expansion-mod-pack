# dungeons/states/gold_buffed.mcfunction
# @s is the player to be buffed
tag @s add vexp.diamond_buffed
scoreboard players set @s vexp.dstate 60
team join vexp.aqua @s
