# Netherite hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:netherite_hit",position:"~ ~1 ~",face_player:1,scale:1.7,random_pos:0.5,lifetime:5,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle flash{color:-8637360} ~ ~ ~ 1 1 1 1 0
particle instant_effect{color:8737350,power:2} ~ ~ ~ 0.35 0.35 0.35 1 3
particle flame ~ ~ ~ .35 .35 .35 0.02 1
particle dust_color_transition{from_color:3679786,to_color:8737350,scale:1.7} ~ ~ ~ 0.35 0.35 0.35 0 3

function vexp:utils/sound {sound: "minecraft:entity.ravager.step", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player", pitch:1}
