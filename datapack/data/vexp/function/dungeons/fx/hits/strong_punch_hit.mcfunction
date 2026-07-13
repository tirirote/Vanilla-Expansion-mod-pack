# Punch hit FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:strong_combo_hit",position:"^ ^1 ^0.5",face_player:1,scale:0.8,random_pos:0.5,lifetime:6,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}
particle flash{color:-3815995} ~ ~ ~ 1 1 1 1 0
function vexp:utils/sound {sound: "minecraft:entity.player.attack.crit", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.player.attack.knockback", type: "player", pitch:1}
