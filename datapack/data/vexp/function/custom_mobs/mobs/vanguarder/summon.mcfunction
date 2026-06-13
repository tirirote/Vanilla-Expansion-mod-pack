summon zombie ~ ~ ~ {IsBaby:0b}
execute as @e[type=zombie,distance=..1,sort=nearest,limit=1] at @s run function vexp:custom_mobs/mobs/vanguarder/setup

#Feedback
particle block{block_state:"tuff_bricks"} ~ ~1 ~ 0.1 0.35 0.1 0.25 50
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor:[0.2,0.4,0.5],finalColor:[0.4,0.6,0.5],scale:2.1,dX:0.2,dY:0.5,dZ:0.2,speed:1,count:3}
function vexp:utils/sound {sound: "minecraft:entity.evoker.prepare_attack", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.tuff_bricks.break", type: "player"}

