#Custom on Hurt hook
execute unless block ~ ~-0.2 ~ #replaceable if block ^ ^ ^0.5 #replaceable rotated ~180 ~ run tp @s ^ ^ ^0.5
function vexp:utils/sound {sound: "minecraft:entity.phantom.hurt", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.strider.hurt", type: "player"}
