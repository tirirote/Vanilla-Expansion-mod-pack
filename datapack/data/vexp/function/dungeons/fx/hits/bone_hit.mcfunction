# Punch hit FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:strong_combo_hit",position:"^ ^1 ^0.5",face_player:1,scale:0.8,random_pos:0.5,lifetime:7,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}
particle flash{color:-1780047} ~ ~ ~ 1 1 1 1 0
particle item{item:"bone"} ~ ~ ~ 0.2 0.2 0.2 0.1 5
function vexp:utils/sound {sound: "minecraft:block.bone_block.break", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.player.attack.crit", type: "player", pitch:1}
