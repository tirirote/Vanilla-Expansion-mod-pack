# Netherite hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:netherite_hit",position:"^ ^1 ^0.5",face_player:1,scale:0.8,random_pos:0.5,lifetime:7,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle flash{color:-8637360} ~ ~ ~ 1 1 1 1 0
particle instant_effect{color:5452865} ~ ~ ~ 0.35 0.35 0.35 0 5
particle flame ~ ~ ~ .35 .35 .35 0.02 3
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 0.8, dX: 0.35, dY: 0.35, dZ: 0.35, speed: 1, count: 5}

function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player", pitch:1}
