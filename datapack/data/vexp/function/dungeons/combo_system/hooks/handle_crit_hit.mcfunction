tag @s add vexp.hitted.critical

#Feedback

particle minecraft:instant_effect{color:16775936} ~ ~1 ~ 0.5 0.5 0.5 0 1
particle minecraft:instant_effect{color:6749952} ~ ~1 ~ 0.5 0.5 0.5 0 1

particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.5 0.5 0.2 5
particle flash{color:-4676088} ~ ~1 ~ 0.0 0.0 0.0 0 0

function vexp:utils/sound {sound: "minecraft:entity.experience_orb.pickup", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.vault.close_shutter", type: "player"}
