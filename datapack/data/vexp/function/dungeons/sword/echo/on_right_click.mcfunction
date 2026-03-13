# dungeons/sword/echo/on_right_click.mcfunction
# @s is the player

# AoE attack
particle minecraft:sculk_soul ~ ~1 ~ 1 0.5 1 0.1 30
playsound minecraft:entity.warden.sonic_boom ambient @a ~ ~ ~ 1 1.5

# Damage and effects in area
data modify storage vexp:temp damage set value {damage:2, type:"minecraft:player_attack", owner:"@s"}
execute as @e[type=!player,type=!item,type=!marker,distance=..4] at @s run function vexp:utils/deal_damage with storage vexp:temp damage

execute as @e[type=!player,type=!item,type=!marker,distance=..4] run effect give @s minecraft:slowness 3 1 true
execute as @e[type=!player,type=!item,type=!marker,distance=..4] run effect give @s minecraft:blindness 3 0 true
