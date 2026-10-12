summon zombie ~ ~ ~ {IsBaby:0b}
execute as @e[type=zombie,distance=..1,sort=nearest,limit=1] at @s run function vexp:custom_mobs/mobs/vanguarder/setup

#Feedback
particle block{block_state:"tuff_bricks"} ~ ~1 ~ 0.1 0.35 0.1 0.25 50
particle dust_color_transition{from_color:8359329,to_color:5397865,scale:2.1} ~ ~1 ~ 0.2 0.5 0.2 1 5
function vexp:utils/sound {sound: "minecraft:entity.evoker.prepare_attack", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:block.tuff_bricks.break", type: "player", pitch:1}

