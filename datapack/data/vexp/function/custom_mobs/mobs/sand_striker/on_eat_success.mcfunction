# When mob finally eats the item
# @s is the custom mob

execute positioned ~ ~0.5 ~ run particle smoke ^ ^ ^-0.5 0.1 0.1 0.1 0.05 3
execute positioned ~ ~0.5 ~ run particle item{item:"composter"} ^ ^ ^-0.5 0.1 0.1 0.1 0.05 25

# Summons item
execute positioned ~ ~0.5 ~ run summon item ^ ^ ^-0.5 {Item:{id:"gunpowder",count:1}}

execute as @e[type=item,sort=nearest,limit=1] run function vexp:utils/motion/apply_random_motion {range:10, scale:0.01}

function vexp:utils/sound {sound: "minecraft:entity.silverfish.ambient", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.composter.ready", type: "player"}
