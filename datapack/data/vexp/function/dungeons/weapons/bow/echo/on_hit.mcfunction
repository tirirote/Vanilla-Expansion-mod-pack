# dungeons/bow/resonance/on_hit.mcfunction
# @s is the target entity

function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.2}
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_punch_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk.break", type: "player"}
