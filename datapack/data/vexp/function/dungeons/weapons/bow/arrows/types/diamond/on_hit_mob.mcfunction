# dungeons/bow/arrows/types/diamond/on_hit_mob.mcfunction
# @s is a diamond-quality bow arrow

particle instant_effect{color:9437155} ~ ~ ~ .2 .2 .2 0.05 5
particle minecraft:entity_effect{color:-2127926122} ~ ~ ~ .2 .2 .2 0.05 3
particle enchanted_hit ~ ~ ~ .25 .25 .25 .5 10
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}
