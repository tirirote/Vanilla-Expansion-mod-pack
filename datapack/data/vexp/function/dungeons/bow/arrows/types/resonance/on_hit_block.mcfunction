# dungeons/bow/arrows/types/common/on_hit_block.mcfunction
# @s is a common-quality bow arrow

function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.7, 0.7], scale: 1.7, dX: .2, dY: .2, dZ: .2, speed: 1, count: 5}
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk.break", type: "player"}
