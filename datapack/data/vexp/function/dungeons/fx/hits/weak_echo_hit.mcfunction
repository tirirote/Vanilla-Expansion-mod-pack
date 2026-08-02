# Weak echo hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:weak_echo_hit",position:"^ ^1 ^0.5",face_player:1,scale:0.8,random_pos:0.5,lifetime:7,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle sculk_charge_pop ~ ~ ~ 0.25 0.25 0.25 0.05 5
particle item{item:sculk} ~ ~ ~ 0.25 0.25 0.25 0.1 3

function vexp:utils/sound {sound: "minecraft:entity.warden.tendril_clicks", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:item.shield.break", type: "player", pitch:1}
