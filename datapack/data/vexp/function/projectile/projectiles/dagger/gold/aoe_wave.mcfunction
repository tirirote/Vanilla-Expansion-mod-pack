# AoE wave
particle instant_effect{color:16776562} ~ ~ ~ .2 .2 .2 0 3
particle instant_effect{color:16763707} ~ ~ ~ .2 .2 .2 0 1
particle end_rod ~ ~ ~ .2 .2 .2 0 1
particle flash{color:-655515} ~ ~ ~ 0.0 0.0 0.0 1 0
function vexp:utils/feedback/dust_particle {initialColor: [0.75, 0.7, 0.4], finalColor: [0.9, 0.9, 0.75], scale: 0.8, dX: 0.5, dY: 0.5, dZ: 0.5, speed: 0.05, count: 10}

function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}

execute as @p[tag=vexp.dagger_owner,limit=1] run function vexp:dungeons/states/gold_buffed
