# Strong sword hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:echo_special",position:"~ ~ ~",face_player:0,scale:2.1,lifetime:5,follow_owner:1,follow_offset_x:0,follow_offset_y:1.25,follow_offset_z:1.0}

particle sculk_charge_pop ~ ~ ~ 0.35 0.35 0.35 1 1
particle instant_effect{color:668982,power:2} ~ ~ ~ 0.35 0.35 0.35 1 3
function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.warden.tendril_clicks", type: "player", pitch:1}
