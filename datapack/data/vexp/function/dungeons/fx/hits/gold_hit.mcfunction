# Golden hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:gold_hit",position:"^ ^1 ^",face_player:1,scale:1.7,random_pos:0.5,lifetime:5,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle flash{color:-655515} ~ ~ ~ 1 1 1 1 0
particle instant_effect{color:16383904} ~ ~ ~ 0.35 0.35 0.35 0 1
particle instant_effect{color:16763188} ~ ~ ~ 0.35 0.35 0.35 0 2
particle dust_color_transition{from_color:16383904,to_color:16763188,scale:0.8} ~ ~ ~ 0.35 0.35 0.35 0 5
particle end_rod ~ ~ ~ 0.35 0.35 0.35 0.05 1

function vexp:utils/sound {sound: "minecraft:item.spear.hit", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player", pitch:1}
