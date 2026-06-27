# On hold feedback
function vexp:dungeons/fx/hold/echo {score:vexp.skill_hold_time, start:3, end:8, loop:36}
execute if score @s vexp.bow_draw_ticks matches 8 run function vexp:utils/sound {sound: "minecraft:entity.warden.tendril_clicks", type: "player"}
