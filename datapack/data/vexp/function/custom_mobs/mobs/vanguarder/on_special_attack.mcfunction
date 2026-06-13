# On special attack feedback hook
# @s is the custom mob
execute if block ^ ^-1 ^0.5 #replaceable run tp @s ^ ^-2 ^0.5
execute positioned ~ ~-2 ~ run function vexp:utils/feedback/dust_particle {initialColor:[0.2,0.4,0.5],finalColor:[0.4,0.6,0.5],scale:2.1,dX:0.5,dY:0.2,dZ:0.5,speed:1,count:10}
particle block{block_state:"tuff_bricks"} ~ ~-2 ~ 1 0.2 1 0.35 50
particle enchanted_hit ~ ~-2 ~ 0.5 0.1 0.5 0.5 25
function vexp:utils/sound {sound: "minecraft:item.mace.smash_ground", type: "player"}
