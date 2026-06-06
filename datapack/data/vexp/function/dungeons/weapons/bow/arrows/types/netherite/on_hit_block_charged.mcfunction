# dungeons/bow/arrows/types/netherite/on_hit_block_charged.mcfunction
# @s is a netherite-quality bow arrow, tier 3 (charged), hitting a block
# Extra block impact effects for tier 3

function vexp:dungeons/fx/hits/netherite_hit
function vexp:utils/sound {sound: "minecraft:block.fire.extinguish", type: "player"}
