# When target hitted by special attack
# @s is the target
effect give @s slowness 5 1 true

particle large_smoke ~ ~1 ~ 0.2 0.2 0.2 0.05 3
function vexp:utils/sound {sound: "minecraft:entity.generic.extinguish_fire", type: "player", pitch:1}
