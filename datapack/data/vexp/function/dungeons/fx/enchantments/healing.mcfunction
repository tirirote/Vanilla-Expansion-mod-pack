#Healing FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:healing",position:"~ ~0.5 ~",face_player:0,scale:2.7,random_pos:0,lifetime:10,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}
particle flash{color:-14287} ~ ~1 ~ 1 1 1 1 0
particle instant_effect{color:16770649,power:2} ~ ~ ~ 0.5 0.2 0.5 0 10
particle effect{color:-1560298752} ~ ~ ~ 0.5 0.2 0.5 1 3

function vexp:utils/sound {sound: "minecraft:block.beacon.activate", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:block.respawn_anchor.charge", type: "player", pitch:1}
