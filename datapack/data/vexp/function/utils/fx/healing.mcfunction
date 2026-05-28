#Healing FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:healing",position:"^ ^1.5 ^",face_player:0,scale:3.6,random_scale:0,random_pos:0,lifetime:16}
particle flash{color:-14287} ~ ~1 ~ 1 1 1 1 0
particle instant_effect{color:16770649,power:-1} ~ ~1 ~ 0.5 0.2 0.5 0 5
particle entity_effect{color:-1560298752} ~ ~1 ~ 0.5 0.2 0.5 1 5

function vexp:utils/sound {sound: "minecraft:block.beacon.activate", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.respawn_anchor.charge", type: "player"}
