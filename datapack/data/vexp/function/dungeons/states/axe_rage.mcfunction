# dungeons/states/axe_rage.mcfunction
# @s is the mob to be marked
tag @s add vexp.axe_rage
scoreboard players set @s vexp.dstate 60

#Glowing
effect give @s glowing 1 0 true
team join vexp.red
