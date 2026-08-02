# Freezing Feednack
function vexp:utils/feedback/swoosh/spawn_swoosh {model:"vexp:freeze",position:"~ ~1 ~",face_player:1,scale:2.1,random_pos:0,lifetime:10,spawn_on_player:0,follow_owner:0,follow_offset_x:0,follow_offset_y:1,follow_offset_z:0}

particle flash{color:-5046273} ~ ~1 ~ 1 1 1 1 0
particle snowflake ~ ~1 ~ 1 0.2 1 0.1 3
particle entity_effect{color:-1850085377} ~ ~1 ~ 0.5 0.2 0.5 1 3
particle instant_effect{color:10416383} ~ ~1 ~ 0.5 0.2 0.5 1 1

function vexp:utils/sound {sound: "minecraft:block.trial_spawner.spawn_item", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:block.vault.eject_item", type: "player", pitch:1}
