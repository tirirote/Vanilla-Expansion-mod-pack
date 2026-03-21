# dungeons/sword/on_right_click.mcfunction
# @s is the player
particle minecraft:poof ~ ~-1.25 ~ .5 .1 .5 0.05 25
execute as @e[type=!player,type=!item,type=!marker,distance=..3.5] at @s run function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.25}
# Startup feedback
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
