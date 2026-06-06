# dungeons/states/bleeding.mcfunction
# @s is the mob to be marked
tag @s add vexp.bleeding
scoreboard players set @s vexp.dstate 20
team join vexp.dark_red
