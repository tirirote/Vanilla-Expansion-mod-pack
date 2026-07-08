# Custom on Hurt hook
# @s is the custom mob
execute if block ^ ^ ^0.5 #replaceable rotated ~180 ~ run tp @s ^ ^ ^0.5
function vexp:utils/sound {sound: "minecraft:entity.vindicator.hurt", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.parched.hurt", type: "player"}
