# Strong sword hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:diamond_special",position:"~ ~1 ~",face_player:0,scale:2.1,lifetime:5,follow_owner:1,follow_offset_x:0,follow_offset_y:1.25,follow_offset_z:1.0}

particle instant_effect{color:3788726,power:2} ~ ~1 ~ 0.35 0.35 0.35 1 3
function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player", pitch:1}
