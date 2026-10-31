# Strong sword hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:netherite_special",position:"^ ^1.25 ^1.5",face_player:0,scale:1.7,random_pos:0,lifetime:7,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle instant_effect{color:8737350,power:2} ^ ^1 ^1.5 0.35 0.35 0.35 1 3
particle flame ^ ^1 ^1.5 0.35 0.35 0.35 0.1 1

function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player", pitch:1}
