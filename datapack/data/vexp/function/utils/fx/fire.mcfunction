# Fire Aspect Feedback
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:fire",position:"^ ^1.5 ^",face_player:0,scale:2.1,random_scale:0,random_pos:0,lifetime:16}

particle flame ~ ~1 ~ 0.5 0.2 0.5 0.05 3
particle flash{color:-20680} ~ ~1 ~ 0.0 0.0 0.0 1 0
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
