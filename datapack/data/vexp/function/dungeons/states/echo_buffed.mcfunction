# dungeons/states/echo_buffed.mcfunction
# @s is the player to be buffed
tag @s add vexp.echo_buffed
scoreboard players set @s vexp.dstate 60

# Glowing color
team join vexp.aqua @s
