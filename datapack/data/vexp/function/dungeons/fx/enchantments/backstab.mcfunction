# Backstab Feedback
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:backstab",position:"~ ~1 ~",face_player:1,scale:2.1,random_pos:0,lifetime:10,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle instant_effect{color:16744703} ~ ~1 ~ 0.5 0.2 0.5 0.5 3
particle squid_ink ~ ~1 ~ 0.5 0.2 0.5 0.05 3
particle flash{color:-3797761} ~ ~1 ~ 0.0 0.0 0.0 1 0
function vexp:utils/sound {sound: "minecraft:item.spear.hit", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.squid.squirt", type: "player", pitch:1}
