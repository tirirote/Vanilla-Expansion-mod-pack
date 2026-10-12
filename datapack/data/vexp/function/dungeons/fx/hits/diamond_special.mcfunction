# Strong sword hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:diamond_special",position:"^ ^1 ^1.5",face_player:0,scale:1.7,random_pos:0,lifetime:7,spawn_on_player:1,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle instant_effect{color:3788726} ~ ~ ~ 0.25 0.25 0.25 0 1
function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player", pitch:1}
