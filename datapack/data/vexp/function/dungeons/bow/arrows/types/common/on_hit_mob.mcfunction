# dungeons/bow/arrows/types/common/on_hit_mob.mcfunction
# @s is a common-quality bow arrow

particle minecraft:crit ~ ~ ~ .2 .2 .2 0.5 5
function vexp:utils/sound {sound: "minecraft:entity.player.attack.weak", type: "player"}
