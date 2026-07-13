# First Strike Feedback
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:first_strike",position:"~ ~1 ~",face_player:0,scale:2.1,random_pos:0,lifetime:7,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle flash{color:-19934} ~ ~1 ~ 1 1 1 1 0
particle crit ~ ~1 ~ 0.35 0.35 0.35 0.5 15
particle instant_effect{color:16753691} ~ ~1 ~ 0.5 0.2 0.5 1 3
function vexp:utils/sound {sound: "minecraft:entity.player.hurt", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.firework_rocket.blast", type: "player", pitch:1}
