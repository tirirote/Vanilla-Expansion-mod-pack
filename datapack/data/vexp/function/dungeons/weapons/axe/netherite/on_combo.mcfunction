# dungeons/axe/on_combo.mcfunction
# @s is the target entity (one of them)

#Mark mob
function vexp:dungeons/states/nether_marked

# 2. Strong knockback for the primary target
function vexp:utils/motion/apply_knockback {strength:-0.8, y:0.2}

#Player buff
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/nether_buffed

# Visual feedback
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_sword_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/netherite_hit
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}

