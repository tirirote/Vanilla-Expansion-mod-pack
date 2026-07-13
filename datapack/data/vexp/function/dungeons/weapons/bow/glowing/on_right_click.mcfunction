# dungeons/bow/glowing/on_right_click.mcfunction
# @s is the player

function vexp:dungeons/fx/hold/glowing {score:vexp.bow_draw_ticks, start:8, end:24, loop:48}
execute if score @s vexp.bow_draw_ticks matches 25 run function vexp:utils/sound {sound: "minecraft:entity.glow_squid.hurt", type: "player", pitch:1}
