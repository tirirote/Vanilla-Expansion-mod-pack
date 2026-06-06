# dungeons/bow/on_hit.mcfunction
# @s is the target entity

function vexp:utils/motion/apply_knockback {strength:-0.25, y:0.2}
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_punch_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/diamond_hit
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}

