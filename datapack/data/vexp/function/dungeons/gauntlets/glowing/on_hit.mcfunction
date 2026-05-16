# dungeons/gauntlets/glowing/on_hit.mcfunction
# @s is the target entity

# Mark mob
function vexp:dungeons/states/glow_marked

# Slight pull
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.1}

# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/weak_punch_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/glowing_hit
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.glow_ink_sac.use", type: "player"}
