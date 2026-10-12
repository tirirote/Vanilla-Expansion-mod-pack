# Echo hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:echo_hit",position:"^ ^1 ^",face_player:1,scale:1.7,random_pos:0.5,lifetime:5,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle flash{color:-8454162} ~ ~ ~ 1 1 1 0 0
particle sculk_charge_pop ~ ~ ~ 0.25 0.25 0.25 0.05 10
particle instant_effect{color:668982} ~ ~ ~ 0.35 0.35 0.35 0 1
particle item{item:sculk} ~ ~ ~ 0.25 0.25 0.25 0.1 3
particle dust_color_transition{from_color:668982,to_color:6815730,scale:1.7} ~ ~ ~ 0.35 0.35 0.35 1 5

function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player", pitch:1}
