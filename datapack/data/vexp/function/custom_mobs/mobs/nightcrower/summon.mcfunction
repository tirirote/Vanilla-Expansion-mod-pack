summon zombie ~ ~ ~ {NoAI:0b}
execute as @e[type=zombie,distance=..1,sort=nearest,limit=1] at @s run function vexp:custom_mobs/mobs/nightcrower/setup

#Feedback
particle block{block_state:"hay_block"} ~ ~1 ~ 0.1 0.35 0.1 0.25 50
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor:[0.4,0.35,0.2],finalColor:[0.5,0.5,0.3],scale:2.1,dX:0.2,dY:0.5,dZ:0.2,speed:1,count:3}
function vexp:utils/sound {sound: "minecraft:entity.evoker.prepare_attack", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:block.grass.break", type: "player", pitch:1}

