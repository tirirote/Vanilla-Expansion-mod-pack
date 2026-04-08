# Punch hit FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:punch_swoosh"}
particle minecraft:crit ~ ~ ~ 0.2 0.2 0.2 0.05 3
particle minecraft:flash{color:-2829100} ~ ~ ~ 0 0 0 1 1
function vexp:utils/sound {sound: "minecraft:entity.player.attack.strong", type: "player"}

