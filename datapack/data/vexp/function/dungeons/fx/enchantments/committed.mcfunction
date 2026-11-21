# Committed Feedback
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:committed",position:"~ ~1 ~",face_player:1,scale:1.7,lifetime:5,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle flash{color:-21168} ~ ~1 ~ 1 1 1 1 0
particle smoke ~ ~1 ~ 0.35 0.35 0.35 0.02 1
particle crit ~ ~1 ~ 0.35 0.35 0.35 0.5 5
function vexp:utils/sound {sound: "minecraft:entity.player.attack.knockback", type: "player", pitch:1}
