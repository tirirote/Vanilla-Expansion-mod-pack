# Weak netherite hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:weak_netherite_hit",position:"~ ~1 ~",face_player:1,scale:1.7,random_pos:0.5,lifetime:5,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle instant_effect{color:8737350,power:2} ~ ~1 ~ .35 .35 .35 1 1
particle flame ~ ~1 ~ .35 .35 .35 0.02 1
function vexp:utils/sound {sound: "minecraft:entity.ravager.step", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:item.shield.break", type: "player", pitch:1}
