# dungeons/scythe/netherite/on_hit.mcfunction
# @s is the target entity

#Tag Mob
function vexp:dungeons/states/nether_marked

# Knockback {strength:1.0, y:0.2}
function vexp:utils/motion/apply_knockback {strength:1.5, y:0.2}

#Fedback
execute positioned ~ ~1 ~ run function vexp:utils/hits/weak_sword_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/netherite_hit
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}

