# Custom hook while mob eats
# @s is the custom mob

execute positioned ~ ~ ~ run particle item{item:"dead_bush"} ^ ^ ^0.5 0.1 0.1 0.1 0.05 3
function vexp:utils/sound {sound: "minecraft:entity.generic.eat", type: "player"}
