# Glowing hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:glowing_hit",position:"^ ^1 ^0.5",face_player:1,scale:0.8,random_pos:0.5,lifetime:7,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle flash{color:-6488120} ~ ~ ~ 0 0 0 0 0
particle glow ~ ~ ~ 0.25 0.25 0.25 0 3
particle instant_effect{color:1334358} ~ ~ ~ 0.35 0.35 0.35 0 2
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.1, 0.1], finalColor: [0.4, 0.8, 0.65], scale: 1.7, dX: 0.35, dY: 0.35, dZ: 0.35, speed: 1, count: 5}

function vexp:utils/sound {sound: "minecraft:entity.glow_squid.squirt", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player", pitch:1}
