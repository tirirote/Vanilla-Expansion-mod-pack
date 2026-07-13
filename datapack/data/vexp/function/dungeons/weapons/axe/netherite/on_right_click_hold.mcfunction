# On hold feedback
function vexp:dungeons/fx/hold/netherite {score:vexp.skill_hold_time, start:3, end:8, loop:36}
execute if score @s vexp.skill_hold_time matches 8 run function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player", pitch:1}
