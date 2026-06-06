# Bane Spider FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:bane",position:"^ ^1 ^0.5",face_player:1,scale:1.7,random_pos:0,lifetime:7,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:0,follow_offset_z:0}

particle flash{color:-10867404} ~ ~1 ~ 1 1 1 1 0
particle block_crumble{block_state:"ancient_debris"} ~ ~1 ~ 0.5 0.2 0.5 0.5 5
particle entity_effect{color:-2091902940} ~ ~1 ~ 0.2 0.2 0.2 0 5
particle instant_effect{color:4332323,power:-1} ~ ~1 ~ 0.5 0.2 0.5 0 1
function vexp:utils/sound {sound: "minecraft:block.sculk_shrieker.break", type: "player"}
