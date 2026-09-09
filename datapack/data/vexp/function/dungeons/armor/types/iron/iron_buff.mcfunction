# Get iron protection buff
function vexp:dungeons/states/iron_protection
particle instant_effect{color:10334931,power:2} ~ ~ ~ 0.5 0.1 0.5 1 5
function vexp:utils/feedback/trail_particle {col:10334931, duration:14, dX:2.0, dY:0.1, dZ:2.0, count:25, speed:1}
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player", pitch:1}
