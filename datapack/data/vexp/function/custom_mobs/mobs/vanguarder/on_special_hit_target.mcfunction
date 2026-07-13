# When target hitted by special attack
# @s is the target
execute positioned ~ ~1 ~ run particle block{block_state:"tuff_bricks"} ^ ^ ^0.5 0.2 0.2 0.2 0.2 25
execute if block ^ ^ ^-1 #replaceable run tp @s ^ ^ ^-1
function vexp:utils/sound {sound: "minecraft:item.mace.smash_ground", type: "player", pitch:1}
effect give @s slowness 10 3 true
