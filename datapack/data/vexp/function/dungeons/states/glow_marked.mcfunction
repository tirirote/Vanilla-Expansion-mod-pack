# dungeons/states/glow_marked.mcfunction
# @s is the mob to be marked
#execute if entity @s[tag=vexp.glow_marked] run function vexp:dungeons/states/glow_marked/aoe_wave
tag @s add vexp.glow_marked
scoreboard players set @s[tag=!vexp.glow_confused] vexp.dstate 40
