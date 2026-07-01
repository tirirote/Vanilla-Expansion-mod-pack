# Custom hook while mob eats
# @s is the custom mob
execute positioned ~ ~0.5 ~ run particle item{item:"wheat"} ^ ^ ^0.6 0.1 0.1 0.1 0.05 5
function vexp:utils/sound {sound: "minecraft:entity.panda.eat", type: "player"}
