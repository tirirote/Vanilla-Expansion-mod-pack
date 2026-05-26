# dungeons/scythe/netherite/on_combo.mcfunction
# @s is the target entity

# Mark mob
function vexp:dungeons/states/nether_marked

# Knockback {strength:-4.0, y:0.1}
function vexp:utils/motion/apply_knockback with storage vexp:temp {strength:-3.5, y:0.1}

#Fedback
execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_sword_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/netherite_hit

function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
