# First Strike Feedback
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:first_strike",position:"~ ~1 ~",face_player:1,scale:1.7,random_pos:0,lifetime:7,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle flash{color:-1280} ~ ~1 ~ 1 1 1 1 0
particle instant_effect{color:16770560,power:1.5} ~ ~1 ~ 0.3 0.3 0.3 0.3 3
particle instant_effect{color:16744987,power:1.5} ~ ~1 ~ 0.3 0.3 0.3 0.3 1
particle totem_of_undying ~ ~1 ~ 0.3 0.3 0.3 0.2 3
function vexp:utils/sound {sound: "minecraft:entity.breeze.wind_burst", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:block.respawn_anchor.deplete", type: "player", pitch:1}
