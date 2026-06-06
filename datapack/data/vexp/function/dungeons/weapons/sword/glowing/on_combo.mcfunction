# dungeons/sword/glowing/on_combo.mcfunction
# @s is the target entity (one of them)

# Push wave
execute as @e[predicate=vexp:is_target,distance=..3.5] at @s positioned ~ ~1 ~ run function vexp:dungeons/weapons/sword/glowing/wave

# Strong knockback for the primary target
function vexp:utils/motion/apply_knockback {strength:-0.4, y:1}

# Visual feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_sword_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/glowing_hit
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.glow_squid.squirt", type: "player"}
