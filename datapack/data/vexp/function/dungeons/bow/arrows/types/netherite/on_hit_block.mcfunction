# dungeons/bow/arrows/types/common/on_hit_block.mcfunction
# @s is a common-quality bow arrow

particle flame ~ ~ ~ .25 .25 .25 0.01 3
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 0.8, dX: 0.35, dY: 0.35, dZ: 0.35, speed: 1, count: 5}
function vexp:utils/sound {sound: "minecraft:block.fire.extinguish", type: "player"}
