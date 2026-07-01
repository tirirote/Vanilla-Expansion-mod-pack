# On special attack feedback hook
# @s is the custom mob

particle instant_effect{color:16774558} ~ ~ ~ 0.5 0.2 0.5 0 15
particle end_rod ~ ~ ~ 0.5 0.2 0.5 0.05 3

#Friendly player buff
effect give @p[distance=..3.5] speed 20 1 true

function vexp:utils/sound {sound: "minecraft:block.amethyst_cluster.hit", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.happy_ghast.ambient", type: "player"}
