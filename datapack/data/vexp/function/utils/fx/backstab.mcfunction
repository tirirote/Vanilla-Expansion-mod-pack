# Backstab Feedback
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:backstab",position:"^ ^1.5 ^",face_player:0,scale:2.1,random_scale:0,random_pos:0,lifetime:16}

particle block_crumble{block_state:"nether_portal"} ~ ~1 ~ 0.5 0.2 0.5 0.5 25
particle instant_effect{color:16736418} ~ ~1 ~ 0.5 0.2 0.5 0.5 5
particle squid_ink ~ ~1 ~ 0.5 0.2 0.5 0.05 5
particle flash{color:-2744898} ~ ~1 ~ 0.0 0.0 0.0 1 0
function vexp:utils/sound {sound: "minecraft:item.spear.hit", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.squid.squirt", type: "player"}
