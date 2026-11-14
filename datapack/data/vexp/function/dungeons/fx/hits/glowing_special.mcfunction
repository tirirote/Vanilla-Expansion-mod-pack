# Strong sword hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:glowing_special",position:"~ ~1 ~",face_player:0,scale:1.7,random_pos:0,lifetime:7,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle glow ~ ~1 ~ 0.35 0.35 0.35 1 1
particle instant_effect{color:1261362, power:2} ~ ~1 ~ 0.35 0.35 0.35 1 3
function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:item.glow_ink_sac.use", type: "player", pitch:1}
