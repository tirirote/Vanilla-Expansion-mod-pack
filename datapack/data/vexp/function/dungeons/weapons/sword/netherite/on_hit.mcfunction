# dungeons/sword/on_hit.mcfunction
# @s is the target entity
#Mark mob
function vexp:dungeons/states/nether_marked

function vexp:utils/motion/apply_knockback {strength:-1, y:0.2}

# Visuals
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_sword_hit
particle large_smoke ~ ~1 ~ .2 .2 .2 0.1 3
particle lava ~ ~1 ~ .2 .2 .2 0 1
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
