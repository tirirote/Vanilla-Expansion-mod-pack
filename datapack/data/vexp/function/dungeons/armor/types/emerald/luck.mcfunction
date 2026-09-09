# Emerald armor luck
function vexp:dungeons/states/emerald_luck
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player", pitch:1}
particle instant_effect{color:9240414,power:1} ~ ~ ~ 0.5 0.1 0.5 1 15
function vexp:utils/feedback/trail_particle {col:9240414, duration:14, dX:2.0, dY:0.1, dZ:2.0, count:25, speed:1}
particle dust_color_transition{from_color:1074181,to_color:9240414,scale:1.7} ~ ~ ~ 0.5 0.1 0.5 0 5
