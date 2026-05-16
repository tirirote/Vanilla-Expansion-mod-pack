# dungeons/states/echo_marked.mcfunction
# @s is the mob to be marked
execute if entity @s[tag=vexp.echo_marked] run function vexp:dungeons/states/echo_marked/aoe_wave
tag @s add vexp.echo_marked
scoreboard players set @s[tag=!vexp.echo_scared] vexp.dstate 60
