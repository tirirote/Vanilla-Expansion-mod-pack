# On special attack feedback hook
# @s is the custom mob
execute positioned ^ ^1 ^1 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^
execute positioned ^ ^1 ^2 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^
execute positioned ^ ^1 ^3 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^

execute positioned ~ ~1 ~ run particle block{block_state:"tuff_bricks"} ^ ^ ^0.5 0.2 0.2 0.2 0.35 10
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^0.5 0.35 0.35 0.35 0.3 15
function vexp:utils/sound {sound: "minecraft:item.mace.smash_ground", type: "player"}
