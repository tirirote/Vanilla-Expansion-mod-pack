# Sharpness FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:sharpness",position:"^ ^1 ^0.5",face_player:1,scale:0.8,random_pos:1,lifetime:7,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle enchanted_hit ~ ~1 ~ 0.35 0.35 0.35 0.5 15
particle flash{color:-11420755} ~ ~1 ~ 1 1 1 1 0
function vexp:utils/sound {sound: "minecraft:block.chain.break", type: "player", pitch:1}
