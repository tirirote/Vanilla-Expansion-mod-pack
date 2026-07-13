# Custom on Hurt hook
# @s is the custom mob

execute as @e[type=#vexp:targets,tag=!vexp.custom_mob,distance=..2.5] run damage @s 2 magic by @e[tag=vexp.custom_mob,sort=nearest,limit=1,nbt=!{HurtTime:0s}]

# Feedback
particle enchanted_hit ~ ~1 ~ 0.5 0.2 0.5 0.3 15
particle instant_effect{color:1668607} ~ ~1 ~ 0.5 0.2 0.5 1 10
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.break", type: "player", pitch:1}
