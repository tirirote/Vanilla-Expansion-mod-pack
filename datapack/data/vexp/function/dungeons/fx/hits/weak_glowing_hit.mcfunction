# Weak glowing hit
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:weak_glowing_hit",position:"^ ^1 ^0.5",face_player:1,scale:0.8,random_pos:0.5,lifetime:6,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle glow ~ ~ ~ 0.25 0.25 0.25 0 1
particle instant_effect{color:1334358} ~ ~ ~ 0.35 0.35 0.35 0 3

function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.glow_ink_sac.use", type: "player"}
