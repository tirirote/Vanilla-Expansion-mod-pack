# Weak bone hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:weak_combo_hit",position:"^ ^1 ^0.25",face_player:1,scale:1.7,random_pos:0.5,lifetime:5,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle item{item:"bone"} ~ ~ ~ .35 .35 .35 1 1
function vexp:utils/sound {sound: "minecraft:block.bone_block.break", type: "player", pitch:1}
