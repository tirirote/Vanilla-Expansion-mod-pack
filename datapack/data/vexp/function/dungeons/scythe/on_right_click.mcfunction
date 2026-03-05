# dungeons/scythe/on_right_click.mcfunction
# @s is the player

# 1. Damage all nearby mobs in 5 blocks
execute at @s as @e[type=!player,type=!item,distance=..5] at @s run function vexp:dungeons/scythe/apply_aoe

# 2. Visuals for player
particle minecraft:cloud ~ ~1.2 ~ 1 0.5 1 0.1 50
playsound minecraft:entity.player.attack.sweep player @a ~ ~ ~ 1 0.5
