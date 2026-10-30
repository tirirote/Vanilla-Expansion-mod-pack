# Strong sword hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:echo_special",position:"^ ^1 ^1.5",face_player:0,scale:1.7,random_pos:0,lifetime:7,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle sculk_charge_pop ^ ^1 ^1.5 0.35 0.35 0.35 1 1
particle instant_effect{color:668982,power:2} ^ ^1 ^1.5 0.35 0.35 0.35 1 3
function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.warden.tendril_clicks", type: "player", pitch:1}
