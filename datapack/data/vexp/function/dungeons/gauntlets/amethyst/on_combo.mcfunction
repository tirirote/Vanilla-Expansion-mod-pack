# dungeons/gauntlets/amethyst/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Effects
execute as @e[tag=vexp.hitted] run effect give @s minecraft:levitation 1 10 true
# Pull {strength:-2.5, y:0.1}
data modify storage vexp:temp motion set value {strength:-2.5, y:0.1}
execute as @e[tag=vexp.hitted] at @s run function vexp:utils/motion/apply_knockback with storage vexp:temp motion


# AoE explosion
particle minecraft:amethyst_cluster ~ ~1 ~ 1 1 1 0.1 30
execute as @e[type=!player,type=!item,type=!marker,distance=..3] at @s run function vexp:utils/deal_damage {amount:1.0}

# Player buff
effect give @s minecraft:speed 2 1 true
