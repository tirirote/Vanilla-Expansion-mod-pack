# On special attack feedback hook
# @s is the custom mob
tp @s ^ ^ ^ facing entity @e[tag=vexp.mob_target,sort=nearest,limit=1] eyes
execute positioned ~ ~0.5 ~ run particle flash{color:-9740975} ^ ^ ^1 1 1 1 1 0

execute positioned ~ ~0.5 ~ run particle block{block_state:sand} ^ ^ ^1 0.2 0.2 0.2 0.2 5
execute positioned ~ ~0.5 ~ run particle block{block_state:sand} ^ ^ ^1.5 0.2 0.2 0.2 0.2 3
execute positioned ~ ~0.5 ~ run particle block{block_state:sand} ^ ^ ^2 0.2 0.2 0.2 0.2 3
execute positioned ~ ~0.5 ~ run particle block{block_state:sand} ^ ^ ^2.5 0.2 0.2 0.2 0.2 2
execute positioned ~ ~0.5 ~ run particle block{block_state:sand} ^ ^ ^3 0.2 0.2 0.2 0.2 2
execute positioned ~ ~0.5 ~ run particle block{block_state:sand} ^ ^ ^3.5 0.2 0.2 0.2 0.2 1

execute positioned ~ ~0.5 ~ run particle instant_effect{color:6905158} ^ ^ ^1 0.2 0.2 0.2 0.2 1
execute positioned ~ ~0.5 ~ run particle instant_effect{color:6905158} ^ ^ ^1.5 0.2 0.2 0.2 0.2 1
execute positioned ~ ~0.5 ~ run particle instant_effect{color:6905158} ^ ^ ^2 0.2 0.2 0.2 0.2 1
execute positioned ~ ~0.5 ~ run particle instant_effect{color:6905158} ^ ^ ^2.5 0.2 0.2 0.2 0.2 1
execute positioned ~ ~0.5 ~ run particle instant_effect{color:6905158} ^ ^ ^3 0.2 0.2 0.2 0.2 1
execute positioned ~ ~0.5 ~ run particle instant_effect{color:6905158} ^ ^ ^3.5 0.2 0.2 0.2 0.2 1
function vexp:utils/sound {sound: "minecraft:entity.llama.spit", type: "player", pitch:1}
