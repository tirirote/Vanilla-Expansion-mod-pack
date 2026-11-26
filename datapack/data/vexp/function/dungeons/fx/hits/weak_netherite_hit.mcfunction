# Weak netherite hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:weak_netherite_hit",position:"~ ~ ~",face_player:1,scale:1.7,lifetime:5,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle instant_effect{color:8737350,power:2} ~ ~ ~ .35 .35 .35 1 1
particle flame ~ ~ ~ .35 .35 .35 0.02 1
function vexp:utils/sound {sound: "minecraft:entity.ravager.step", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:item.shield.break", type: "player", pitch:1}
