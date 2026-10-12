# Strong sword hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:netherite_special",position:"^ ^1 ^1.5",face_player:0,scale:1.7,random_pos:0,lifetime:7,spawn_on_player:1,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle flash{color:-8637360} ~ ~ ~ 1 1 1 1 0
particle instant_effect{color:8737350} ~ ~ ~ 0.35 0.35 0.35 0 5
particle flame ~ ~ ~ .35 .35 .35 0.02 3
particle dust_color_transition{from_color:3679786,to_color:8737350,scale:0.8} ~ ~ ~ 0.35 0.35 0.35 0 5

function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player", pitch:1}
