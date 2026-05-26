# dungeons/bow/arrows/types/common/on_hit_block.mcfunction
# @s is a common-quality bow arrow

function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.1, 0.1], finalColor: [0.4, 0.8, 0.65], scale: 1.7, dX: .2, dY: .2, dZ: .2, speed: 1, count: 3}
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.glow_ink_sac.use", type: "player"}
