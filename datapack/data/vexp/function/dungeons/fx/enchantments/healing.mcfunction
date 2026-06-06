#Healing FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:healing",position:"~ ~1 ~",face_player:0,scale:2.1,random_pos:0,lifetime:10,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}
particle flash{color:-14287} ~ ~1 ~ 1 1 1 1 0
particle instant_effect{color:16770649,power:-1} ~ ~1 ~ 0.5 0.2 0.5 0 5
particle entity_effect{color:-1560298752} ~ ~1 ~ 0.5 0.2 0.5 1 5

function vexp:utils/sound {sound: "minecraft:block.beacon.activate", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.respawn_anchor.charge", type: "player"}
