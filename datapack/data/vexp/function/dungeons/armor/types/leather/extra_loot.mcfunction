# Get random loot
execute store result score @s vexp.rand run random value 1..21
execute if score @s vexp.rand matches 1 run data modify entity @s Item.id set value "minecraft:flint"
execute if score @s vexp.rand matches 2 run data modify entity @s Item.id set value "minecraft:flint"
execute if score @s vexp.rand matches 3 run data modify entity @s Item.id set value "minecraft:flint"

execute if score @s vexp.rand matches 4 run data modify entity @s Item.id set value "minecraft:bone"
execute if score @s vexp.rand matches 5 run data modify entity @s Item.id set value "minecraft:bone"
execute if score @s vexp.rand matches 6 run data modify entity @s Item.id set value "minecraft:bone"

execute if score @s vexp.rand matches 7 run data modify entity @s Item.id set value "minecraft:stick"
execute if score @s vexp.rand matches 8 run data modify entity @s Item.id set value "minecraft:stick"
execute if score @s vexp.rand matches 9 run data modify entity @s Item.id set value "minecraft:stick"
execute if score @s vexp.rand matches 10 run data modify entity @s Item.id set value "minecraft:stick"
execute if score @s vexp.rand matches 11 run data modify entity @s Item.id set value "minecraft:stick"

execute if score @s vexp.rand matches 12 run data modify entity @s Item.id set value "minecraft:feather"
execute if score @s vexp.rand matches 13 run data modify entity @s Item.id set value "minecraft:feather"
execute if score @s vexp.rand matches 14 run data modify entity @s Item.id set value "minecraft:feather"
execute if score @s vexp.rand matches 15 run data modify entity @s Item.id set value "minecraft:feather"

execute if score @s vexp.rand matches 16 run data modify entity @s Item.id set value "minecraft:gunpowder"
execute if score @s vexp.rand matches 17 run data modify entity @s Item.id set value "minecraft:gunpowder"

execute if score @s vexp.rand matches 18 run data modify entity @s Item.id set value "minecraft:copper_nugget"
execute if score @s vexp.rand matches 19 run data modify entity @s Item.id set value "minecraft:copper_nugget"

execute if score @s vexp.rand matches 20 run data modify entity @s Item.id set value "minecraft:iron_nugget"
execute if score @s vexp.rand matches 21 run data modify entity @s Item.id set value "minecraft:copper_nugget"

# XP
summon experience_orb ~ ~ ~ {Tags:["vexp.summoned_xp"],Value:1}
execute as @e[type=experience_orb,tag=vexp.summoned_xp,distance=..1,sort=nearest,limit=1] run function vexp:utils/motion/apply_random_motion {range:10, scale:0.01}

# Feedback
particle dust_color_transition{from_color:10587775,to_color:13222304,scale:1.7} ~ ~ ~ 0.2 0.2 0.2 1 3
particle instant_effect{color:14404509} ~ ~ ~ 0.2 0.2 0.2 0 1
function vexp:utils/sound {sound: "minecraft:entity.armadillo.brush", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.chime", type: "player", pitch:1}
tag @s add vexp.leather_found
