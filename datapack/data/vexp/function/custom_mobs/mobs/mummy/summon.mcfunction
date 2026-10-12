summon husk ~ ~ ~ {NoAI:0b}
execute as @e[type=husk,distance=..1,sort=nearest,limit=1] at @s run function vexp:custom_mobs/mobs/mummy/setup

# Feedback
particle block{block_state:"cobweb"} ~ ~1 ~ 0.1 0.35 0.1 0.25 50
particle dust_color_transition{from_color:14538414,to_color:10585444,scale:2.1} ~ ~1 ~ 0.2 0.5 0.2 1 5
function vexp:utils/sound {sound: "minecraft:entity.husk.converted_to_zombie", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:block.cobweb.break", type: "player", pitch:1}
