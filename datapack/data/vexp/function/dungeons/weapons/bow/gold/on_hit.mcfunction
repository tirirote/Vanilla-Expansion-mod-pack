# dungeons/bow/on_hit.mcfunction
# @s is the target entity

function vexp:utils/motion/apply_knockback {strength:-0.25, y:0.2}
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_punch_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/gold_hit
function vexp:utils/sound {sound: "minecraft:entity.ender_eye.death", type: "player"}
