# When target hitted by special attack
# @s is the target
effect give @s nausea 15 1 true

particle crit ~ ~1 ~ 0.2 0.2 0.2 0.5 5
particle block{block_state:sand} ~ ~1 ~ 0.35 0.35 0.35 0.5 15
function vexp:utils/sound {sound: "minecraft:block.sand.break", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.player.attack.weak", type: "player"}
