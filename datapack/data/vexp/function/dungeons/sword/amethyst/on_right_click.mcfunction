# dungeons/sword/amethyst/on_right_click.mcfunction
# @s is the player

# AoE attack
particle minecraft:block{block_state:{Name:"minecraft:amethyst_cluster"}} ~ ~1 ~ 1 1 1 0.1 50
playsound minecraft:block.amethyst_block.chime ambient @a ~ ~ ~ 1 1

# Effects in area
execute as @e[type=!player,type=!item,type=!marker,distance=..4] at @s run effect give @s minecraft:levitation 1 5 true
# Pull {strength:-3.0, y:0.1}
data modify storage vexp:temp motion set value {strength:-3.0, y:0.1}
execute as @e[type=!player,type=!item,type=!marker,distance=..4] at @s run function vexp:utils/motion/apply_knockback with storage vexp:temp motion


