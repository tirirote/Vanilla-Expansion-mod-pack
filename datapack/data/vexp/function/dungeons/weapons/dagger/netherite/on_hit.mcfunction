# Netherite Dagger On Hit Effects
function vexp:dungeons/states/nether_marked

# Apply knockback to mob
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.1}

execute positioned ~ ~1 ~ run function vexp:utils/hits/weak_sword_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/netherite_hit

function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
