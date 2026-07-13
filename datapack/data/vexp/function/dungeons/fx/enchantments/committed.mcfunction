# Committed Feedback
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:committed",position:"^ ^1 ^0.5",face_player:1,scale:0.8,random_pos:1.5,lifetime:7,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle flash{color:-21168} ~ ~1 ~ 1 1 1 1 0
particle smoke ~ ~1 ~ 0.35 0.35 0.35 0.02 1
particle crit ~ ~1 ~ 0.35 0.35 0.35 0.5 5
function vexp:utils/sound {sound: "minecraft:entity.player.attack.knockback", type: "player", pitch:1}
