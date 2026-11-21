# Thunder hit FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:thundering",position:"~ ~1 ~",face_player:1,scale:2.7,lifetime:13,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle electric_spark ~ ~1 ~ 0.5 0.2 0.5 1 15
particle instant_effect{color:14151679,power:2} ~ ~1 ~ 0.5 0.2 0.5 1 5
particle flash{color:-7018753} ~ ~1 ~ 1 1 1 1 0
