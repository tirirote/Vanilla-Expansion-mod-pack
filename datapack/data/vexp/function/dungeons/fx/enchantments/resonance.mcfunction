# Backstab Feedback
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:resonance",position:"~ ~0.5 ~",face_player:0,scale:2.1,random_pos:0,lifetime:10,spawn_on_player:1,follow_owner:1,follow_offset_x:0,follow_offset_y:0.5,follow_offset_z:0}

particle instant_effect{color:7821823} ~ ~ ~ 0.5 0.2 0.5 1 15
particle instant_effect{color:3683839} ~ ~ ~ 0.5 0.2 0.5 1 5
particle flash{color:-8218113} ~ ~1 ~ 0.0 0.0 0.0 1 0
function vexp:utils/sound {sound: "minecraft:entity.evoker.cast_spell", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:block.respawn_anchor.deplete", type: "player", pitch:1}
