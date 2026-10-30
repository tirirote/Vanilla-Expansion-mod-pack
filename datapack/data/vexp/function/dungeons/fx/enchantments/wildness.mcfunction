# Wildness FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:wildness",position:"~ ~0.5 ~",face_player:0,scale:2.7,random_pos:0,lifetime:10,follow_owner:1,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle flash{color:-26053} ~ ~1 ~ 1 1 1 1 0
particle instant_effect{color:16722784,power:2} ~ ~1 ~ 0.5 0.2 0.5 1 3
particle raid_omen ~ ~1 ~ 0.5 0.2 0.5 0 1
particle dust_color_transition{from_color:4327977,to_color:16765266,scale:1.7} ~ ~1 ~ 0.5 0.1 0.5 1 5
