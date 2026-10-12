# Weak gold hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:weak_gold_hit",position:"^ ^1 ^",face_player:1,scale:1.7,random_pos:0.5,lifetime:5,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle instant_effect{color:16763188} ~ ~ ~ 0.25 0.25 0.25 0 1

function vexp:utils/sound {sound: "minecraft:entity.ender_eye.death", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:item.trident.hit", type: "player", pitch:1}
