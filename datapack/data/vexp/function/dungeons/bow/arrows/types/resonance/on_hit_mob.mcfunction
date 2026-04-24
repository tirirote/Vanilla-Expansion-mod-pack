# dungeons/bow/arrows/types/common/on_hit_mob.mcfunction
# @s is a common-quality bow arrow

particle sculk_charge_pop ~ ~ ~ .2 .2 .2 0.1 5
particle glow ~ ~ ~ 0.2 0.2 0.2 0.1 1
particle squid_ink ~ ~ ~ .1 .1 .1 0.1 3
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk.break", type: "player"}
