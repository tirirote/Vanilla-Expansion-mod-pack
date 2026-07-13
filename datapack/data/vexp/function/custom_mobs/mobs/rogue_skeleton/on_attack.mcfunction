# On attack custom feedback
# @s is the custom mob
execute positioned ~ ~1 ~ run particle sweep_attack ^ ^ ^1 1 1 1 1 0
function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player", pitch:1}
