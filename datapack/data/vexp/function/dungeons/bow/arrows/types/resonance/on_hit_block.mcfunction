# dungeons/bow/arrows/types/common/on_hit_block.mcfunction
# @s is a common-quality bow arrow

particle glow ~ ~ ~ 0.2 0.2 0.2 0.1 1
particle squid_ink ~ ~ ~ .1 .1 .1 0.1 3
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk.break", type: "player"}
