#Golden weapons hit particles
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:gold_hit",position:"^ ^1 ^0.5",face_player:1,scale:0.8,random_pos:0.5,lifetime:6,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle flash{color:-655515} ~ ~ ~ 1 1 1 1 0
particle instant_effect{color:16580442} ~ ~ ~ 0.35 0.35 0.35 0 1
particle instant_effect{color:16765502} ~ ~ ~ 0.35 0.35 0.35 0 2
function vexp:utils/feedback/dust_particle {initialColor: [0.75, 0.8, 0.2], finalColor: [0.85, 0.75, 0.3], scale: 0.8, dX: 0.35, dY: 0.35, dZ: 0.35, speed: 0.05, count: 5}
particle end_rod ~ ~ ~ 0.35 0.35 0.35 0.05 1

function vexp:utils/sound {sound: "minecraft:item.spear.hit", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
