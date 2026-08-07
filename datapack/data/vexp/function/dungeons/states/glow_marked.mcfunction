# dungeons/states/glow_marked.mcfunction
# @s is the mob to be marked
tag @s add vexp.glow_marked
scoreboard players set @s[tag=!vexp.glow_confused] vexp.dstate 40
