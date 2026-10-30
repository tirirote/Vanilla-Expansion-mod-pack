# Sweeping Edge FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:sweeping_edge_r",position:"~ ~0.5 ~",face_player:0,scale:2.7,random_pos:0,lifetime:10,follow_owner:1,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:sweeping_edge_l",position:"~ ~0.5 ~",face_player:0,scale:2.7,random_pos:0,lifetime:10,follow_owner:1,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}
particle instant_effect{color:12119807,power:2} ~ ~1 ~ 0.5 0.2 0.5 1 5
particle flash{color:-5050881} ~ ~1 ~ 1 1 1 1 0
function vexp:utils/sound {sound: "minecraft:item.trident.riptide_1", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.breeze.shoot", type: "player", pitch:1}
