# dungeons/scythe/netherite/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Mark mob
function vexp:dungeons/states/nether_marked

# Knockback {strength:-4.0, y:0.1}
function vexp:utils/motion/apply_knockback with storage vexp:temp {strength:-3.5, y:0.1}

#Fedback
function vexp:utils/hits/strong_sword_hit
particle flash{color:-26073} ~ ~ ~ 0 0 0 0 0
particle large_smoke ~ ~1 ~ .1 .1 .1 0.1 3
particle lava ~ ~1 ~ .2 .2 .2 0 1

function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
