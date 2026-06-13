# Custom block on tick
# @s is the custom block
execute unless entity @p[distance=..2.5] run scoreboard players set @s vexp.block_anim 0
execute unless entity @p[distance=..2.5] run scoreboard players set @s vexp.math 0

execute if entity @p[distance=..2.5] store result score @s vexp.block_anim run random value 1..6
execute if entity @p[distance=..2.5] store result score @s vexp.math run random value 0..20


# Jitter
execute if score @s vexp.block_anim matches 1..3 as @e[tag=vexp.custom_block.display,sort=nearest,limit=1,distance=..1] at @s run tp @s ~ ~ ~ ~8 ~
execute if score @s vexp.block_anim matches 4.. as @e[tag=vexp.custom_block.display,sort=nearest,limit=1,distance=..1] at @s run tp @s ~ ~ ~ ~-8 ~

#Summon vanguarder
execute if score @s vexp.math matches 1 run function vexp:custom_mobs/mobs/vanguarder/summon
execute if score @s vexp.math matches 1 run function vexp:custom_block/break with entity @s data.vexp

