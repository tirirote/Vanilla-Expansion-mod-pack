# When player hitted
# @s is the player
function vexp:utils/sound {sound: "minecraft:entity.fox.bite", type: "player"}
particle smoke ~ ~1 ~ 0.35 0.35 0.35 0.05 1
particle instant_effect{color:4471349} ~ ~1 ~ 0.35 0.35 0.35 0 5
effect give @s slowness 5 0 true
