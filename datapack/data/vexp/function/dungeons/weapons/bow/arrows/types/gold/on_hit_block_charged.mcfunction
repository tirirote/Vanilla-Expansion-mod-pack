# dungeons/bow/arrows/types/gold/on_hit_block_charged.mcfunction
# @s is a gold-quality bow arrow, tier 3 (charged), hitting a block

function vexp:dungeons/fx/hits/gold_hit
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
