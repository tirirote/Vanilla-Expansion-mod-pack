# Custom on Hurt hook
# @s is the custom mob
tag @s add vexp.lapis_zombie_aoe

execute as @e[type=#vexp:targets,tag=!vexp.lapis_zombie_aoe,distance=..3.5] run damage @s 2 magic by @e[tag=vexp.lapis_zombie_aoe,distance=..6,sort=nearest,limit=1]

# Feedback
particle dust_color_transition{from_color:1668607,to_color:793046,scale:1.7} ~ ~0.5 ~ 0.5 0.2 0.5 1 5
particle instant_effect{color:1668607,power:1.5} ~ ~0.5 ~ 0.5 0.2 0.5 1 15
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.break", type: "player", pitch:1}

tag @s remove vexp.lapis_zombie_aoe
