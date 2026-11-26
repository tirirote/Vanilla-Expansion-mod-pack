# Strong sword hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:netherite_special",position:"~ ~ ~",face_player:0,scale:1.7,lifetime:7,follow_owner:1,follow_offset_x:0,follow_offset_y:1.25,follow_offset_z:1.0}

particle instant_effect{color:8737350,power:2} ~ ~ ~ 0.35 0.35 0.35 1 3
particle flame ~ ~ ~ 0.35 0.35 0.35 0.1 1

function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player", pitch:1}
