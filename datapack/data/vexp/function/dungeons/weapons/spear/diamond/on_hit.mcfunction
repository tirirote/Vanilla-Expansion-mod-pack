# dungeons/spear/diamond/on_hit.mcfunction
# @s is the target entity

# Forward thrust knockback
function vexp:utils/motion/apply_knockback {strength:-0.8, y:0.1}

# Visuals
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_sword_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/diamond_hit
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}
