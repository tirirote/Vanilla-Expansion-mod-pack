# dungeons/spear/netherite/on_hit.mcfunction
# @s is the target entity

# Mark mob
function vexp:dungeons/states/nether_marked

function vexp:utils/motion/apply_knockback {strength:-1.0, y:0.1}

# Visuals
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_sword_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/netherite_hit
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
