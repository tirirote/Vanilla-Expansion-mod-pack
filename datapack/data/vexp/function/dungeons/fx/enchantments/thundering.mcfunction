# Thunder hit FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:thundering",position:"~ ~1 ~",face_player:1,scale:2.1,random_pos:0,lifetime:11,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle electric_spark ~ ~1 ~ 0.5 0.2 0.5 1 15
particle instant_effect{color:4607} ~ ~1 ~ 0.5 0.2 0.5 0 3
particle instant_effect{color:47103} ~ ~1 ~ 0.5 0.2 0.5 0 1
particle flash{color:-16721409} ~ ~1 ~ 1 1 1 1 0
