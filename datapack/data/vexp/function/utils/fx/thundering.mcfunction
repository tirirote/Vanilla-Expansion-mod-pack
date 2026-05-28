# Thunder hit FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:thundering",position:"^ ^1.5 ^",face_player:0,scale:2.1,random_scale:0,random_pos:0,lifetime:16}

function vexp:utils/sound {sound: "minecraft:entity.zombie_villager.cure", type: "player"}

particle end_rod ~ ~1 ~ 0.5 0.2 0.5 0.1 3
particle flash{color:-13639425} ~ ~1 ~ 1 1 1 1 0
particle instant_effect{color:3388671} ~ ~1 ~ 1 0.5 1 0 5
