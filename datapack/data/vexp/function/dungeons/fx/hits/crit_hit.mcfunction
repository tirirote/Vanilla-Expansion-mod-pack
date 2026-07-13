# Sword hit FX
#function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:crit_hit",position:"~ ~1 ~",face_player:1,scale:1.7,random_pos:0,lifetime:7,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle minecraft:instant_effect{color:16775936} ~ ~1 ~ 0.5 0.5 0.5 0 2
particle minecraft:instant_effect{color:6749952} ~ ~1 ~ 0.5 0.5 0.5 0 1
particle minecraft:totem_of_undying ~ ~1 ~ .25 .25 .25 0.05 2
particle flash{color:-4261} ~ ~1 ~ 1 1 1 1 0

function vexp:utils/sound {sound: "minecraft:entity.experience_orb.pickup", type: "player", pitch:1}
