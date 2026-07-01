# Custom hook while mob eats
# @s is the custom mob

execute positioned ~ ~.75 ~ run particle item{item:"porkchop"} ^ ^ ^0.75 0.1 0.1 0.1 0.05 3
function vexp:utils/sound {sound: "minecraft:entity.generic.eat", type: "player"}
