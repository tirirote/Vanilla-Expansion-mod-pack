# dungeons/states/echo_stunned.mcfunction
# @s is the mob to be stunned
tag @s add vexp.echo_stunned
scoreboard players set @s vexp.dstate 20
