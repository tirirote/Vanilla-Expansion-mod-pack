# dungeons/bow/arrows/types/resonance/on_hit_block_charged.mcfunction
# @s is a resonance-quality bow arrow, tier 3 (charged), hitting a block
# Extra block impact effects for tier 3

function vexp:utils/hits/glowing_hit
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.glow_squid.squirt", type: "player"}
