# Gold armor aura buff
function vexp:dungeons/states/gold_buffed
particle flash{color:-655515} ~ ~ ~ 1 1 1 1 0
particle instant_effect{color:16383904} ~ ~ ~ 0.5 0.1 0.5 0 15
particle instant_effect{color:16763188} ~ ~ ~ 0.5 0.1 0.5 0 5
particle dust_color_transition{from_color:16383904,to_color:16763188,scale:1.7} ~ ~ ~ 0.5 0.1 0.5 1 5
particle end_rod ~ ~ ~ 0.5 0.1 0.5 0.05 1
function vexp:utils/sound {sound: "minecraft:entity.ender_eye.death", type: "player", pitch:1}
