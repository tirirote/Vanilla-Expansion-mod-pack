summon zombie ~ ~ ~ {NoAI:0b}
execute as @e[type=zombie,distance=..1,sort=nearest,limit=1] at @s run function vexp:custom_mobs/mobs/nightcrower/setup

#Feedback
particle block{block_state:"hay_block"} ~ ~1 ~ 0.1 0.35 0.1 0.25 50
particle dust_color_transition{from_color:7626051,to_color:4601380,scale:2.1} ~ ~ ~ 0.5 0 0.5 1 5
function vexp:utils/sound {sound: "minecraft:entity.evoker.prepare_attack", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:block.grass.break", type: "player", pitch:1}

