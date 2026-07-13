#On special attack
#Lapis Special Attack Feedback
execute if block ^ ^ ^-0.5 #replaceable run tp @s ^ ^ ^-0.5

execute positioned ~ ~1 ~ run particle flash{color:-13355028} ^ ^ ^1 1 1 1 1 0

execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^1.5 0.5 0.1 0.5 0.3 5
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^2 0.4 0.1 0.4 0.2 5
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^2.5 0.3 0.1 0.3 0.1 5
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^3 0.2 0.1 0.2 0.3 5
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^3.5 0.2 0.1 0.2 0.3 5

execute positioned ~ ~1 ~ run particle instant_effect{color:1668607} ^ ^ ^1.5 0.5 0.1 0.5 1 1
execute positioned ~ ~1 ~ run particle instant_effect{color:1668607} ^ ^ ^2 0.4 0.1 0.4 1 1
execute positioned ~ ~1 ~ run particle instant_effect{color:1668607} ^ ^ ^2.5 0.3 0.1 0.3 1 1
execute positioned ~ ~1 ~ run particle instant_effect{color:1668607} ^ ^ ^3 0.2 0.1 0.2 1 1
execute positioned ~ ~1 ~ run particle instant_effect{color:1668607} ^ ^ ^3.5 0.2 0.1 0.2 1 1

function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.zombie.hurt", type: "player", pitch:1}
