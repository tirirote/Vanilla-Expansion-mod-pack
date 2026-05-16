# dungeons/states/echo_scared.mcfunction
# @s is the mob to be marked
tag @s add vexp.echo_scared
scoreboard players set @s vexp.dstate 120
execute store result score @s vexp.math run random value 0..1

execute if score @s vexp.math matches 0 facing entity @p[limit=1,distance=..32] eyes run tp @s ^ ^ ^-0.5 ~90 ~5
execute if score @s vexp.math matches 1 facing entity @p[limit=1,distance=..32] eyes run tp @s ^ ^ ^-0.5 ~-90 ~5
