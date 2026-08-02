# Wildness FX
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:wildness",position:"~ ~1 ~",face_player:0,scale:2.7,random_pos:0,lifetime:11,spawn_on_player:1,follow_owner:1,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle flash{color:-26053} ~ ~1 ~ 1 1 1 1 0
particle instant_effect{color:7800626} ~ ~1 ~ 0.5 0.2 0.5 0 2
particle instant_effect{color:16733483} ~ ~1 ~ 0.5 0.2 0.5 0 1
particle instant_effect{color:16748841} ~ ~1 ~ 0.5 0.2 0.5 0 1
particle raid_omen ~ ~1 ~ 0.5 0.2 0.5 0 1

execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.6, 0.4, 0.2], finalColor: [0.4, 0.1, 0.3], scale: 1.7, dX: 0.5, dY: 0.1, dZ: 0.5, speed: 1, count: 3}
