# @s is the target entity

#Mark mob
function vexp:dungeons/states/nether_marked

# Slight pushback
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

# Visual feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_sword_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/netherite_hit
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}

