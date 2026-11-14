# Diamond hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:diamond_hit",position:"~ ~1 ~",face_player:1,scale:1.7,random_pos:0.5,lifetime:5,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle flash{color:-7340061} ~ ~1 ~ 0.0 0.0 0.0 1 0
particle instant_effect{color:3788726,power:2} ~ ~1 ~ 0.35 0.35 0.35 1 1
particle enchanted_hit ~ ~1 ~ 0.35 0.35 0.35 .5 5
particle dust_color_transition{from_color:3788726,to_color:36214,scale:0.8} ~ ~1 ~ 0.35 0.35 0.35 0 5
particle end_rod ~ ~1 ~ 0.35 0.35 0.35 0.05 1
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:item.spear.hit", type: "player", pitch:1}
