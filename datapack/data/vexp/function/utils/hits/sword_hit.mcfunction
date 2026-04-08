# Sword Hit FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:sword_swoosh"}
particle minecraft:enchanted_hit ~ ~ ~ 0.2 0.2 0.2 0.05 3
particle minecraft:flash{color:-2829100} ~ ~ ~ 0 0 0 1 1
function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player"}
