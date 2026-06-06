# dungeons/scythe/glowing/on_hit.mcfunction
# @s is the target entity

# Knockback
function vexp:utils/motion/apply_knockback {strength:0.75, y:0.15}

execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_sword_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/glowing_hit
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.glow_ink_sac.use", type: "player"}
