# @s is the target entity

# Slight pushback
function vexp:utils/motion/apply_knockback {strength:-0.2, y:0.1}

# Visual feedback
execute positioned ~ ~1 ~ run function vexp:utils/hits/weak_sword_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/diamond_hit
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}
