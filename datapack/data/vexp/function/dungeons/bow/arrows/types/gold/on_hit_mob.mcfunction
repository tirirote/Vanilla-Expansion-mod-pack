# dungeons/bow/arrows/types/gold/on_hit_mob.mcfunction
# @s is a gold-quality bow arrow

#Golden weapons hit particles
particle instant_effect{color:16763707} ~ ~ ~ .2 .2 .2 0.05 3
particle minecraft:entity_effect{color:2130688031} ~ ~1 ~ .2 .2 .2 0.05 3
particle crit ~ ~ ~ .25 .25 .25 .5 10
function vexp:utils/sound {sound: "minecraft:entity.ender_eye.death", type: "player"}
