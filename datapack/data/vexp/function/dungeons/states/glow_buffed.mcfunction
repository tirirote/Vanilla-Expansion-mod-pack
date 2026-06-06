# dungeons/states/echo_buffed.mcfunction
# @s is the player to be buffed
tag @s add vexp.glow_buffed
scoreboard players set @s vexp.dstate 20

#Glowing
effect give @s glowing 1 0 true
team join vexp.dark_aqua @s
