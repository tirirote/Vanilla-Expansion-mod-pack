#Diamond weapons hit particles
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:weak_diamond_hit",position:"^ ^1 ^0.5",face_player:1,scale:0.8,random_pos:0.5,lifetime:6,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle instant_effect{color:49358} ~ ~ ~ 0.25 0.25 0.25 0 1
function vexp:utils/feedback/dust_particle {initialColor: [0.35, 0.6, 0.5], finalColor: [0.4, 0.65, 0.8], scale: 0.8, dX: 0.35, dY: 0.35, dZ: 0.35, speed: 1, count: 3}

function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.trident.hit", type: "player"}
