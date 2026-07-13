#Netherite weapons hit particles
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:weak_netherite_hit",position:"^ ^1 ^0.5",face_player:1,scale:0.8,random_pos:0.5,lifetime:6,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle instant_effect{color:5452865} ~ ~ ~ 0.25 0.25 0.25 0 3
function vexp:utils/sound {sound: "minecraft:entity.ravager.step", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:item.shield.break", type: "player", pitch:1}

