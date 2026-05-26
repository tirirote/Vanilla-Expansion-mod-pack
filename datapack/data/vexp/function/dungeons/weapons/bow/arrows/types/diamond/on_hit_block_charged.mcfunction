# dungeons/bow/arrows/types/diamond/on_hit_block_charged.mcfunction
# @s is a diamond-quality bow arrow, tier 3 (charged), hitting a block

function vexp:utils/hits/diamond_hit
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
