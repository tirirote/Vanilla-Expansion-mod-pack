# Punch hit FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:punch_swoosh",position:"^ ^ ^",face_player:1,scale:1.0,random_scale:1,random_pos:1,lifetime:8}
particle minecraft:crit ~ ~-.25 ~ 0.2 0.2 0.2 1 5
particle minecraft:flash{color:-2039584} ~ ~ ~ 0 0 0 1 1
function vexp:utils/sound {sound: "minecraft:entity.player.attack.crit", type: "player"}

