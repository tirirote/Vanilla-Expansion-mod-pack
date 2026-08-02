# Bow on right click hold hook
# @s is the player

function vexp:dungeons/fx/hold/bone {score:vexp.bow_draw_ticks, start:8, end:24, loop:48}
execute if score @s vexp.bow_draw_ticks matches 25 run function vexp:utils/sound {sound: "minecraft:block.bone_block.break", type: "player", pitch:1}
