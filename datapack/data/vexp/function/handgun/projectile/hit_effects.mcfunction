# Sonido de disparo y partículas iniciales
particle minecraft:large_smoke ~ ~ ~ 0 0 0 0.05 3
particle minecraft:lava ~ ~ ~ 0 0 0 0 1
particle minecraft:explosion ~ ~ ~ 0 0 0 0.05 1

function vexp:utils/sound {sound: "minecraft:entity.firework_rocket.large_blast", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.firework_rocket.twinkle_far", type: "player"}