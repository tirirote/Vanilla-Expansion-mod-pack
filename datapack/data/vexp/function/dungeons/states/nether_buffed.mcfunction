# dungeons/states/nether_buffed.mcfunction
# @s is the player to be buffed
tag @s add vexp.nether_buffed
scoreboard players set @s vexp.dstate 40
team join vexp.gold @s
