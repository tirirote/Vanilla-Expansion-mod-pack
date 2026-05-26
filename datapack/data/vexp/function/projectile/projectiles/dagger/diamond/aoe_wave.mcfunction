# AoE wave
particle instant_effect{color:9437155} ~ ~ ~ .2 .2 .2 0 3
particle instant_effect{color:49358} ~ ~ ~ .2 .2 .2 0 1
particle end_rod ~ ~ ~ .2 .2 .2 0 1
particle flash{color:-7340061} ~ ~ ~ 0.0 0.0 0.0 1 0
function vexp:utils/feedback/dust_particle {initialColor: [0.5, 0.7, 0.65], finalColor: [0.6, 0.9, 0.85], scale: 0.8, dX: 0.5, dY: 0.5, dZ: 0.5, speed: 0.05, count: 10}

function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}

execute as @p[tag=vexp.dagger_owner,limit=1] run function vexp:dungeons/states/diamond_buffed
