# Fire Aspect Feedback
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:fire",position:"~ ~1 ~",face_player:0,scale:1.7,random_pos:0,lifetime:7,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle flame ~ ~1 ~ 0.5 0.2 0.5 0.05 3
particle large_smoke ~ ~1 ~ 0.5 0.2 0.5 0.02 1
particle flash{color:-20680} ~ ~1 ~ 0.0 0.0 0.0 1 0
function vexp:utils/sound {sound: "minecraft:entity.player.hurt_on_fire", type: "player", pitch:1}
