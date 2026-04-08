# Punch hit FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:punch_swoosh"}
particle minecraft:crit ~ ~ ~ 0.2 0.2 0.2 0.1 5
particle minecraft:flash{color:-2039584} ~ ~ ~ 0 0 0 1 1
function vexp:utils/sound {sound: "minecraft:entity.player.attack.crit", type: "player"}

