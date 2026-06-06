#Execute FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:execute",position:"^ ^1 ^0.5",face_player:1,scale:0.8,random_pos:1.5,lifetime:8,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle flash{color:-2269641} ~ ~1 ~ 1 1 1 1 0
particle instant_effect{color:5250091,power:-1} ~ ~1 ~ 0.35 0.35 0.35 1 5
particle crit ~ ~1 ~ 0.35 0.35 0.35 0.5 5
particle block{block_state:"crimson_stem"} ~ ~1 ~ 0.35 0.35 0.35 0.5 15
