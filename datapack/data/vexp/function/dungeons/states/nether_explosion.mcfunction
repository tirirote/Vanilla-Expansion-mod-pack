# dungeons/states/nether_explosion.mcfunction
# @s is the hitted mob

# Visual and Sound
particle minecraft:explosion ~ ~1 ~ 0.5 0.5 0.5 0.1 5
particle minecraft:flame ~ ~1 ~ 0.5 0.5 0.5 0.1 10
playsound minecraft:entity.generic.explode ambient @a ~ ~ ~ 1 1.2

# Damage in area (3 blocks)
execute at @s as @e[type=!#minecraft:arrows,type=!player,distance=..3,limit=10] run function vexp:utils/deal_damage {amount:2.0}
execute at @s as @e[type=!#minecraft:arrows,type=!player,distance=..3,limit=10] run data modify entity @s Fire set value 40

# Consumes mark
tag @s remove vexp.nether_marked
scoreboard players set @s vexp.dstate 0
