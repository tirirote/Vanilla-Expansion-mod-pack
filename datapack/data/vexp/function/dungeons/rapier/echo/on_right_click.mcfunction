# dungeons/rapier/echo/on_right_click.mcfunction
# @s is the player

# Dash with invis
effect give @s minecraft:invisibility 1 0 true

execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^ ^1
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^ ^1
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^ ^1

# AoE damage at end
particle minecraft:sculk_soul ~ ~1 ~ 1 0.5 1 0.1 20
data modify storage vexp:temp damage set value {damage:2, type:"minecraft:player_attack", owner:"@s"}
execute as @e[type=!player,type=!item,type=!marker,distance=..3] at @s run function vexp:utils/deal_damage with storage vexp:temp damage
