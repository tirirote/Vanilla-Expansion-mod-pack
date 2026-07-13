# When mob finally eats the item
# @s is the custom mob
particle totem_of_undying ~ ~0.5 ~ 0.2 0.2 0.2 0.3 5

# Summons item
execute positioned ~ ~0.5 ~ run summon experience_orb ^ ^ ^0.5 {Value:5}
execute positioned ~ ~0.5 ~ run summon experience_orb ^ ^ ^0.5 {Value:3}
execute positioned ~ ~0.5 ~ run summon experience_orb ^ ^ ^0.5 {Value:7}

execute as @e[type=experience_orb,sort=nearest,limit=1] run function vexp:utils/motion/apply_random_motion {range:10, scale:0.01}

function vexp:utils/sound {sound: "minecraft:entity.parrot.imitate.ghast", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player", pitch:1}
