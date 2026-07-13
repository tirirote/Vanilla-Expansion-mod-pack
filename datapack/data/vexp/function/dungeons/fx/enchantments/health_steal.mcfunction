# Feedback
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:life_steal",position:"^ ^1 ^0.5",face_player:1,scale:0.8,random_pos:1.5,lifetime:7,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle flash{color:-7650992} ~ ~1 ~ 1 1 1 1 0
particle instant_effect{color:-1855384264,power:-1} ~ ~1 ~ 0.5 0.25 0.5 0 3
particle block{block_state:"crimson_stem"} ~ ~1 ~ 0.35 0.35 0.35 0.5 3
function vexp:utils/sound {sound: "minecraft:entity.vex.hurt", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.fox.bite", type: "player", pitch:1}
