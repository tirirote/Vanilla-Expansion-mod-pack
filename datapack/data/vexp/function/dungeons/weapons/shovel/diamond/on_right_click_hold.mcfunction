# On hold feedback
function vexp:dungeons/fx/hold/diamond {score:vexp.skill_hold_time, start:3, end:8, loop:36}
execute if score @s vexp.bow_draw_ticks matches 8 run function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player", pitch:1}
