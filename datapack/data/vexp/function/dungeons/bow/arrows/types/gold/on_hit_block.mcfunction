# dungeons/bow/arrows/types/gold/on_hit_block.mcfunction
# @s is a gold-quality bow arrow

particle instant_effect{color:16763707} ~ ~ ~ .2 .2 .2 0 3
function vexp:utils/sound {sound: "minecraft:entity.ender_eye.death", type: "player"}
