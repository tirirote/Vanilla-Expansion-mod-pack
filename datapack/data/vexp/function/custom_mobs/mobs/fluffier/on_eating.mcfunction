# Custom hook while mob eats
# @s is the custom mob
execute if items entity @s weapon.mainhand wheat positioned ~ ~0.5 ~ run particle item{item:"wheat"} ^ ^ ^0.6 0.1 0.1 0.1 0.05 5
execute if items entity @s weapon.mainhand carrot positioned ~ ~0.5 ~ run particle item{item:"carrot"} ^ ^ ^0.6 0.1 0.1 0.1 0.05 5
execute if items entity @s weapon.mainhand potato positioned ~ ~0.5 ~ run particle item{item:"potato"} ^ ^ ^0.6 0.1 0.1 0.1 0.05 5
execute if items entity @s weapon.mainhand beetroot positioned ~ ~0.5 ~ run particle item{item:"beetroot"} ^ ^ ^0.6 0.1 0.1 0.1 0.05 5
execute if items entity @s weapon.mainhand red_mushroom positioned ~ ~0.5 ~ run particle item{item:"red_mushroom"} ^ ^ ^0.6 0.1 0.1 0.1 0.05 5
execute if items entity @s weapon.mainhand brown_mushroom positioned ~ ~0.5 ~ run particle item{item:"brown_mushroom"} ^ ^ ^0.6 0.1 0.1 0.1 0.05 5

function vexp:utils/sound {sound: "minecraft:entity.panda.eat", type: "player", pitch:1}
