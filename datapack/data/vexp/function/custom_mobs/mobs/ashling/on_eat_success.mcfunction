# When mob finally eats the item
# @s is the custom mob

execute positioned ~ ~0.5 ~ run particle large_smoke ^ ^ ^1 0 0 0 0.05 5
function vexp:utils/sound {sound: "minecraft:entity.parrot.imitate.camel_husk", type: "player", pitch:1}
