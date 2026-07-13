# dungeons/bow/on_right_click.mcfunction
# @s is the player

function vexp:dungeons/fx/hold/netherite {score:vexp.bow_draw_ticks, start:8, end:24, loop:48}
execute if score @s vexp.bow_draw_ticks matches 25 run function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player", pitch:1}
