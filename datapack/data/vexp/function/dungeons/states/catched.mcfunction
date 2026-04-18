# dungeons/states/catched.mcfunction
# @s is the mob just caught
# Sets up the catch with a 20-tick timer

tag @s add vexp.state.catched
scoreboard players set @s vexp.dstate 20
tag @p[tag=!vexp.catch.owner,distance=..10,limit=1] add vexp.catch.owner

#Feedback
execute positioned ~ ~-.5 ~ run function vexp:utils/feedback/block_hit
particle dust_plume ~ ~ ~ 0.2 0.0 0.2 0 5
particle cloud ~ ~ ~ 0.2 0.0 0.2 0.1 3

team join vexp.yellow @s
