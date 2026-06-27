# dungeons/states/nether_marked.mcfunction
# @s is the mob to be marked
#execute if entity @s[tag=vexp.nether_marked] at @s run function vexp:dungeons/states/nether_marked/aoe_wave
tag @s add vexp.nether_marked
scoreboard players set @s vexp.dstate 40
