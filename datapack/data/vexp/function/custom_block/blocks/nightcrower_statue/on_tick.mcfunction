# Custom block on tick
# @s is the custom block

# Guarda el tick exacto del día en el marcador 'actual'
execute store result score @s vexp.math run time query day

execute unless score @s vexp.math matches 13000..23000 run scoreboard players set @s vexp.block_anim 0
execute unless score @s vexp.math matches 13000..23000 run scoreboard players set @s vexp.rand 0

execute if score @s vexp.math matches 13000..23000 store result score @s vexp.block_anim run random value 1..6
execute if score @s vexp.math matches 13000..23000 store result score @s vexp.rand run random value 0..10

# Jitter
execute if score @s vexp.block_anim matches 1..3 as @e[tag=vexp.custom_block.display,sort=nearest,limit=1,distance=..1] at @s run tp @s ~ ~ ~ ~36 ~
execute if score @s vexp.block_anim matches 4.. as @e[tag=vexp.custom_block.display,sort=nearest,limit=1,distance=..1] at @s run tp @s ~ ~ ~ ~-36 ~

#Summon vanguarder
execute if score @s vexp.rand matches 1 run function vexp:custom_mobs/mobs/nightcrower/summon
execute if score @s vexp.rand matches 1 run function vexp:custom_block/break with entity @s data.vexp

