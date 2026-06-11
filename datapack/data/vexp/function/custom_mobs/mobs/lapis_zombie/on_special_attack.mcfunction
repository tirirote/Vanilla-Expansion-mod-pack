#On special attack
#Lapis Special Attack Feedback
execute if block ^ ^0.25 ^0.5 #replaceable run tp @s ^ ^0.25 ^0.5 ~ ~12

execute positioned ~ ~1 ~ run particle flash{color:-13355028} ^ ^ ^1 1 1 1 1 0

execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^1 0.6 0.1 0.6 0.5 15
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^1.5 0.5 0.1 0.5 0.3 10
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^2 0.4 0.1 0.4 0.2 8
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^2.5 0.3 0.1 0.3 0.1 6
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^3 0.2 0.1 0.2 0.3 4
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^3.5 0.2 0.1 0.2 0.3 3

execute positioned ~ ~1 ~ run particle instant_effect{color:1668607} ^ ^ ^1 0.6 0.1 0.6 0.5 8
execute positioned ~ ~1 ~ run particle instant_effect{color:1668607} ^ ^ ^1.5 0.5 0.1 0.5 0.5 8
execute positioned ~ ~1 ~ run particle instant_effect{color:1668607} ^ ^ ^2 0.4 0.1 0.4 0.5 6
execute positioned ~ ~1 ~ run particle instant_effect{color:1668607} ^ ^ ^2.5 0.3 0.1 0.3 0.5 6
execute positioned ~ ~1 ~ run particle instant_effect{color:1668607} ^ ^ ^3 0.2 0.1 0.2 0.5 4
execute positioned ~ ~1 ~ run particle instant_effect{color:1668607} ^ ^ ^3.5 0.2 0.1 0.2 0.5 4

function vexp:utils/sound {sound: "minecraft:entity.evoker.cast_spell", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.zombie.hurt", type: "player"}
