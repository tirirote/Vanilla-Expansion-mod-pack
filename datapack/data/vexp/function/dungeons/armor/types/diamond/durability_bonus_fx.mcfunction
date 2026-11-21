# Feedback for durability bonus
particle instant_effect{color:3788726,power:1} ~ ~1 ~ 0.35 0.35 0.35 1 3
execute positioned ~ ~1 ~ run function vexp:utils/feedback/trail_particle {col:-7340061, duration:3, dX:1, dY:1, dZ:1, count:15, speed:1}

function vexp:utils/sound {sound: "minecraft:block.amethyst_block.chime", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:block.trial_spawner.spawn_item_begin", type: "player", pitch:2}
