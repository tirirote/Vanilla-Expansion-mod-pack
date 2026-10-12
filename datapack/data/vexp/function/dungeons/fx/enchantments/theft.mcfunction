# Backstab Feedback
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:theft",position:"~ ~1 ~",face_player:1,scale:1.7,random_pos:0,lifetime:10,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle instant_effect{color:6245979} ~ ~1 ~ 0.5 0.2 0.5 0.1 1
particle effect{color:4010298} ~ ~1 ~ 0.5 0.2 0.5 0.1 3
particle flash{color:-9610638} ~ ~1 ~ 0.0 0.0 0.0 1 0
function vexp:utils/sound {sound: "minecraft:block.vault.activate", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:block.trial_spawner.hit", type: "player", pitch:1}
