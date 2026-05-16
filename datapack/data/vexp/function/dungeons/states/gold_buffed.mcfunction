# dungeons/states/gold_buffed.mcfunction
# @s is the player to be buffed
tag @s add vexp.gold_buffed
scoreboard players set @s vexp.dstate 40
team join vexp.yellow @s
